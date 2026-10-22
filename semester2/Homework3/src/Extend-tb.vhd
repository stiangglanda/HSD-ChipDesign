--------------------------------------------------------
-- File          : Extend-tb.vhd
-- Titel      	 : CHD2 Sommersemester 2026 - Homework 3 
-- 				 : Thomas Mueller-W.
--------------------------------------------------------
-- Aufgabe       : Aufgabe 3 - Testbench Extension Unit
-- Student:in    : Leander Kieweg
-- Matrikelnummer: 52511155
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.SingleCycleCPUPack.all;

entity ExtendTenstbench is
end ExtendTenstbench;

architecture Stimulate of ExtendTenstbench is
        signal Src : aOpCode;
        signal ImmIn : aImm24;
        signal ImmOut : aData;
	begin
      uut: entity work.Extend(Bhv) 
      port map(
	    iSrc => Src,
		iImm => ImmIn,
		oImm => ImmOut);

	Stimuli : process
    begin
        Src <= cDOpCode;
        ImmIn <= "111111111111111111111111";
        wait for 50 ns;

        Src <= cMOpCode;
        wait for 50 ns;

        Src <= cBOpCode;
        wait for 50 ns;
        
        Src <= cDOpCode;
        ImmIn <= "101010101010101010101010";
        wait for 50 ns;

        Src <= cMOpCode;
        wait for 50 ns;

        Src <= cBOpCode;
        wait for 50 ns;
        wait;
    end process;
	  
end architecture Stimulate;