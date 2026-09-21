#!/usr/bin/env node
"use strict";

// Independent BigInt verifier for test/state_space_bounds.py.
// It reconstructs the finite supersets from occupancy masks and D4 fixed
// sets; it shares no generated data with the Python counter.

const N = 4, C = 16, MAX = 17;
function choose(n,k){ if(k<0||k>n)return 0n; let z=1n; for(let i=1;i<=k;i++) z=z*BigInt(n-k+i)/BigInt(i); return z; }
function packed(mask,d){
  if(d<2){
    for(let r=0;r<4;r++){
      let empty=false;
      for(let t=0;t<4;t++){
        const c=d===0?t:3-t, bit=(mask>>(4*r+c))&1;
        if(!bit) empty=true; else if(empty) return false;
      }
    }
  } else {
    for(let c=0;c<4;c++){
      let empty=false;
      for(let t=0;t<4;t++){
        const r=d===2?t:3-t, bit=(mask>>(4*r+c))&1;
        if(!bit) empty=true; else if(empty) return false;
      }
    }
  }
  return true;
}
function eligible(mask){
  let e=0;
  for(let x=0;x<16;x++) if(mask&(1<<x)){
    const a=mask&~(1<<x);
    if(packed(a,0)||packed(a,1)||packed(a,2)||packed(a,3)) e|=1<<x;
  }
  return e;
}
const binMemo=new Map();
function labeledValues(m,a){
  const key=m+","+a; if(binMemo.has(key)) return binMemo.get(key);
  let dp=new Map([["0,0",1n]]);
  for(let q=MAX;q>=3;q--){
    const cap=18-q, nd=new Map();
    for(const [key0,w] of dp){
      const [used,ue]=key0.split(",").map(Number), re=a-ue, rn=(m-a)-(used-ue);
      const room=Math.min(m-used,cap-used);
      for(let xe=0;xe<=re;xe++) for(let xn=0;xn<=rn;xn++){
        if(xe+xn>room) continue;
        const k=(used+xe+xn)+","+(ue+xe);
        nd.set(k,(nd.get(k)||0n)+w*choose(re,xe)*choose(rn,xn));
      }
    }
    dp=nd;
  }
  let ans=0n;
  for(const [key0,w] of dp){
    const [used,ue]=key0.split(",").map(Number);
    if(ue<a) ans += w*(1n<<BigInt(m-used));
  }
  binMemo.set(key,ans); return ans;
}
function popcnt(x){ let n=0; while(x){x&=x-1;n++;} return n; }

function perms(){
  const ans=[];
  for(let k=0;k<8;k++){
    const p=[];
    for(let r=0;r<4;r++)for(let c=0;c<4;c++){
      let rr,cc;
      if(k===0)[rr,cc]=[r,c];
      if(k===1)[rr,cc]=[c,3-r];
      if(k===2)[rr,cc]=[3-r,3-c];
      if(k===3)[rr,cc]=[3-c,r];
      if(k===4)[rr,cc]=[r,3-c];
      if(k===5)[rr,cc]=[3-r,c];
      if(k===6)[rr,cc]=[c,r];
      if(k===7)[rr,cc]=[3-c,3-r];
      p.push(4*rr+cc);
    }
    ans.push(p);
  }
  return ans;
}
function cycles(p){
  const seen=Array(16).fill(false), out=[];
  for(let s=0;s<16;s++) if(!seen[s]){
    const a=[]; let j=s;
    while(!seen[j]){seen[j]=true;a.push(j);j=p[j];}
    out.push(a);
  }
  return out;
}
const fixedMemo=new Map();
function fixedValues(occCycles, emask){
  const cnt=new Map();
  for(const cyc of occCycles){
    let any=false,all=true;
    for(const x of cyc){ const b=!!(emask&(1<<x)); any ||= b; all &&= b; }
    if(any&&!all) throw new Error("noninvariant eligibility");
    const k=cyc.length+":"+(all?1:0); cnt.set(k,(cnt.get(k)||0)+1);
  }
  const types=[...cnt].map(([k,n])=>{const [l,e]=k.split(":").map(Number);return [l,e,n];}).sort((a,b)=>a[0]-b[0]||a[1]-b[1]);
  const sig=types.map(t=>t.join(":" )).join("|"); if(fixedMemo.has(sig)) return fixedMemo.get(sig);
  const init=types.map(t=>t[2]), total=types.reduce((s,t)=>s+t[0]*t[2],0);
  let dp=new Map([[init.join(","),1n]]);
  for(let q=MAX;q>=3;q--){
    const cap=18-q, nd=new Map();
    for(const [rk,w] of dp){
      const rem=rk?rk.split(",").map(Number):[], used=total-rem.reduce((s,n,i)=>s+types[i][0]*n,0);
      const xs=Array(rem.length).fill(0);
      function rec(i,add,mult){
        if(i===rem.length){
          if(used+add>cap)return;
          const r2=rem.map((r,j)=>r-xs[j]), k=r2.join(","); nd.set(k,(nd.get(k)||0n)+w*mult); return;
        }
        for(let x=0;x<=rem[i];x++){xs[i]=x;rec(i+1,add+types[i][0]*x,mult*choose(rem[i],x));}
      }
      rec(0,0,1n);
    }
    dp=nd;
  }
  let ans=0n;
  for(const [rk,w] of dp){
    const rem=rk?rk.split(",").map(Number):[];
    let eligibleCycles=0, ncyc=0;
    for(let i=0;i<rem.length;i++){ncyc+=rem[i]; if(types[i][1]) eligibleCycles+=rem[i];}
    if(eligibleCycles) ans+=w*(1n<<BigInt(ncyc));
  }
  fixedMemo.set(sig,ans); return ans;
}

