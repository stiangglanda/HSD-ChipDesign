--------------------------------------------------------
-- File          : PC-ea.vhd
-- Titel         : CHD2 Sommersemester 2026 - Homework 3 
--               : Thomas Mueller-W.
--------------------------------------------------------
-- Aufgabe       : Aufgabe 1 - Program Counter
-- Student:in    : Leander Kieweg
-- Matrikelnummer: 52511155
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.SingleCycleCPUPack.all;

entity PC is
   port (
		-- Hier die Ports ergänzen.
        iClk : in  std_ulogic;
        inRST : in  std_ulogic;
        iPCnext : in aPCvalue;
        oPCcurr : out aPCvalue);
end entity PC;

architecture Bhv of PC is
   begin
   -- siehe flankengesteuertes DFF
   process
   begin
      if inRST = '0' then
         oPCcurr <= (others => '0')  after cnRSTToPCcurrTpd;
      elsif iClk'event and iClk = '1' then
         oPCcurr <= iPCnext after cClkToPCcurrTpd;
      end if;
      wait on iClk, inRST;
   end process;
end architecture Bhv;

