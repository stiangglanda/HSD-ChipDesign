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

library ieee;
use ieee.std_logic_1164.all;

entity Hello is
  generic (
    gClockRateHz : natural := 20*10**6);  -- 20 MHz
  port (
    iClock     : in  std_ulogic;
    inReset    : in  std_ulogic;
    iSW        : in  std_ulogic_vector(9 downto 0);
    o7SegCode0 : out std_ulogic_vector(6 downto 0);
    o7SegCode1 : out std_ulogic_vector(6 downto 0);
    oLed       : out std_ulogic_vector(9 downto 0));
end Hello;
