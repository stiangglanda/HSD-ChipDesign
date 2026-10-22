library ieee;
use ieee.std_logic_1164.all;

entity Uebung7 is
end entity Uebung7;

architecture Bsp1 of Uebung7 is
    signal A, B, C : integer := 0;
    signal D : std_logic := 'Z';

begin

    Assign1 : process is
    begin

        A <= 1 after 13 ns,
             8 after 21 ns,
             5 after 23 ns;

        B <= transport 6 after 3 ns,
                       7 after 10 ns,
                       3 after 100 ns;

        C <= reject 19 ns inertial 4 after 22 ns;

        D <= '0' after 17 ns;

        -- a) Bitte jetzt A,B,C,D und ihre driver aufzeichnen.
        wait for 15 ns;

        -- b) Bitte jetzt A,B,C,D und ihre driver aufzeichnen.
        D <= transport 'Z' after 4 ns;
        B <= transport 19 after 1 ns;

        wait for 0 ns; -- delta zyklus erzwingen!!

        -- c) Bitte jetzt D,B sowie driver von D und B aufzeichnen.
        C <= 4 after 67 ns;

        wait for 10 ns;

        -- d) Bitte jetzt C und den driver von C aufzeichnen.
        wait;

    end process Assign1;

    Assign2 : process is
    begin

        D <= '1' after 13 ns;

        wait;

    end process Assign2;

end Bsp1;