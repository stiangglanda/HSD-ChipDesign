-------------------------------------------------------------------------------
-- Title      : Testbed of HelloDE1 for DE1-Soc 
-- Project    : HelloDE1
-- Company    : FH OOe Hagenberg/A, Copyright (c) 2015
-------------------------------------------------------------------------------
-- Author	  : Thomas Mueller-W,
-- Date		  : 30.4.2015
-- Authors are
-- 		tm	  : Thomas Mueller-W., Hagenberg
-- Revisions  : V1, 30.4.15, tm
-------------------------------------------------------------------------------

use work.Global.all;

architecture Struct of TbdHelloDE1 is

	signal hex0_internal	: std_ulogic_vector(6 downto 0);
	signal hex1_internal	: std_ulogic_vector(6 downto 0);
	
begin 

-- ---------------------------------------------------------------------------
-- Names of entity ports and names of FPGA pins are different.
-- ---------------------------------------------------------------------------

	TheHelloDE1: entity work.HelloDE1(Rtl) 
	    generic map (gClockRateHz 	=> 50*10**6)  -- 50 MHz
		port map    (iClock			=> CLOCK_50,  
					 inReset 		=> KEY0,		
					 iSW			=> SW,
					 o7SegCode0		=> hex0_internal,
					 o7SegCode1		=> hex1_internal,
					 oLed			=> LEDR);
 
-- ---------------------------------------------------------------------------
-- Sevensegmentdisplays of DE1-SoC are low active.
-- ---------------------------------------------------------------------------
    HEX0 <= not Hex0_internal;
	HEX1 <= not HEX1_internal;

end Struct;
