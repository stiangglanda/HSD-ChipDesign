-------------------------------------------------------------------------------
-- Title      : Testbed of HelloOnDE23Lite for DE23-Lite
-- Project    : HelloDE23
-- Company    : FH OOe Hagenberg/A, Copyright (c) 2015
-------------------------------------------------------------------------------
-- Author         : Thomas Mueller-W,
-- Date           : 30.4.2015
-- Authors are
--              tm        : Thomas Mueller-W., Hagenberg
-- Revisions  : V1, 30.4.15, tm
-------------------------------------------------------------------------------

architecture Struct of HelloOnDE23Lite is

  signal ResetSync : std_ulogic;

  signal HexA : std_ulogic_vector(6 downto 0);
  signal HexB : std_ulogic_vector(6 downto 0);

begin

-- ---------------------------------------------------------------------------
-- Reset and Release IP Instantiation required for Agilex 3/5 FPGAs
-- ---------------------------------------------------------------------------
  ResetReleaseIpInst : entity work.ResetReleaseIP(Rtl)
    port map (
      iClk         => CLOCK0_50,
      inResetAsync => KEY0,
      onResetSync  => ResetSync
    );

-- ---------------------------------------------------------------------------
-- Names of entity ports and names of FPGA pins are different.
-- ---------------------------------------------------------------------------

  TheHelloDE23 : entity work.Hello(Rtl)
    generic map (
      gClockRateHz => 50*10**6)         -- 50 MHz
    port map (
      iClock     => CLOCK0_50,
      inReset    => ResetSync,
      iSW        => SW,
      o7SegCode0 => HexA,
      o7SegCode1 => HexB,
      oLed       => LEDR);

-- ---------------------------------------------------------------------------
-- Sevensegmentdisplays of DE23-Lite are low active.
-- ---------------------------------------------------------------------------
  HEX0 <= not HexA;
  HEX1 <= not HexB;

  HEX4 <= not HexA;
  HEX5 <= not HexB;
end Struct;
