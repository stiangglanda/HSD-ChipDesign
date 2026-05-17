--------------------------------------------------------
-- File          : RegFile-ea.vhd
-- Titel         : CHD2 Sommersemester 2026 - Homework 3 
--               : Thomas Mueller-W.
--------------------------------------------------------
-- Aufgabe       : Aufgabe 2 - RegFile
-- Student:in    : Leander Kieweg
-- Matrikelnummer: 52511155
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
    type reg_array is array (cMaxRegAdr-1 downto 0) of aData;
    signal vReg_array : reg_array;
begin
    ReadReg: process
        variable vIndex1 : natural;
        variable vIndex2 : natural;
    begin
        vIndex1 := toNat(iA1);
        vIndex2 := toNat(iA2);

        if vIndex1 = cMaxRegAdr then
            oRD1 <= iR15 after cRegReadTpd;
        else
            oRD1 <= vReg_array(vIndex1) after cRegReadTpd;
        end if;

        if vIndex2 = cMaxRegAdr then
            oRD2 <= iR15 after cRegReadTpd;
        else
            oRD2 <= vReg_array(vIndex2) after cRegReadTpd;
        end if;

        wait on iA1, iA2, vReg_array, iR15;
    end process;

    WriteReg: process
        variable vIndex : natural;
    begin
        if iClk'event and iClk = '1' and iWE3 = '1' then
            vIndex := toNat(iA3);
            if vIndex /= cMaxRegAdr then 
                vReg_array(vIndex) <= iWD3 after cClkToRegisterTpd;
            end if;
        end if;
        wait on iClk;
    end process;
end architecture Bhv;

