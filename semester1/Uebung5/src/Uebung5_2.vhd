library ieee;
use ieee.std_logic_1164.all;

entity U52 is
end entity;

architecture struct of U52 is
  signal a, b, c, d : std_ulogic;
  signal ab, abd, bc, nd, bcnd, y: std_ulogic;
begin

     p1: process is
     begin
          ab <= a and b after 10 ns;
          wait on a,b;
     end process;

     p2: process is
     begin
          abd <= ab and d after 10 ns;
          wait on ab, d;
     end process;

     p3: process is
     begin
          bc <= b and c after 10 ns;
          wait on b, c;
     end process;

     p4: process is
     begin
          nd <= not d after 10 ns;
          wait on d;
     end process;

     p5: process is
     begin
          bcnd <= bc and nd after 10 ns;
          wait on bc, nd;
     end process;

     p6: process is
     begin
          y <= abd or bcnd after 10 ns;
          wait on abd, bcnd;
     end process;

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
end architecture struct;