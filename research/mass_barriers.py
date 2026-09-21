#!/usr/bin/env python3
"""Verify exact arithmetic formulas for the mass-only 2048 relaxation.

This does not strongly solve geometric 2048. The reported probabilities
are upper bounds for one honest game, not for repeated restarts or undo.
"""
from __future__ import annotations
from fractions import Fraction
from math import comb, lgamma, log, log10, exp, fsum
from pathlib import Path
import json


def renewal(m: int,p: Fraction) -> Fraction:
    return (1-(-p)**(m+1))/(1+p)


def barrier_product(c: int,p: Fraction) -> Fraction:
    value=Fraction(1)
    for j in range(1,c+1):value*=p*renewal(2**j-2,p)
    return value


def killed_mass_dp(c: int,p: Fraction) -> Fraction:
    end=2**(c+1)-2
    forbidden={2**(c+1)-1-2**j for j in range(1,c+1)}
    dp=[Fraction(0)]*(end+1);dp[0]=1
    for m in range(end):
        if m in forbidden:continue
        if m+1<=end:dp[m+1]+=(1-p)*dp[m]
        if m+2<=end:dp[m+2]+=p*dp[m]
    return dp[end]


def mul(a,b):
    out=[Fraction(0)]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):out[i+j]+=x*y
    return out


def generating_coefficients(c: int,p: Fraction):
    result=[Fraction(1)]
    for j in range(1,c+1):
        d=2**j-2
        factor=[Fraction(0)]+[p*comb(d-f,f)*(1-p)**(d-2*f)*p**f for f in range(d//2+1)]
        result=mul(result,factor)
    return result


def counted_mass_dp(c: int,p: Fraction):
    end=2**(c+1)-2
    forbidden={2**(c+1)-1-2**j for j in range(1,c+1)}
    dp=[{} for _ in range(end+1)];dp[0][0]=Fraction(1)
    for m in range(end):
        if m in forbidden:continue
        for f,prob in dp[m].items():
            if m+1<=end:dp[m+1][f]=dp[m+1].get(f,0)+(1-p)*prob
            if m+2<=end:dp[m+2][f+1]=dp[m+2].get(f+1,0)+p*prob
    return dp[end]


def deadline_log10(rounds: int) -> float:
    if rounds<32781:return float('-inf')
    n=rounds-13;limit=min(n,2*(rounds-32781))
    if limit==n:return 0.0
    terms=[lgamma(n+1)-lgamma(z+1)-lgamma(n-z+1)+z*log(.9)+(n-z)*log(.1) for z in range(limit+1)]
    peak=max(terms)
    return min(0.0,(peak+log(fsum(exp(t-peak) for t in terms)))/log(10))


def expected_relaxation(c: int,p: float=.1):
    end=2**(c+1)-2
    prob=[0.0]*(end+1);weighted_fours=[0.0]*(end+1);potential=[0]*(end+1)
    prob[0]=1.0;score=mass=total=0.0
    for m in range(end+1):
        potential[m]=2*potential[m//2]+4*(m//2) if m else 0
        if m.bit_count()==c:
            total+=prob[m];mass+=m*prob[m]
            score+=potential[m]*prob[m]-4*weighted_fours[m]
            continue
        for jump,w in ((1,1-p),(2,p)):
            if m+jump<=end:
                prob[m+jump]+=w*prob[m]
                weighted_fours[m+jump]+=w*(weighted_fours[m]+(prob[m] if jump==2 else 0))
    assert abs(total-1)<1e-10
    return {'expected_score_upper':score,'expected_rounds_upper':mass/(1+p)-2,
            'absorption_probability':total}


def main():
    p=Fraction(1,10);checks=[]
    for c in range(2,7):
        exact=barrier_product(c,p)
        assert exact==killed_mass_dp(c,p)
        coeff=generating_coefficients(c,p);direct=counted_mass_dp(c,p)
        assert all(coeff[f]==direct.get(f,0) for f in range(len(coeff)))
        assert sum(coeff)==exact
        assert coeff[c]==p**c*(1-p)**(2**(c+1)-2*c-2)
        assert all(x==0 for x in coeff[:c])
        checks.append({'cells':c,'full_chain_mass_upper':float(exact),'coefficients_checked':len(coeff)})
    # Use logarithms at c=16, avoiding giant Fraction decimal conversions.
    chain_log=sum(log10(.1/1.1)+log10(1+.1**(2**j-1)) for j in range(1,17))
    report={'model':'mass-only upper bounds, NOT optimal geometric winning probabilities',
       'exact_small_case_checks':checks,
       'expected_value_mass_relaxation':{str(c):expected_relaxation(c) for c in (2,4,9,10,12,16)},
       'max_tile_probability_upper_exact':'(1 + 10^(-65535))/11',
       'full_chain_probability_upper':10**chain_log,
       'full_chain_probability_upper_log10':chain_log,
       'score_ceiling_probability_upper_log10':15*log10(.1)+131038*log10(.9),
       'full_chain_minimum_fours_word_probability_log10':16*log10(.1)+131038*log10(.9),
       'deadline_upper_log10':{str(t):deadline_log10(t) for t in (32781,33000,40000,50000,55000,59000)}}
    Path(__file__).with_name('mass-barrier-results.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))

if __name__=='__main__':main()
