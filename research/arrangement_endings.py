#!/usr/bin/env python3
"""Enumerate all-4 suffixes of an existing legal full-chain witness.

The search is an untrusted witness producer. Check generated text using
both verify/verify2048.py and test/replay_engine.js.
"""
from __future__ import annotations
import importlib.util
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('producer',ROOT/'lean-kernel/build_certificate.py')
g=importlib.util.module_from_spec(spec);spec.loader.exec_module(g)


def read():
    lines=[l.split('#')[0].strip() for l in (ROOT/'witness/full-chain.txt').read_text().splitlines()]
    lines=[l for l in lines if l]
    b=[0]*16
    for l in lines[:2]:
        _,r,c,v=l.split();b[4*int(r)+int(c)]=int(v)
    states=[tuple(b)]
    for l in lines[2:]:
        d,r,c,v=l.split();a,_=g.slide(b,d)
        assert a!=b and a[4*int(r)+int(c)]==0
        a[4*int(r)+int(c)]=int(v);b=a;states.append(tuple(b))
    return lines,states


def images(b):
    result=[]
    for transpose in (False,True):
        for fr in (False,True):
            for fc in (False,True):
                out=[0]*16
                for r in range(4):
                    for c in range(4):
                        rr,cc=(c,r) if transpose else (r,c)
                        rr=3-rr if fr else rr;cc=3-cc if fc else cc
                        out[4*rr+cc]=b[4*r+c]
                result.append(tuple(out))
    return result


def main():
    lines,states=read();start=65517;stop=65533
    first=states[start];parents={first:None};layer=[first];counts=[]
    for t in range(start,stop):
        nxt=[]
        for b in layer:
            for d in 'URDL':
                a,_=g.slide(list(b),d)
                if tuple(a)==b:continue
                for i,v in enumerate(a):
                    if v:continue
                    a[i]=4;q=tuple(a);a[i]=0
                    if q in parents:continue
                    parents[q]=(b,(d,i//4,i%4,4));nxt.append(q)
        layer=nxt;counts.append(len(layer))
    target=sorted(2**k for k in range(2,18))
    finals=[b for b in layer if sorted(b)==target]
    orbits=set()
    for b in finals:orbits.update(images(b))
    paths=[]
    for b in sorted(finals):
        q=b;suffix=[]
        while parents[q] is not None:
            q,s=parents[q];suffix.append(s)
        suffix.reverse();assert len(suffix)==stop-start
        paths.append({'final':b,'suffix':suffix})
    opposite=next(p for p in paths if p['final'][0]==4 and p['final'][15]==131072)
    out=['# Minimum-length full chain with 4 opposite 131072.']+lines[:start+2]
    out+=['%s %d %d %d'%tuple(s) for s in opposite['suffix']]
    (ROOT/'witness/full-chain-opposite-corners.txt').write_text('\n'.join(out)+'\n')
    report={'checkpoint_move':start,'total_moves':stop,'all_spawns':4,
            'visited_states':len(parents),'layer_counts':counts,
            'distinct_endings':len(finals),'distinct_symmetry_images':len(orbits),'endings':paths}
    (ROOT/'research/arrangement-endings.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='endings'},indent=2))

if __name__=='__main__':main()
