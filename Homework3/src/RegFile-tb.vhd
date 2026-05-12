--------------------------------------------------------
-- File          : RegFile-tb.vhd
-- Titel      	 : CHD2 Sommersemester 2026 - Homework 3 
-- 				 : Thomas Mueller-W.
--------------------------------------------------------
-- Aufgabe       : Aufgabe 2 - Testbench RegisterFile
-- Student:in    : 
-- Matrikelnummer: 
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.SingleCycleCPUPack.all;

entity RegFileTB is
end RegFileTB;

architecture Stimulate of RegFileTB is
	signal A1,A2,A3		  : aRegAdr    := (others=>'0');
	signal RD1,RD2,WD3,PC : aData      := (others=>'0');
	signal WE3,Clk		  : std_ulogic := '0';

begin
	uut: entity work.RegFile(Bhv) port map(
		iA1  => A1, 
		iA2  => A2,
		oRD1 => RD1,
		oRD2 => RD2,	
		iA3  => A3,
		iWD3 => WD3, 
		iWE3 => WE3, 
		iR15 => PC,		
		iClk => Clk
	);

	Stimuli: process
	begin
	
	   WE3 <=	'1' after 10 ns,
				'0' after 110 ns;
		
       PC	<=  x"F0F0F0F0";
		
       WD3 <=	x"00000003" after 15 ns,
				x"0000FFFF" after 35 ns,
				x"81818181" after 55 ns,
				x"01010101" after 75 ns,
				x"CCCCCCCC" after 95 ns;
		
	   A3 <=	"0000" after 15 ns,
				"0101" after 35 ns,
				"1000" after 55 ns,
				"1111" after 75 ns,	
				"0011" after 95 ns;
		
       A1 <=	"0000" after 15 ns,
				"0101" after 35 ns,
				"1000" after 55 ns,
				"1111" after 75 ns,
				"0011" after 95 ns;
				
	   A2 <=	"0000" after 120 ns,
				"0101" after 140 ns,
				"1000" after 160 ns,
				"1111" after 180 ns;
	   wait; 
	end process Stimuli;
	
	ClkGen: process is
    begin
       Clk <= not Clk after 10 ns;
       wait on Clk;
	end process ClkGen;

end Stimulate;