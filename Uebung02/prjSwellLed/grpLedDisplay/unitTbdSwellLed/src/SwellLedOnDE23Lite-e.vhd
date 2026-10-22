library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SwellLedOnDE23Lite is
  port (
    CLOCK0_50 : in  std_ulogic;
    KEY0      : in  std_ulogic;  -- Asynchroner Reset (Low-aktiv)
    KEY1      : in  std_ulogic;  -- DimmKey (Low-aktiv)
    KEY2      : in  std_ulogic;  -- BrightenKey (Low-aktiv)
    LEDR      : out std_ulogic_vector(9 downto 0)
  );
end entity SwellLedOnDE23Lite;