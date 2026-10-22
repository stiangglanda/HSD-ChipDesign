-------------------------------------------------------------------------------
-- Title      : VHDL Uebung 2 Aufgabe 1
-------------------------------------------------------------------------------
-- File       : uebung2_1.vhd
-- Author     : Steinmayr/Mueller-W.
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: parallel code (processes)
--   - Analyze the output!
--   - When and how often are the messages printed?
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2003/03/24  1.0  Steinmayr/Mueller-W. Created
-------------------------------------------------------------------------------

entity uebung2_1 is
end uebung2_1;

architecture behav of uebung2_1 is

  shared variable i : integer := 0;

begin

  p1 : process                          -- process 1 
  begin
    report "process 1";
    i := i+1;
    wait for 1 ns;
  end process;

  p2 : process                          -- process 2
  begin
    report "process 2";
    wait for 2 ns;
  end process;

  p3 : process                          -- process 3
  begin
    wait for 3 ns;
    report "process 3";
    wait;
  end process;

  p4 : process                          -- process 4
  begin
    wait for 1 ns;
    report "process 4, i = " & integer'image(i);  -- print content of i     
  end process;

end behav;


