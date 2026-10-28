---------------------------------------------------------------------------
-- Title      : Reset Release IP required for Agilex 3/5 FPGAs
-- Project    : HelloDE23
-- Company    : FH OOe Hagenberg/A, Copyright (c) 2015
-------------------------------------------------------------------------------
-- Author         : Daniel Windhager,
-- Date           : 30.4.2015
-- Authors are
--              dw        : Daniel Windhager, Hagenberg
-- Revisions  : V1, 05.09.26, dw
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ResetReleaseIP is
  port (
    iClk         : in  std_ulogic;
    inResetAsync : in  std_ulogic;
    onResetSync  : out std_ulogic
    ); 
end ResetReleaseIP;
