--------------------------------------------------------
-- File          : PC-ea.vhd
-- Titel         : CHD2 Sommersemester 2026 - Homework 3 
--               : Thomas Mueller-W.
--------------------------------------------------------
-- Aufgabe       : Aufgabe 1 - Program Counter
-- Student:in    : 
-- Matrikelnummer: 
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
      process -- (iCLK, inRST) sensitivity list
    begin
        if inRST = '0' then
            -- wait for 10 ns; sensitivity liste nicht erlaubt
            oPCcurr <= (others => '0')  after 3 ns;
        elsif iCLK'event and iCLK = '1' then
            oPCcurr <= iPCnext after 4 ns;
        end if;
        wait on iCLK, inRST;
    end process;
end architecture Bhv;

