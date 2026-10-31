library IEEE;				   
use IEEE.std_logic_1164.all;

architecture UsingIf of Mux is
begin

usingif : process is
begin
    if iSel = '1' then
        oY <= iA;
    else
        oY <= iB;
    end if;
end process;

end UsingIf;
