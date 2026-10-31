library IEEE;
use IEEE.std_logic_1164.all;

entity AllMyMuxesOnDE23Lite is
  port (
    CLOCK0_50 : in  std_ulogic;
    SW   : in  std_ulogic_vector(2 downto 0);
    LEDR : out std_ulogic_vector(5 downto 0));
end entity;

architecture Struct of AllMyMuxesOnDE23Lite is
  signal Y : std_ulogic_vector(5 downto 0);
begin

  Tbd : entity work.TbdMux
    port map (
      iClk => CLOCK0_50,
      iA   => SW(2),
      iB   => SW(1),
      iSel => SW(0),
      oY   => Y);

  LEDR <= not Y;

end Struct;