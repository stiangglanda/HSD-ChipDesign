
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

entity TestbenchSR2D is
end entity TestbenchSR2D;

architecture Struct of TestbenchSR2D is
   constant cWidth : natural := 16;
   constant cStages : natural := 8;

   signal Clk 	: std_ulogic := '0';
   signal nRst 	: std_ulogic := '0';
   signal D 	: std_ulogic_vector(0 to cWidth-1);
   signal Q 	: std_ulogic_vector(0 to cWidth-1);
begin
    DUT: entity work.SR2D(Struct)
            generic map (gLength => cStages, 
                         gWidth => cWidth)
            port map (iClock => clk,
                      inReset => nRst,
                      iData => D,
                      oQ => Q);      
                      
   Clkgen:	Clk <= not Clk after 10 ns;
	 
   Stimul: process is
      begin
		D	<=  (others => '1') after 45 ns,
				 (others => '0') after 55 ns;
		nRst <= '1' after 5 ns;
		wait;
   end process Stimul;
      
end architecture Struct;

