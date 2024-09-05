#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""

"""

from myhdl import *


@block
def halfAdder(a, b, soma, carry):
    @always_comb
    def comb():
        soma.next = a * (not b) + (not a) * b
        carry.next = a * b
    return instances()


@block
def fullAdder(a, b, c, soma, carry):
    s = [Signal(bool(0)) for i in range(3)]
    
    haList = [None for i in range(2)]

    haList[0] = halfAdder(a, b, s[0], s[1]) # (2)
    haList[1] = halfAdder(c, s[0], soma, s[2]) # (3)

    @always_comb
    def comb():
        carry.next = s[1] | s[2] # (4)

    return instances()



@block
def adder2bits(x, y, soma, carry):
    s1 = Signal(bool(0))
    
    half = halfAdder(x[0], y[0], soma[0], s1)
    full = fullAdder(x[1], y[1], s1, soma[1], carry)

    return instances()


@block
def adder(x, y, soma, carry):
    
    n = len(x)
    c = [Signal(bool(0)) for i in range(n)]

    faList = [None for i in range(n)]

    half = halfAdder(x[0], y[0], soma[0], c[0])

    for i in range(n):
        faList[i] = fullAdder(x[i], y[i], c[i-1], soma[i], c[i])

    return instances()
