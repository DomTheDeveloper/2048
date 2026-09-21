#!/usr/bin/env python3
"""Fine-tune Laya on 2048 decisions (GENIUS as the teacher).

    node test/decision.js --dataset ai/data/2048-feature.jsonl 20000
    python3 ai/finetune_laya_2048.py --data ai/data/2048-feature.jsonl --out ai/laya-2048
    python3 ai/bridge.py --laya ai/laya-2048

Laya's base checkpoints score close to random on typed decisions they
were not trained for (their own README says so: 0.36 zero-shot on the
typed-decisions benchmark, 0.766 after fine-tuning), so a Laya that
plays 2048 well is a Laya fine-tuned on 2048. This is Convai
Innovations' own recipe from the laya repository's Kaggle notebook
(RLCD: policy gradient against a strictly proper scoring rule, plus
soft cross-entropy toward the teacher's distribution, then temperature
calibration), reduced to one process and pointed at the JSONL that
test/decision.js writes: one line per decision with the state, the
question and the teacher's probabilities over the shuffled labels.

Needs a GPU for anything beyond a smoke test (ModernBERT-large, 421M
parameters: about 4-5 hours for 30k questions on two T4s in the
original notebook). Launch under torchrun for several GPUs; a single
process runs on one GPU, MPS or CPU.
"""
import argparse
import json
import os
import random
import sys
import time

import torch
from safetensors.torch import load_file, save_file
from transformers import AutoTokenizer

from laya.agent import _fix_tokenizer_config
from laya.common import QTYPES, build_model, build_sequence, proper_reward, render_options


def resolve_model_dir(model_id):
    if os.path.isdir(model_id):
        return model_id
    from huggingface_hub import snapshot_download
    return snapshot_download(model_id)


def build_item(tok, cfg, state, q, gold):
    crit = q.get("criteria", {})
    keys = list(crit.keys())
    target = [float(gold["probabilities"].get(k, 0.0)) for k in keys]
    z = sum(target)
    target = [v / z for v in target] if z > 0 else [1.0 / len(target)] * len(target)
    label = target.index(max(target))
    k = len(render_options({"t": "choice", "crit": crit}))
    seq, markers = build_sequence(tok, state, {"t": "choice", "ins": q["instructions"], "crit": crit},
                                  cfg["max_len"], cfg["head_max_len"])
    if len(markers) != k:
        return None
    return {"ids": seq, "markers": markers, "qtype": QTYPES["choice"], "target": target, "label": label,
            "n_tokens": len(seq)}


def collate(items, pad_id):
    n, L = len(items), max(len(it["ids"]) for it in items)
    kmax = max(len(it["markers"]) for it in items)
    ids = torch.full((n, L), pad_id, dtype=torch.long)
    att = torch.zeros((n, L), dtype=torch.long)
    mpos = torch.zeros((n, kmax), dtype=torch.long)
    mmask = torch.zeros((n, kmax), dtype=torch.bool)
    target = torch.zeros((n, kmax), dtype=torch.float32)
    for i, it in enumerate(items):
        ids[i, : len(it["ids"])] = torch.tensor(it["ids"])
        att[i, : len(it["ids"])] = 1
        k = len(it["markers"])
        mpos[i, :k] = torch.tensor(it["markers"])
        mmask[i, :k] = True
        target[i, : len(it["target"])] = torch.tensor(it["target"], dtype=torch.float32)
    return {"input_ids": ids, "attention_mask": att, "marker_pos": mpos, "marker_mask": mmask,
            "target": target, "qtype": torch.tensor([it["qtype"] for it in items]),
            "label": torch.tensor([it["label"] for it in items])}


def fit_temperature(sel):
    if len(sel) < 10:
        return 1.0
    kmax = max(len(z) for z, _ in sel)
    Z = torch.full((len(sel), kmax), -1e4)
    T = torch.zeros((len(sel), kmax))
    for i, (z, t) in enumerate(sel):
        Z[i, : len(z)] = torch.tensor(z)
        T[i, : len(t)] = torch.tensor(t, dtype=torch.float32)
    log_t = torch.zeros(1, requires_grad=True)
    opt = torch.optim.LBFGS([log_t], lr=0.1, max_iter=100)

    def closure():
        opt.zero_grad()
        loss = -(T * torch.log_softmax(Z / log_t.exp(), -1)).sum(-1).mean()
        loss.backward()
        return loss

    opt.step(closure)
    return float(torch.clamp(log_t.exp(), 0.1, 10.0).item())


def evaluate(model, items, tok, device, use_amp, batch=16):
    model.eval()
    correct, total, preds = 0, 0, []
    with torch.no_grad():
        for i in range(0, len(items), batch):
            chunk = items[i : i + batch]
            b = collate(chunk, tok.pad_token_id)
            with torch.autocast(device.type, dtype=torch.float16, enabled=use_amp):
                logits, _ = model(b["input_ids"].to(device), b["attention_mask"].to(device),
                                  b["marker_pos"].to(device), b["marker_mask"].to(device),
                                  b["qtype"].to(device))
            logits = logits.float().cpu()
            for r, it in enumerate(chunk):
                k = len(it["markers"])
                z = logits[r, :k]
                preds.append((z.tolist(), it["target"]))
                correct += int(int(z.argmax()) == it["label"])
                total += 1
    model.train()
    return correct / max(1, total), preds


