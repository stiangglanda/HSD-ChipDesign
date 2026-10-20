-------------------------------------------------------------------------------
-- Title      : Technology independent top level entity
-- Project    : Look for top directory in CVS entries
-------------------------------------------------------------------------------
-- Abstract: 
-------------------------------------------------------------------------------
-- Company    : FH-Hagenberg/HSSE, Hagenberg/Austria
--              Copyright (c) 2000
-------------------------------------------------------------------------------
-- Authors are:
-- pfaff: Markus Pfaff
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;

entity SwellLed is

  generic (
    gClkFrequency : natural := 50E6;    -- frequency of system clk
    gPwmRate      : natural := 2E3);    -- frequency of PWM for LED

  
  port (iClk         : in std_ulogic;   -- system clock
        inResetAsync : in std_ulogic;   -- global asynchronous reset

        iDimmKey     : in  std_ulogic;  -- synchronized signal from dimming key
        iBrightenKey : in  std_ulogic;  -- synchronized signal from brightening key
        oLed         : out std_ulogic);  -- led which shall be dimmable

end SwellLed;

