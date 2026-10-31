library IEEE;
use IEEE.std_logic_1164.all;

architecture UsingIf of Mux is
begin

  process (iSel, iA, iB) is
  begin
    if iSel = '1' or iSel = 'H' then
        oY <= iA;
    elsif iSel = '0' or iSel = 'L' then
        oY <= iB;
    else
        oY <= 'X';
    end if;
  end process;

end UsingIf;