def main():
    ap = argparse.ArgumentParser(description="Fine-tune Laya on 2048 decisions.")
    ap.add_argument("--model", default="convaiinnovations/laya", help="hub id or checkpoint directory")
    ap.add_argument("--data", required=True, help="JSONL from test/decision.js --dataset")
    ap.add_argument("--out", required=True, help="output checkpoint directory (load it with --laya in the bridge)")
    ap.add_argument("--epochs", type=int, default=3)
    ap.add_argument("--micro-batch", type=int, default=8)
    ap.add_argument("--grad-accum", type=int, default=4)
    ap.add_argument("--lr-encoder", type=float, default=2.5e-5)
    ap.add_argument("--lr-head", type=float, default=1e-4)
    ap.add_argument("--group", type=int, default=4, help="GRPO baseline samples")
    ap.add_argument("--sigma", type=float, nargs=2, default=(0.4, 0.1), help="exploration noise, start and end")
    ap.add_argument("--max-len", type=int, default=1024, help="context the fine-tuned model reads (base: 512)")
    ap.add_argument("--max-items", type=int, default=0)
    ap.add_argument("--eval-frac", type=float, default=0.05)
    ap.add_argument("--device", default=None)
    ap.add_argument("--seed", type=int, default=42)
    args = ap.parse_args()

    ddp = int(os.environ.get("WORLD_SIZE", "1")) > 1
    rank, world = 0, 1
    if ddp:
        import torch.distributed as dist
        dist.init_process_group("nccl")
        rank, world = dist.get_rank(), dist.get_world_size()
        local_rank = int(os.environ.get("LOCAL_RANK", "0"))
        torch.cuda.set_device(local_rank)
        device = torch.device("cuda", local_rank)
    else:
        device = torch.device(args.device or ("cuda" if torch.cuda.is_available()
                              else "mps" if getattr(torch.backends, "mps", None) and torch.backends.mps.is_available()
                              else "cpu"))
    use_amp = device.type == "cuda"
    log = (lambda *a: print(*a, flush=True)) if rank == 0 else (lambda *a: None)

    model_dir = resolve_model_dir(args.model)
    _fix_tokenizer_config(model_dir)
    with open(os.path.join(model_dir, "rl_agent_config.json")) as f:
        cfg = json.load(f)
    cfg["max_len"] = max(int(cfg.get("max_len", 512)), args.max_len)
    cfg["head_max_len"] = max(int(cfg.get("head_max_len", 192)), 192)
    cfg["gradient_checkpointing"] = True
    tok = AutoTokenizer.from_pretrained(os.path.join(model_dir, "tokenizer"))

    log("reading %s ..." % args.data)
    items, skipped, longest = [], 0, 0
    with open(args.data) as f:
        for line in f:
            if not line.strip():
                continue
            row = json.loads(line)
            q = row["questions"]["move"]
            it = build_item(tok, cfg, row["state"], q, row["gold"]["move"])
            if it is None:
                skipped += 1
                continue
            longest = max(longest, it["n_tokens"])
            items.append(it)
            if args.max_items and len(items) >= args.max_items:
                break
    random.seed(args.seed)
    random.shuffle(items)
    n_eval = int(len(items) * args.eval_frac)
    eval_items, train_items = items[:n_eval], items[n_eval:]
    log("%d decisions (%d skipped), longest %d tokens of %d; %d train, %d held out" % (
        len(items), skipped, longest, cfg["max_len"], len(train_items), len(eval_items)))
    my_items = train_items[rank::world]

    model = build_model(cfg, encoder_dir=os.path.join(model_dir, "encoder"))
    model.load_state_dict(load_file(os.path.join(model_dir, "model.safetensors")), strict=True)
    try:
        model.encoder.gradient_checkpointing_enable(gradient_checkpointing_kwargs={"use_reentrant": False})
        model.head_checkpointing = True
    except Exception:
        pass
    try:
        model.encoder.config.reference_compile = False
    except Exception:
        pass
    model.to(device).train()
    net = model
    if ddp:
        from torch.nn.parallel import DistributedDataParallel as DDP
        net = DDP(model, device_ids=[device.index], find_unused_parameters=True)

    if eval_items and rank == 0:
        acc0, _ = evaluate(model, eval_items, tok, device, use_amp)
        log("held-out agreement with the teacher before training: %.3f" % acc0)

    enc = [p for n, p in net.named_parameters() if "encoder." in n]
    head = [p for n, p in net.named_parameters() if "encoder." not in n]
    opt = torch.optim.AdamW([{"params": enc, "lr": args.lr_encoder}, {"params": head, "lr": args.lr_head}],
                            weight_decay=0.01)
    updates = max(1, (len(my_items) // (args.micro_batch * args.grad_accum)) * args.epochs)
    sched = torch.optim.lr_scheduler.CosineAnnealingLR(opt, T_max=updates, eta_min=1e-6)
    scaler = torch.amp.GradScaler("cuda", enabled=use_amp)
    t0 = time.time()
    for epoch in range(args.epochs):
        random.seed(args.seed + epoch + rank)
        random.shuffle(my_items)
        sigma = args.sigma[0] + (args.sigma[1] - args.sigma[0]) * (epoch / max(1, args.epochs - 1))
        opt.zero_grad(set_to_none=True)
        seen, total_loss, accum = 0, 0.0, 0
        for i in range(0, len(my_items), args.micro_batch):
            chunk = my_items[i : i + args.micro_batch]
            b = collate(chunk, tok.pad_token_id)
            with torch.autocast(device.type, dtype=torch.float16, enabled=use_amp):
                logits, act = net(b["input_ids"].to(device), b["attention_mask"].to(device),
                                  b["marker_pos"].to(device), b["marker_mask"].to(device),
                                  b["qtype"].to(device))
            logits = logits.float()
            mask = b["marker_mask"].to(device)
            k = mask.sum(-1, keepdim=True).float()
            target = b["target"].to(device)
            eps = torch.randn((args.group,) + logits.shape, device=device) * sigma * mask
            eps = (eps - eps.sum(-1, keepdim=True) / k) * mask
            z = logits.detach().unsqueeze(0) + eps
            q = torch.softmax(z.masked_fill(~mask, -1e4), -1)
            with torch.no_grad():
                r = proper_reward(q, target.unsqueeze(0), b["qtype"].to(device), mask, w_sph=0.75, w_rps=1.0)
                adv = r - r.mean(0, keepdim=True)
                adv = adv / (adv.std() + 1e-6)
            logp = -(((z - logits.unsqueeze(0)) ** 2) * mask).sum(-1) / (2 * sigma ** 2)
            loss_rl = -(adv * logp).mean()
            loss_ce = -(target * torch.log_softmax(logits.masked_fill(~mask, -1e4), -1)).sum(-1).mean()
            loss = (loss_rl + loss_ce) / args.grad_accum + 0.0 * act.sum()
            scaler.scale(loss).backward()
            accum += 1
            if accum % args.grad_accum == 0 or i + args.micro_batch >= len(my_items):
                scaler.unscale_(opt)
                torch.nn.utils.clip_grad_norm_(net.parameters(), 1.0)
                scaler.step(opt)
                scaler.update()
                sched.step()
                opt.zero_grad(set_to_none=True)
            total_loss += loss.item() * args.grad_accum
            seen += 1
            if seen % 50 == 0:
                log("  epoch %d/%d step %d loss %.4f reward %.3f lr %.2e  %.0fs" % (
                    epoch + 1, args.epochs, seen, loss.item() * args.grad_accum, r.mean().item(),
                    sched.get_last_lr()[0], time.time() - t0))
        log("epoch %d/%d done, mean loss %.4f, %.0fs" % (epoch + 1, args.epochs, total_loss / max(1, seen), time.time() - t0))
        if eval_items and rank == 0:
            acc, _ = evaluate(model, eval_items, tok, device, use_amp)
            log("held-out agreement with the teacher: %.3f" % acc)

    if ddp:
        import torch.distributed as dist
        dist.barrier()
    if rank == 0:
        calib = eval_items if eval_items else train_items[::15][:400]
        _, preds = evaluate(model, calib, tok, device, use_amp)
        try:
            temp = fit_temperature(preds)
        except Exception as e:
            log("temperature fitting fallback: %s" % e)
            temp = 1.2
        temps = list(cfg.get("temperature", [1.0, 1.0, 1.0]))
        temps[QTYPES["choice"]] = temp
        os.makedirs(args.out, exist_ok=True)
        sd = {k: (v.half() if use_amp else v.float()).contiguous().cpu() for k, v in model.state_dict().items()}
        save_file(sd, os.path.join(args.out, "model.safetensors"))
        model.encoder.config.save_pretrained(os.path.join(args.out, "encoder"))
        tok.save_pretrained(os.path.join(args.out, "tokenizer"))
        cfg["fine_tuned"] = True
        cfg["model_name"] = "laya-2048"
        cfg["temperature"] = temps
        cfg.pop("temperature_by_options", None)
        with open(os.path.join(args.out, "rl_agent_config.json"), "w") as f:
            json.dump(cfg, f, indent=2)
        log("saved %s (choice temperature %.3f); play it with: python3 ai/bridge.py --laya %s" % (
            args.out, temp, args.out))
    if ddp:
        import torch.distributed as dist
        dist.destroy_process_group()


if __name__ == "__main__":
    main()
