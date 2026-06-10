
--------------------------------------------------
-- File       : SR1-tb.vhd
-- Author     : tmw
-- Platform   : Modelsim Student Edition
--------------------------------------------------
-- Description: Testbench for 1-Bit Shiftregister 
--			  : Length defined by generic gLength
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity TestbenchSR1 is
end entity TestbenchSR1;

architecture Struct of TestbenchSR1 is
   signal Clk 	: std_ulogic := '0';
   signal nRst 	: std_ulogic := '0';
   signal D 	: std_ulogic := '0';
   signal Q 	: std_ulogic;
   
begin
    DUT: entity work.SR1_4(Struct)   
            port map (iClock => clk,
                      inReset => nRst,
                      iData => D,
                      oQ => Q);      
                      
   Clkgen:	Clk <= not Clk after 10 ns;
	 
   Stimul: process is
      begin
		D	<= 	'1' after 45 ns,
				'0' after 55 ns;
		nRst <= '1' after 5 ns;
		wait;
   end process Stimul;
      
end architecture Struct;

