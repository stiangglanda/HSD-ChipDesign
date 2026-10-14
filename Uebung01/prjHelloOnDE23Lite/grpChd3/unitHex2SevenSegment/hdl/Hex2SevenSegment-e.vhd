---------------------------------------------------------------------------
-- Title      : Hex-To-Seven-Segment-Decoder
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

entity Hex2SevenSegment is
  port (
    iHexValue : in  std_ulogic_vector(3 downto 0);
    o7SegCode : out std_ulogic_vector(6 downto 0));
end Hex2SevenSegment;
