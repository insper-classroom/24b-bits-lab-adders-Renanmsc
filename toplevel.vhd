-- File: toplevel.vhd
-- Generated by MyHDL 0.11.42
-- Date: Fri Sep  6 17:44:58 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

use work.pck_myhdl_01142.all;

entity toplevel is
    port (
        LEDR: out unsigned(9 downto 0);
        SW: in unsigned(9 downto 0);
        KEY: in unsigned(3 downto 0);
        HEX0: out unsigned(6 downto 0);
        HEX1: in unsigned(6 downto 0);
        HEX2: in unsigned(6 downto 0);
        HEX3: in unsigned(6 downto 0);
        HEX4: in unsigned(6 downto 0);
        HEX5: in unsigned(6 downto 0);
        CLOCK_50: in std_logic;
        RESET_N: in std_logic
    );
end entity toplevel;


architecture MyHDL of toplevel is



signal bin2hex0_sw: unsigned(9 downto 0);
type t_array_ledr_s is array(0 to 10-1) of std_logic;
signal ledr_s: t_array_ledr_s;
type t_array_adder0_c is array(0 to 4-1) of std_logic;
signal adder0_c: t_array_adder0_c;
type t_array_adder0_fullAdder0_s is array(0 to 3-1) of std_logic;
signal adder0_fullAdder0_s: t_array_adder0_fullAdder0_s;
type t_array_adder0_fullAdder1_s is array(0 to 3-1) of std_logic;
signal adder0_fullAdder1_s: t_array_adder0_fullAdder1_s;
type t_array_adder0_fullAdder2_s is array(0 to 3-1) of std_logic;
signal adder0_fullAdder2_s: t_array_adder0_fullAdder2_s;

begin



bin2hex0_sw(9) <= ledr_s(9);
bin2hex0_sw(8) <= ledr_s(8);
bin2hex0_sw(7) <= ledr_s(7);
bin2hex0_sw(6) <= ledr_s(6);
bin2hex0_sw(5) <= ledr_s(5);
bin2hex0_sw(4) <= ledr_s(4);
bin2hex0_sw(3) <= ledr_s(3);
bin2hex0_sw(2) <= ledr_s(2);
bin2hex0_sw(1) <= ledr_s(1);
bin2hex0_sw(0) <= ledr_s(0);


ledr_s(0) <= ((to_unsigned(SW(0), 1) * to_unsigned((not bool(SW(6))), 1)) + (to_unsigned((not bool(SW(0))), 1) * to_unsigned(SW(6), 1)));
adder0_c(0) <= (to_unsigned(SW(0), 1) * to_unsigned(SW(6), 1));


adder0_fullAdder0_s(0) <= ((to_unsigned(SW(1), 1) * to_unsigned((not bool(SW(7))), 1)) + (to_unsigned((not bool(SW(1))), 1) * to_unsigned(SW(7), 1)));
adder0_fullAdder0_s(1) <= (to_unsigned(SW(1), 1) * to_unsigned(SW(7), 1));


ledr_s(1) <= ((to_unsigned(adder0_c(0), 1) * to_unsigned((not bool(adder0_fullAdder0_s(0))), 1)) + (to_unsigned((not bool(adder0_c(0))), 1) * to_unsigned(adder0_fullAdder0_s(0), 1)));
adder0_fullAdder0_s(2) <= (to_unsigned(adder0_c(0), 1) * to_unsigned(adder0_fullAdder0_s(0), 1));


adder0_c(1) <= (adder0_fullAdder0_s(1) or adder0_fullAdder0_s(2));


adder0_fullAdder1_s(0) <= ((to_unsigned(SW(2), 1) * to_unsigned((not bool(SW(8))), 1)) + (to_unsigned((not bool(SW(2))), 1) * to_unsigned(SW(8), 1)));
adder0_fullAdder1_s(1) <= (to_unsigned(SW(2), 1) * to_unsigned(SW(8), 1));


