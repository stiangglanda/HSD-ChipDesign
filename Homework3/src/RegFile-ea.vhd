--------------------------------------------------------
-- File          : RegFile-ea.vhd
-- Titel         : CHD2 Sommersemester 2026 - Homework 3 
--               : Thomas Mueller-W.
--------------------------------------------------------
-- Aufgabe       : Aufgabe 2 - RegFile
-- Student:in    : 
-- Matrikelnummer: 
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.SingleCycleCPUPack.all;

entity RegFile is
   port (
        iClk : in std_ulogic;
        iWE3 : in std_ulogic;
        iA1 : in aRegAdr;
        iA2 : in aRegAdr;
        iA3 : in aRegAdr;
        iWD3 : in aData;
        iR15 : in aData;
        oRD1 : out aData;
        oRD2 : out aData);
end entity RegFile;

architecture Bhv of RegFile is
begin
    ReadReg: process
    begin

    end process;

    WriteReg: process
    begin
        if iClk'event and iClk = '1' then

        end if;
        wait on iClk;
    end process;
end architecture Bhv;

