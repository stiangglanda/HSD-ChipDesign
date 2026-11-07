library IEEE;				   
use IEEE.std_logic_1164.all;

architecture UsingIfElse of Mux is
 begin

  mux: process (iA,iB,iSel)   
  begin
    oY <= 'X';
    if iSel='1' then 
      oY <= iB;
    elsif iSel='0' then
      oY <= iA;
    end if;
  end process;

end UsingIfElse;


