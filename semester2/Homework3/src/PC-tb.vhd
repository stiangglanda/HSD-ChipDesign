--------------------------------------------------------
-- File          : PC-tb.vhd
-- Titel      	 : CHD2 Sommersemester 2026 - Homework 3 
-- 				 : Thomas Mueller-W.
--------------------------------------------------------
-- Aufgabe       : Aufgabe 1 - Testbench Program Counter
-- Student:in    : Leander Kieweg
-- Matrikelnummer: 52511155
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.SingleCycleCPUPack.all;

entity PCTestbench is
end PCTestbench;

architecture Stimulate of PCTestbench is
   		signal Clk : std_ulogic := '0';
    	signal nRST : std_ulogic := '0';
    	signal PCnext : aPCvalue := (others => '0');
    	signal PCcurr : aPCvalue;
	begin
      uut: entity work.PC(Bhv) port map(
	    iClk => Clk,
		inRST => nRST,
		iPCnext => PCnext,
		oPCcurr => PCcurr);


	Stimuli : process
    begin
		nRST   <= '0';
    	PCnext <= (others => '0');
		wait for 15 ns;

		nRST   <= '1';
        PCnext <= x"00000004";
        wait for 20 ns;

		PCnext <= x"AABBCCDD";
        wait for 20 ns;

		PCnext <= x"FFFFFFFF";
        wait for 20 ns;

		PCnext <= x"12345678";
        wait for 10 ns;
        nRST <= '0';
        wait for 5 ns;

		nRST <= '1';
        wait for 15 ns;

        PCnext <= x"00000008";
        wait for 20 ns;

		PCnext <= x"DEADBEEF";
        wait for 5 ns;
        PCnext <= x"CAFEBABE";

        wait;
    end process;
	
	ClkGen: process is
    begin
        Clk <= not Clk after 10 ns;
        wait on Clk;
	end process ClkGen;
	  
end architecture Stimulate;