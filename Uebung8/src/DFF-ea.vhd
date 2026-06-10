--------------------------------------------------
-- File       : DFF-ea.vhd
-- Author     : tmw
-- Platform   : Modelsim Student Edition
--------------------------------------------------
-- Description: D-FlipFlop Behaviour
--				using std_ulogic
--------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016/04/14  1.0      tmw     Created
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity DFF is
  port (iClk	: in std_ulogic;
		inRst	: in std_ulogic;
		iD		: in std_ulogic;
        oQ 		: out std_ulogic);
end entity DFF;

architecture Bhv of DFF is
begin
    process (inRst, iClk) is
    begin
	  if inRst = not('1') then
		 oQ <= '0' after 3 ns;
	  elsif iClk'event and iClk= '1' then
		 oQ <= iD after 4 ns;
	  end if;
	end process;	

end architecture Bhv;

