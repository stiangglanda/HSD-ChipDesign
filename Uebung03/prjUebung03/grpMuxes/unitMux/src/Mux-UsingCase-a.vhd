library IEEE;				   
use IEEE.std_logic_1164.all;

architecture UsingCase of Mux is
begin
    
usingcase : process is
begin
    case iSel is
        when '1' =>
            oY <= iA;
        when '0' =>
            oY <= iB;
        when others =>
            oY <= iB;
    end case;
end process;

end UsingCase;


    