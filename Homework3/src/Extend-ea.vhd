--------------------------------------------------------
-- File          : Extend-ea.vhd
-- Titel         : CHD2 Sommersemester 2026 - Homework 3 
--               : Thomas Mueller-W.
--------------------------------------------------------
-- Aufgabe       : Aufgabe 3 - Extension Unit
-- Student:in    : Leander Kieweg
-- Matrikelnummer: 52511155
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
        variable vResult : aData;
    begin
        vResult := (others => '0');
        case iSrc is
            when cDOpCode =>
                vResult(7 downto 0) := iImm(7 downto 0);
            when cMOpCode =>
                vResult(11 downto 0) := iImm(11 downto 0);
            when cBOpCode =>
                vResult := (others => iImm(23));
                vResult(25 downto 0) := iImm(23 downto 0) & "00";
            when others => null;
        end case;
        oImm <= vResult after cExtendTpd;
        wait on iSrc, iImm;
    end process;
end architecture Bhv;

