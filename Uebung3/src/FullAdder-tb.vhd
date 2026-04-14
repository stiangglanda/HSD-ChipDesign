entity FullAdderTB is
end entity ;

architecture struct of FullAdderTB is
    signal a, b, cin : bit := '0';

    signal s, cout : bit;
begin
    uut: entity work.FullAdder(behave)
        port map (
            ia => a,
            ib => b,
            icin => cin,
            os => s,
            ocout => cout);
    
    Stimuli: process is
    begin
        a<='0' after 100 ns,
            '1' after 200 ns;

        
        b <= '0' after 100 ns,
             '1' after 200 ns;

        cin <= '0' after 100 ns,
               '1' after 200 ns;

        -- Test case 1: 0 + 0 + 0
        a <= '0'; b <= '0'; cin <= '0';
        wait for 25 ns;

        if s /= '0' or cout /= '0' then
            report "Test case 1 failed: Expected s=0, cout=0" severity error;
        else
            report "Test case 1 passed: s=0, cout=0" severity note;
        end if;
        
        -- Test case 2: 0 + 0 + 1
        a <= '0'; b <= '0'; cin <= '1';
        wait for 25 ns;

        if s /= '1' or cout /= '0' then
            report "Test case 2 failed: Expected s=1, cout=0" severity error;
        else
            report "Test case 2 passed: s=1, cout=0" severity note;
        end if;
        
        -- Test case 3: 0 + 1 + 0
        a <= '0'; b <= '1'; cin <= '0';
        wait for 25 ns;

        if s /= '1' or cout /= '0' then
            report "Test case 3 failed: Expected s=1, cout=0" severity error;
        else
            report "Test case 3 passed: s=1, cout=0" severity note;
        end if;
        
        -- Test case 4: 0 + 1 + 1
        a <= '0'; b <= '1'; cin <= '1';
        wait for 25 ns;

        if s /= '0' or cout /= '1' then
            report "Test case 4 failed: Expected s=0, cout=1" severity error;
        else
            report "Test case 4 passed: s=0, cout=1" severity note;
        end if;
        
        -- Test case 5: 1 + 0 + 0
        a <= '1'; b <= '0'; cin <= '0';
        wait for 25 ns;

        if s /= '1' or cout /= '0' then
            report "Test case 5 failed: Expected s=1, cout=0" severity error;
        else
            report "Test case 5 passed: s=1, cout=0" severity note;
        end if;
        
        -- Test case 6: 1 + 0 + 1
        a <= '1'; b <= '0'; cin <= '1';
        wait for 25 ns;

        if s /= '0' or cout /= '1' then
            report "Test case 6 failed: Expected s=0, cout=1" severity error;
        else
            report "Test case 6 passed: s=0, cout=1" severity note;
        end if;
        
        -- Test case 7: 1 + 1 + 0
        a <= '1'; b <= '1'; cin <= '0';
        wait for 25 ns;

        if s /= '0' or cout /= '1' then
            report "Test case 7 failed: Expected s=0, cout=1" severity error;
        else
            report "Test case 7 passed: s=0, cout=1" severity note;
        end if;
        
        -- Test case 8: 1 + 1 + 1
        a <= '1'; b <= '1'; cin <= '1';
        wait for 25 ns;

        if s /= '1' or cout /= '1' then
            report "Test case 8 failed: Expected s=1, cout=1" severity error;
        else
            report "Test case 8 passed: s=1, cout=1" severity note;
        end if;

        wait; -- End of simulation
    end process Stimuli;
end architecture;
