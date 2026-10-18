----------------------------------------------------------------------------------------
-- Title      : Display two hexadecimal values defined by switches on 7-Segment Displays
-- Project    : HelloDE1
-- Company    : FH OOe Hagenberg/A, Copyright (c) 2015
----------------------------------------------------------------------------------------
-- Author         : Thomas Mueller-W,
-- Date           : 30.4.2015
-- Authors are
--              tm        : Thomas Mueller-W., Hagenberg
-- Revisions  : V1, 30.4.15, tm
----------------------------------------------------------------------------------------

architecture Rtl of Hello is

  signal nibble0 : std_ulogic_vector(3 downto 0);
  signal nibble1 : std_ulogic_vector(3 downto 0);

  subtype aHeartBeatCnt is natural range 0 to gClockRateHz;
  signal cnt        : aHeartBeatCnt;
  constant cCnt_max : aHeartBeatCnt := gClockRateHz/5;
  signal led_status : boolean;
  signal led_shift : std_ulogic_vector(7 downto 0);
  signal sw_old : std_ulogic;
begin  -- Rtl

-- ---------------------------------------------------------------------------
-- Switch 0-3: HEX0
-- Switch 4-7: HEX1 
-- ---------------------------------------------------------------------------

  nibble0 <= iSW(3) & iSW(2) & iSW(1) & iSW(0);
  nibble1 <= iSW(7) & iSW(6) & iSW(5) & iSW(4);

  TheHex0 : entity work.Hex2SevenSegment(Rtl)
    port map (iHexValue => nibble0,
              o7SegCode => o7SegCode0);

  TheHex1 : entity work.Hex2SevenSegment(Rtl)
    port map (iHexValue => nibble1,
              o7SegCode => o7SegCode1);

-- ---------------------------------------------------------------------------
-- Heartbeat : LED(8)
-- ---------------------------------------------------------------------------

  Heartbeat : process (iClock, inReset) is
  begin
    if inReset = not('1') then
      cnt        <= 0;
      led_status <= false;
    elsif rising_edge(iClock) then
      if cnt >= cCnt_max then
        cnt        <= 0;
        led_status <= not led_status;
      else
        cnt <= cnt + 1;
      end if;
    end if;
  end process;

  oLed(9) <= '1';
  oLed(8) <= '0' when led_status and iSW(9) = '0' else '1';

  LedShift : process (iClock, inReset) is
  begin
    if inReset = not('1') then
      led_shift <= "00000001";
      sw_old    <= iSW(0);
    elsif rising_edge(iClock) then
      sw_old <= iSW(0);
      if iSW(0) /= sw_old then
        led_shift <= led_shift(6 downto 0) & led_shift(7);
      end if;
    end if;
  end process;

  oLed(7 downto 0) <= not led_shift;
-- ---------------------------------------------------------------------------
-- LEDS (0) to LEDS(7) show status of switches SW0-SW7
-- ---------------------------------------------------------------------------
  -- oLed(3 downto 0) <= nibble0;
  -- oLed(7 downto 4) <= nibble1;

end Rtl;
