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
    	signal nRST : std_ulogic;
    	signal PCnext : aPCvalue;
    	signal PCcurr : aPCvalue;
	begin
      uut: entity work.PC(Bhv) port map(
		 --> port map einfügen
	    iClk => Clk,
		inRST => nRST,
		iPCnext => PCnext,
		oPCcurr => PCcurr);


	Stimuli : process
    begin
        wait for 55 ns;
        PCnext <= "1010101010101010101010101010101010";
        wait for 80 ns;
        PCnext <= "0000000000000000000000000000000000";
        wait for 70 ns;
        PCnext <= "1111111111111111111111111111111111";

		nRST <= '0';
        wait for 30 ns;
        nRST <= '1';

        wait for 90 ns;
        nRST <= '0';
        wait for 25 ns;
        nRST <= '1';
        wait;
    end process;
	
	ClkGen: process is
    begin
        Clk <= not Clk after 10 ns;
        wait on Clk;
	end process ClkGen;
	  
end architecture Stimulate;