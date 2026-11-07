
library ieee;
use ieee.std_logic_1164.all;

architecture UsingIf of Mpx is
begin

    Gen8 : if gNumInputs = 8 generate
        process (iA, iSel) is
        begin
            if iSel = "000" then
                oY <= iA(0);
            elsif iSel = "001" then
                oY <= iA(1);
            elsif iSel = "010" then
                oY <= iA(2);
            elsif iSel = "011" then
                oY <= iA(3);
            elsif iSel = "100" then
                oY <= iA(4);
            elsif iSel = "101" then
                oY <= iA(5);
            elsif iSel = "110" then
                oY <= iA(6);
            elsif iSel = "111" then
                oY <= iA(7);
            else
                oY <= 'U';
            end if;
        end process;
    end generate Gen8;

    Gen12 : if gNumInputs = 12 generate
        process (iA, iSel) is
        begin
            if iSel = "0000" then
                oY <= iA(0);
            elsif iSel = "0001" then
                oY <= iA(1);
            elsif iSel = "0010" then
                oY <= iA(2);
            elsif iSel = "0011" then
                oY <= iA(3);
            elsif iSel = "0100" then
                oY <= iA(4);
            elsif iSel = "0101" then
                oY <= iA(5);
            elsif iSel = "0110" then
                oY <= iA(6);
            elsif iSel = "0111" then
                oY <= iA(7);
            elsif iSel = "1000" then
                oY <= iA(8);
            elsif iSel = "1001" then
                oY <= iA(9);
            elsif iSel = "1010" then
                oY <= iA(10);
            elsif iSel = "1011" then
                oY <= iA(11);
            else
                oY <= 'U';
            end if;
        end process;
    end generate Gen12;

end architecture;