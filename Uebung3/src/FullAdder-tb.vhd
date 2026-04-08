entity TB_FullAdder is
end entity ;

architecture Testbench of TB_FullAdder is
    signal A, B, Cin : bit;
    signal Sum, Cout : bit;
begin
    uut: entity work.FullAdder
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );
    
    Stimuli: process        
    begin
        -- Test case 1: 0 + 0 + 0
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 10 ns;
        
        -- Test case 2: 0 + 0 + 1
        A <= '0'; B <= '0'; Cin <= '1';
        wait for 10 ns;
        
        -- Test case 3: 0 + 1 + 0
        A <= '0'; B <= '1'; Cin <= '0';
        wait for 10 ns;
        
        -- Test case 4: 0 + 1 + 1
        A <= '0'; B <= '1'; Cin <= '1';
        wait for 10 ns;
        
        -- Test case 5: 1 + 0 + 0
        A <= '1'; B <= '0'; Cin <= '0';
        wait for 10 ns;
        
        -- Test case 6: 1 + 0 + 1
        A <= '1'; B <= '0'; Cin <= '1';
        wait for 10 ns;
        
        -- Test case 7: 1 + 1 + 0
        A <= '1'; B <= '1'; Cin <= '0';
        wait for 10 ns;
        
        -- Test case 8: 1 + 1 + 1
        A <= '1'; B <= '1'; Cin <= '1';
        wait for 10 ns;

        wait; -- End of simulation
    end process Stimuli;
end architecture Testbench;
