---------------------------------------------------------------------------
-- Title      : Testbench for Hex2SevenSegment
-- Project    : HelloDE1
-- Company    : FH OOe Hagenberg/A, Copyright (c) 2015
-------------------------------------------------------------------------------
-- Author         : Thomas Mueller-W,
-- Date           : 30.4.2015
-- Authors are
--              tm        : Thomas Mueller-W., Hagenberg
-- Revisions  : V1, 30.4.15, tm
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tbHex2SevenSegment is
end tbHex2SevenSegment;

architecture Bhv of tbHex2SevenSegment is

  signal nibble       : std_ulogic_vector(3 downto 0);
  signal sevenSegCode : std_ulogic_vector(6 downto 0);

begin

  DUT : entity work.Hex2SevenSegment(Rtl)
    port map (
      iHexValue => nibble,
      o7SegCode => sevenSegCode);

  Stimul : process is
  begin
    -- 8
    nibble <= ('1', '0', '0', '0');
    wait for 100 ns;

    -- 0
    nibble <= "0000";
    wait for 100 ns;

    -- F
    nibble <= "1111";
    wait for 100 ns;

    -- 1
    nibble <= "0001";
    wait for 100 ns;

    wait;
  end process Stimul;

end Bhv;

