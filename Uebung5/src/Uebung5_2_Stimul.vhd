Stimul:  process
  begin
    
    a <= '1' after 12 ns,
         '0' after 50 ns, 
         '1' after 100 ns,
         '0' after 250 ns;
           
    b <= '1' after 12 ns,
         '0' after 50 ns,
         '1' after 65 ns,
         '0' after 80 ns,
         '1' after 150 ns,
         '0' after 250 ns;
		 
	c <= '1' after 65 ns,
         '0' after 80 ns,
         '1' after 100 ns,
         '0' after 250 ns;
		 
	d <= '1' after 12 ns,
         '0' after 50 ns,
         '1' after 150 ns,
         '0' after 200 ns;
    wait;
  end process;