-------------------------------------------------------------------------------
-- Title      : Multiplier using add and shift method
-- Project    : Exercise 5
-------------------------------------------------------------------------------
-- File       : Multiplier-e.vhd
-- Author     : <your name>
-- Company    : FH-Hagenberg/HSD, Hagenberg/Austria
--              Copyright (c) 2013
-- Created    : 2013-11-07
-- Last update: 2013-11-07
-------------------------------------------------------------------------------
-- Description: See exercise description    
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author        Description
-- 2013/11/07  1.0      <your name>   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;

entity Multiplier is
  
  generic (gArgRange : integer := 4);
  port (iMultiplicant : in  unsigned(gArgRange-1 downto 0);
        iMultiplier   : in  unsigned(gArgRange-1 downto 0);
        oProduct      : out unsigned(2*gArgRange-1 downto 0));

end Multiplier;
