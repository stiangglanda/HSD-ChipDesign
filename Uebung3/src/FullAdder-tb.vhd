entity TB_FullAdder is
end entity ;

architecture Testbench of TB_FullAdder is
    signal A, B, Cin : bit;
    signal Sum, Cout : bit;
begin
    uut: entity work.FullAdder
        port map (
            ia => A,
            ib => B,
            icin => Cin,
            os => Sum,
            ocout => Cout
        );
    
    Stimuli: process        
    begin
        -- Test case 1: 0 + 0 + 0
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 25 ns;

        if Sum /= '0' or Cout /= '0' then
            report "Test case 1 failed: Expected Sum=0, Cout=0" severity error;
        else
            report "Test case 1 passed: Sum=0, Cout=0" severity note;
        end if;
        
        -- Test case 2: 0 + 0 + 1
        A <= '0'; B <= '0'; Cin <= '1';
        wait for 25 ns;

        if Sum /= '1' or Cout /= '0' then
            report "Test case 2 failed: Expected Sum=1, Cout=0" severity error;
        else
            report "Test case 2 passed: Sum=1, Cout=0" severity note;
        end if;
        
        -- Test case 3: 0 + 1 + 0
        A <= '0'; B <= '1'; Cin <= '0';
        wait for 25 ns;

        if Sum /= '1' or Cout /= '0' then
            report "Test case 3 failed: Expected Sum=1, Cout=0" severity error;
        else
            report "Test case 3 passed: Sum=1, Cout=0" severity note;
        end if;
        
        -- Test case 4: 0 + 1 + 1
        A <= '0'; B <= '1'; Cin <= '1';
        wait for 25 ns;

        if Sum /= '0' or Cout /= '1' then
            report "Test case 4 failed: Expected Sum=0, Cout=1" severity error;
        else
            report "Test case 4 passed: Sum=0, Cout=1" severity note;
        end if;
        
        -- Test case 5: 1 + 0 + 0
        A <= '1'; B <= '0'; Cin <= '0';
        wait for 25 ns;

        if Sum /= '1' or Cout /= '0' then
            report "Test case 5 failed: Expected Sum=1, Cout=0" severity error;
        else
            report "Test case 5 passed: Sum=1, Cout=0" severity note;
        end if;
        
        -- Test case 6: 1 + 0 + 1
        A <= '1'; B <= '0'; Cin <= '1';
        wait for 25 ns;

        if Sum /= '0' or Cout /= '1' then
            report "Test case 6 failed: Expected Sum=0, Cout=1" severity error;
        else
            report "Test case 6 passed: Sum=0, Cout=1" severity note;
        end if;
        
        -- Test case 7: 1 + 1 + 0
        A <= '1'; B <= '1'; Cin <= '0';
        wait for 25 ns;

        if Sum /= '0' or Cout /= '1' then
            report "Test case 7 failed: Expected Sum=0, Cout=1" severity error;
        else
            report "Test case 7 passed: Sum=0, Cout=1" severity note;
        end if;
        
        -- Test case 8: 1 + 1 + 1
        A <= '1'; B <= '1'; Cin <= '1';
        wait for 25 ns;

        if Sum /= '1' or Cout /= '1' then
            report "Test case 8 failed: Expected Sum=1, Cout=1" severity error;
        else
            report "Test case 8 passed: Sum=1, Cout=1" severity note;
        end if;

        wait; -- End of simulation
    end process Stimuli;
end architecture Testbench;