const P=perms();
let rankRaw=0n;
for(let m=2;m<=16;m++) rankRaw += choose(16,m)*labeledValues(m,m);
let lastRaw=0n, eligibleMasks=0;
for(let mask=0;mask<(1<<16);mask++){
  const m=popcnt(mask); if(m<2)continue;
  const e=eligible(mask), a=popcnt(e); if(!a)continue;
  eligibleMasks++; lastRaw += labeledValues(m,a);
}
function burnside(rankOnly){
  const fixed=[];
  for(const p of P){
    const cs=cycles(p); let tot=0n;
    for(let sel=0;sel<(1<<cs.length);sel++){
      const occ=[]; let mask=0;
      for(let j=0;j<cs.length;j++) if(sel&(1<<j)){occ.push(cs[j]);for(const x of cs[j])mask|=1<<x;}
      if(popcnt(mask)<2)continue;
      const e=rankOnly?mask:eligible(mask); if(!e)continue;
      // group cycles by length and eligibility and count invariant values
      const cnt=new Map();
      for(const cyc of occ){
        let any=false,all=true;
        for(const x of cyc){const b=!!(e&(1<<x)); any ||= b; all &&= b;}
        if(any&&!all) throw new Error("partial eligible cycle");
        const k=cyc.length+":"+(all?1:0); cnt.set(k,(cnt.get(k)||0)+1);
      }
      const types=[...cnt].map(([k,n])=>{const [l,f]=k.split(":").map(Number);return [l,f,n];}).sort((a,b)=>a[0]-b[0]||a[1]-b[1]);
      const sig=types.map(t=>t.join(":" )).join("|");
      let ways=fixedMemo.get(sig);
      if(ways===undefined){
        // Reconstruct representative cycles for the generic routine.
        const fake=[]; let pos=0, em=0;
        for(const [len,flag,n] of types)for(let z=0;z<n;z++){
          const cyc=[]; for(let y=0;y<len;y++)cyc.push(pos++);
          fake.push(cyc); if(flag)for(const x of cyc)em|=1<<x;
        }
        ways=fixedValues(fake,em);
      }
      tot+=ways;
    }
    fixed.push(tot);
  }
  return [fixed,fixed.reduce((a,b)=>a+b,0n)/8n];
}
const [rankFix,rankOrb]=burnside(true), [lastFix,lastOrb]=burnside(false);

const extras=[];
for(let i=0;i<16;i++)for(let j=i+1;j<16;j++){
  const mask=(1<<i)|(1<<j); if(eligible(mask))continue;
  for(const vi of [1,2])for(const vj of [1,2]){const b=Array(16).fill(0);b[i]=vi;b[j]=vj;extras.push(b);}
}
const extraFix=P.map(p=>BigInt(extras.filter(b=>b.every((v,i)=>v===b[p[i]])).length));
const extraOrb=extraFix.reduce((a,b)=>a+b,0n)/8n;
const out={rankRaw,rankOrb,lastRaw,lastOrb,extraRaw:BigInt(extras.length),extraOrb,finalRaw:lastRaw+BigInt(extras.length),finalOrb:lastOrb+extraOrb};
const expect={
  rankRaw:42680958038114579072n, rankOrb:5335119967984859212n,
  lastRaw:23408633018322063456n, lastOrb:2926079231642763759n,
  extraRaw:24n, extraOrb:6n,
  finalRaw:23408633018322063480n, finalOrb:2926079231642763765n
};
for(const k of Object.keys(expect)) if(out[k]!==expect[k]) throw new Error(k+": "+out[k]+" != "+expect[k]);
console.log("independent BigInt verifier: PASS");
for(const [k,v] of Object.entries(out)) console.log(k+" = "+v.toLocaleString("en-US"));
console.log("rank fixed = "+rankFix.map(String).join(","));
console.log("last fixed = "+lastFix.map(String).join(","));
console.log("initial extra fixed = "+extraFix.map(String).join(","));
console.log("eligible occupancy masks = "+eligibleMasks);
