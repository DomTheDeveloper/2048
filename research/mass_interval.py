#!/usr/bin/env python3
"""Outward-rounded evaluation of the proved mass-only Bellman upper bound.

Only Python's decimal module is used. All arithmetic is rounded outwards;
this is not a claim that Python itself has been verified in Lean.
"""
from decimal import Decimal, Context, ROUND_FLOOR, ROUND_CEILING
from pathlib import Path
import json


def potential(m):
    return sum(r*(1<<(r+1)) for r in range(m.bit_length()) if (m>>r)&1)


def evaluate(c,precision=50):
    lo=Context(prec=precision,rounding=ROUND_FLOOR)
    hi=Context(prec=precision,rounding=ROUND_CEILING)
    q,p=Decimal('0.9'),Decimal('0.1')
    end=(1<<(c+1))-2
    w1l=w2l=w1h=w2h=Decimal(0)
    n1l=n2l=n1h=n2h=Decimal(0)
    for m in range(end,-1,-1):
        if m.bit_count()==c:
            wl=wh=Decimal(potential(m));nl=nh=Decimal(0)
        else:
            wl=lo.add(lo.multiply(q,w1l),lo.multiply(p,lo.subtract(w2l,Decimal(4))))
            wh=hi.add(hi.multiply(q,w1h),hi.multiply(p,hi.subtract(w2h,Decimal(4))))
            nl=lo.add(Decimal(1),lo.add(lo.multiply(q,n1l),lo.multiply(p,n2l)))
            nh=hi.add(Decimal(1),hi.add(hi.multiply(q,n1h),hi.multiply(p,n2h)))
        w2l,w1l=w1l,wl;w2h,w1h=w1h,wh
        n2l,n1l=n1l,nl;n2h,n1h=n1h,nh
    return {'cells':c,'decimal_precision':precision,
            'expected_score_relaxation_lower':str(wl),'expected_score_relaxation_upper':str(wh),
            'expected_rounds_relaxation_lower':str(lo.subtract(nl,Decimal(2))),
            'expected_rounds_relaxation_upper':str(hi.subtract(nh,Decimal(2)))}

if __name__=='__main__':
    result=[evaluate(c) for c in (2,4,9,10,12,16)]
    for row in result:assert Decimal(row['expected_score_relaxation_lower'])<=Decimal(row['expected_score_relaxation_upper'])
    p=Path(__file__).with_name('mass-interval-results.json');p.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
