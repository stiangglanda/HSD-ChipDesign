library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RSFlipFlop_tb is
end entity;

architecture struct of RSFlipFlop_tb is
    signal Set  : std_ulogic;
    signal R    : std_ulogic;
    signal Q    : std_ulogic;
    signal Qn   : std_ulogic;
begin
    uut : entity work.RSFlipFlop(struct)
        port map(
            iSet => Set,
            iR => R,
            oQ => Q,
            oQn => Qn);

    Stimul: process
    begin
        Set <= '1' after 300 ns,
		       '0' after 400 ns,
			   '1' after 500 ns,
			   '0' after 600 ns;
        R <= '1' after 100 ns,
			 '0' after 200 ns,
			 '1' after 500 ns,
		     '0' after 600 ns;   
    wait;
end process;

end architecture;
