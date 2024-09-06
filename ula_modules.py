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
    
    n = len(x)  # Número de bits
    c = [Signal(bool(0)) for i in range(n)]  # Lista para armazenar os carries internos

    # Half-adder para o primeiro bit (não há carry-in)
    half = halfAdder(x[0], y[0], soma[0], c[0])

    # Full-adders para os bits subsequentes (com carry-in)
    faList = [None for i in range(1, n)]
    for i in range(1, n):
        faList[i-1] = fullAdder(x[i], y[i], c[i-1], soma[i], c[i])

    @always_comb
    def comb():
        carry.next = c[n-1]  # O carry final é o carry-out do último full-adder

    return instances()

@block
def bin2hex(hex_pins, sw):
    """
    Faz a conversão de binário para display de 7 segmentos
    """

    @always_comb
    def comb():
        if sw[4:0] == 0:
            hex_pins.next = "1000000"
        elif sw[4:0] == 1:
            hex_pins.next = "1111001"
        elif sw[4:0] == 2:
            hex_pins.next = "0100100"
        elif sw[4:0] == 3:
            hex_pins.next = "0110000"
        elif sw[4:0] == 4:
            hex_pins.next = "0011001"
        elif sw[4:0] == 5:
            hex_pins.next = "0010010"
        elif sw[4:0] == 6:
            hex_pins.next = "0000010"
        elif sw[4:0] == 7:
            hex_pins.next = "1011000"
        elif sw[4:0] == 8:
            hex_pins.next = "0000000"
        elif sw[4:0] == 9:
            hex_pins.next = "0010000"
        elif sw[4:0] == 10:
            hex_pins.next = "0001000"
        elif sw[4:0] == 11:
            hex_pins.next = "0000011"
        elif sw[4:0] == 12:
            hex_pins.next = "0100111"
        elif sw[4:0] == 13:
            hex_pins.next = "0100001"
        elif sw[4:0] == 14:
            hex_pins.next = "0000110"
        else:
            hex_pins.next = "0001110"

    return instances()