ledr_s(2) <= ((to_unsigned(adder0_c(1), 1) * to_unsigned((not bool(adder0_fullAdder1_s(0))), 1)) + (to_unsigned((not bool(adder0_c(1))), 1) * to_unsigned(adder0_fullAdder1_s(0), 1)));
adder0_fullAdder1_s(2) <= (to_unsigned(adder0_c(1), 1) * to_unsigned(adder0_fullAdder1_s(0), 1));


adder0_c(2) <= (adder0_fullAdder1_s(1) or adder0_fullAdder1_s(2));


adder0_fullAdder2_s(0) <= ((to_unsigned(SW(3), 1) * to_unsigned((not bool(SW(9))), 1)) + (to_unsigned((not bool(SW(3))), 1) * to_unsigned(SW(9), 1)));
adder0_fullAdder2_s(1) <= (to_unsigned(SW(3), 1) * to_unsigned(SW(9), 1));


ledr_s(3) <= ((to_unsigned(adder0_c(2), 1) * to_unsigned((not bool(adder0_fullAdder2_s(0))), 1)) + (to_unsigned((not bool(adder0_c(2))), 1) * to_unsigned(adder0_fullAdder2_s(0), 1)));
adder0_fullAdder2_s(2) <= (to_unsigned(adder0_c(2), 1) * to_unsigned(adder0_fullAdder2_s(0), 1));


adder0_c(3) <= (adder0_fullAdder2_s(1) or adder0_fullAdder2_s(2));


ledr_s(9) <= adder0_c((4 - 1));

TOPLEVEL_BIN2HEX0_COMB: process (bin2hex0_sw) is
begin
    if (bin2hex0_sw(4-1 downto 0) = 0) then
        HEX0 <= unsigned'("1000000");
    elsif (bin2hex0_sw(4-1 downto 0) = 1) then
        HEX0 <= unsigned'("1111001");
    elsif (bin2hex0_sw(4-1 downto 0) = 2) then
        HEX0 <= unsigned'("0100100");
    elsif (bin2hex0_sw(4-1 downto 0) = 3) then
        HEX0 <= unsigned'("0110000");
    elsif (bin2hex0_sw(4-1 downto 0) = 4) then
        HEX0 <= unsigned'("0011001");
    elsif (bin2hex0_sw(4-1 downto 0) = 5) then
        HEX0 <= unsigned'("0010010");
    elsif (bin2hex0_sw(4-1 downto 0) = 6) then
        HEX0 <= unsigned'("0000010");
    elsif (bin2hex0_sw(4-1 downto 0) = 7) then
        HEX0 <= unsigned'("1011000");
    elsif (bin2hex0_sw(4-1 downto 0) = 8) then
        HEX0 <= unsigned'("0000000");
    elsif (bin2hex0_sw(4-1 downto 0) = 9) then
        HEX0 <= unsigned'("0010000");
    elsif (bin2hex0_sw(4-1 downto 0) = 10) then
        HEX0 <= unsigned'("0001000");
    elsif (bin2hex0_sw(4-1 downto 0) = 11) then
        HEX0 <= unsigned'("0000011");
    elsif (bin2hex0_sw(4-1 downto 0) = 12) then
        HEX0 <= unsigned'("0100111");
    elsif (bin2hex0_sw(4-1 downto 0) = 13) then
        HEX0 <= unsigned'("0100001");
    elsif (bin2hex0_sw(4-1 downto 0) = 14) then
        HEX0 <= unsigned'("0000110");
    else
        HEX0 <= unsigned'("0001110");
    end if;
end process TOPLEVEL_BIN2HEX0_COMB;

TOPLEVEL_COMB: process (ledr_s) is
begin
    for i in 0 to 10-1 loop
        LEDR(i) <= ledr_s(i);
    end loop;
end process TOPLEVEL_COMB;

end architecture MyHDL;
