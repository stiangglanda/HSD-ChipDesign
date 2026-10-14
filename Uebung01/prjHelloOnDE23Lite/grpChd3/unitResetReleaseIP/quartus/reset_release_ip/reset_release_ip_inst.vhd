	component reset_release_ip is
		port (
			ninit_done : out std_logic   -- ninit_done
		);
	end component reset_release_ip;

	u0 : component reset_release_ip
		port map (
			ninit_done => CONNECTED_TO_ninit_done  -- ninit_done.ninit_done
		);

