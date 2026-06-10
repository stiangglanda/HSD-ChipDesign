----------------------------------------------------------------------------------------
-- Title      : Display two hexadecimal values defined by switches on 7-Segment Displays
-- Project    : HelloDE1
-- Company    : FH OOe Hagenberg/A, Copyright (c) 2015
----------------------------------------------------------------------------------------
-- Author	  : Thomas Mueller-W,
-- Date		  : 30.4.2015
-- Authors are
-- 		tm	  : Thomas Mueller-W., Hagenberg
-- Revisions  : V1, 30.4.15, tm
----------------------------------------------------------------------------------------

use work.Global.all;

architecture Rtl of HelloDE1 is

	signal 		nibble0 		: std_ulogic_vector(3 downto 0);
	signal 		nibble1 		: std_ulogic_vector(3 downto 0);

	subtype 	aHeartBeatCnt is natural range 0 to gClockRateHz;
	signal  	cnt 		: aHeartBeatCnt;
	constant 	cCnt_max 	: aHeartBeatCnt := gClockRateHz/5;
	signal		led_status	: boolean;

begin  -- Rtl

-- ---------------------------------------------------------------------------
-- Switch 0-3: HEX0
-- Switch 4-7: HEX1 
-- ---------------------------------------------------------------------------
  
	nibble0 <= iSW(3) & iSW(2) & iSW(1) & iSW(0);
	nibble1 <= iSW(7) & iSW(6) & iSW(5) & iSW(4);
  
	TheHex0 : entity work.Hex2SevenSegment(Rtl)
		port map (iHexValue	=> nibble0,
				  o7SegCode	=> o7SegCode0);

	TheHex1 : entity work.Hex2SevenSegment(Rtl)
		port map (iHexValue	=> nibble1,
				  o7SegCode	=> o7SegCode1);

-- ---------------------------------------------------------------------------
-- Heartbeat : LED(9)
-- ---------------------------------------------------------------------------
  
	Heartbeat: process (iClock, inReset) is
	begin
		if inReset = cnActivated  then
			cnt <= 0;
			led_status <= false;
		elsif iClock'event and iClock = '1' then
			if cnt >= cCnt_max then
				cnt <= 0;
				led_status <= not led_status;
			else 
				cnt <= cnt + 1;
			end if;
		end if;
	end process;
		
	oLed(9) <= cActivated when led_status else cInactivated;
	
-- ---------------------------------------------------------------------------
-- LEDS (0) to LEDS(7) show status of switches SW0-SW7
-- ---------------------------------------------------------------------------
    oLed(3 downto 0) <= nibble0;
	oLed(7 downto 4) <= nibble1;

end Rtl;
