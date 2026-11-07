
library ieee;
use ieee.std_logic_1164.all;

architecture UsingCase of Mpx is
begin

    Gen8 : if gNumInputs = 8 generate
        process (iA, iSel) is
        begin
            case iSel is
                when "000" => oY <= iA(0);
                when "001" => oY <= iA(1);
                when "010" => oY <= iA(2);
                when "011" => oY <= iA(3);
                when "100" => oY <= iA(4);
                when "101" => oY <= iA(5);
                when "110" => oY <= iA(6);
                when "111" => oY <= iA(7);
                when others => oY <= 'U';
            end case;
        end process;
    end generate Gen8;

    Gen12 : if gNumInputs = 12 generate
        process (iA, iSel) is
        begin
            case iSel is
                when "0000" => oY <= iA(0);
                when "0001" => oY <= iA(1);
                when "0010" => oY <= iA(2);
                when "0011" => oY <= iA(3);
                when "0100" => oY <= iA(4);
                when "0101" => oY <= iA(5);
                when "0110" => oY <= iA(6);
                when "0111" => oY <= iA(7);
                when "1000" => oY <= iA(8);
                when "1001" => oY <= iA(9);
                when "1010" => oY <= iA(10);
                when "1011" => oY <= iA(11);
                when others => oY <= 'U';
            end case;
        end process;
    end generate Gen12;

end architecture UsingCase;