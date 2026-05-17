--------------------------------------------------------
-- File          : Extend-ea.vhd
-- Titel         : CHD2 Sommersemester 2026 - Homework 3 
--               : Thomas Mueller-W.
--------------------------------------------------------
-- Aufgabe       : Aufgabe 3 - Extension Unit
-- Student:in    : 
-- Matrikelnummer: 
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.SingleCycleCPUPack.all;

entity Extend is
   port (
        iSrc : in  aOpCode;
        iImm : in  aImm24;
        oImm : out aData);
end entity Extend;

architecture Bhv of Extend is
begin
    process
    begin
        case iSrc is
            when cDOpCode => 
                oImm <= (others => '0');
                oImm(7 downto 0) <= iImm(7 downto 0);
            when cMOpCode => 
                oImm <= (others => '0');
                oImm(11 downto 0) <= iImm(11 downto 0);
            when cBOpCode =>
                oImm <= (others => iImm(23));
                oImm(25 downto 0) <= iImm(23 downto 0) & "00";
            when others => oImm <= (others => '0');
        end case;
        wait on iSrc, iImm;
    end process;
end architecture Bhv;

