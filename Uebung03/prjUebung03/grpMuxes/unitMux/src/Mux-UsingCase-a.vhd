library IEEE;
use IEEE.std_logic_1164.all;

architecture UsingCase of Mux is
begin

  process (iSel, iA, iB) is
  begin
    case iSel is
        when '1' | 'H' => oY <= iB;
        when '0' | 'L' => oY <= iA;
        when others    => oY <= 'X';
    end case;
  end process;

end UsingCase;