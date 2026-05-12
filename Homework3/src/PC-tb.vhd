--------------------------------------------------------
-- File          : PC-tb.vhd
-- Titel      	 : CHD2 Sommersemester 2026 - Homework 3 
-- 				 : Thomas Mueller-W.
--------------------------------------------------------
-- Aufgabe       : Aufgabe 1 - Testbench Program Counter
-- Student:in    : 
-- Matrikelnummer: 
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.SingleCycleCPUPack.all;

entity PCTenstbench is
end PCTenstbench;

architecture Stimulate of PCTenstbench is
   signal Clk : std_ulogic := '0';
   begin
      uut: entity work.PC(Bhv) port map(
		 --> port map einfügen
	     iClk => Clk);

	  Stimuli: process
	  begin
         --> Testdaten 
	     wait; 
	  end process Stimuli;
	
	  ClkGen: process is
      begin
         Clk <= not Clk after 10 ns;
         wait on Clk;
	  end process ClkGen;
	  
end architecture Stimulate;