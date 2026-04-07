	-- signal Q:      bit := '1';
	-- signal R,S,Qn: bit := '0';   

entity uebung3 is
end entity uebung3;

architecture behav of uebung3 is

  signal Q : bit := '1';
  signal Qn : bit := '0';
  signal r, s : bit := '0';

begin

  Nor2: process is
  begin
    Qn <= Q nor S after 0 ns;
    wait on Q, S;
  end process Nor2;

  Nor1: process is
  begin
    Q <= Qn nor R after 0 ns;
    wait on Qn, R;
  end process Nor1;

Stimul: process
   begin
   
    S <= '1' after 300 ns,
		 '0' after 400 ns,
		 '1' after 500 ns,
		 '0' after 600 ns;
    R <= '1' after 100 ns,
		 '0' after 200 ns,
		 '1' after 500 ns,
		 '0' after 600 ns;   
    wait;
end process;

end architecture behav;