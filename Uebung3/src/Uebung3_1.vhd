	-- signal Q:      bit := '1';
	-- signal R,S,Qn: bit := '0';   

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