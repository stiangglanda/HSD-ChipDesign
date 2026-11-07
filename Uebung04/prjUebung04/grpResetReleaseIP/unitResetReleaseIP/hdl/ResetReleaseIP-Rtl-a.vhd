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

architecture Rtl of ResetReleaseIP is

	component reset_release_ip is
		port (
			ninit_done : out std_logic   -- ninit_done
		);
	end component reset_release_ip;

	signal ninit_done : std_ulogic;
	signal reset_sync_n : std_ulogic_vector(1 downto 0);

begin 

    ip_inst : component reset_release_ip
		port map (
			ninit_done => ninit_done  -- ninit_done.ninit_done
		);

	process (iClk) is 
	begin 
		if rising_edge(iClk) then 
			reset_sync_n <= reset_sync_n(0) & inResetAsync;
		end if;
	end process;

	onResetSync <= reset_sync_n(1) and not(ninit_done);

end Rtl;
