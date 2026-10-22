architecture Struct of SwellLedOnDE23Lite is

  signal ResetSync : std_ulogic;
  signal PwmLed    : std_ulogic;

begin

  -- -------------------------------------------------------------------------
  -- Reset and Release IP Instantiation (Pflicht bei Agilex FPGAs)
  -- -------------------------------------------------------------------------
  ResetReleaseIpInst : entity work.ResetReleaseIP(Rtl)
    port map (
      iClk         => CLOCK0_50,
      inResetAsync => KEY0,
      onResetSync  => ResetSync
    );

  -- -------------------------------------------------------------------------
  -- SwellLed Instanziierung
  -- -------------------------------------------------------------------------
  TheSwellLed : entity work.SwellLed(Rtl)
    generic map (
      gClkFrequency => 50E6,
      gPwmRate      => 2E3
    )
    port map (
      iClk         => CLOCK0_50,
      inResetAsync => ResetSync,
      -- Negative Logik der Board-Taster invertieren (Aktiv = '1'):
      iDimmKey     => not KEY1,
      iBrightenKey => not KEY2,
      oLed         => PwmLed
    );

  -- -------------------------------------------------------------------------
  -- Ausgänge beschalten
  -- -------------------------------------------------------------------------
  LEDR(0) <= PwmLed;
  LEDR(9 downto 1) <= (others => '0');  -- Restliche LEDs aus

end architecture Struct;