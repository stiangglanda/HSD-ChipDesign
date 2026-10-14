entity DFFtb is
end entity;

architecture struct of DFFtb is
    signal D : bit := '0';
    signal CLK :  bit := '0';
    signal Q :  bit;
    signal nRST : bit := '0';
begin
    uut : entity work.DFlipFlop(behave)
        port map(
            iD => D,
            iCLK => CLK,
            oQ => Q,
            inRST => nRST);
    
    CGen : process
    begin
        CLK <= not CLK after 20 ns;
        wait on CLK;
    end process;

    StimulD : process
    begin
        wait for 55 ns;
        D <= '1';
        wait for 80 ns;
        D <= '0';
        wait for 70 ns;
        D <= '1';
        wait;
    end process;

    StimulnRST : process
    begin
        nRST <= '0';
        wait for 30 ns;
        nRST <= '1';

        wait for 90 ns;
        nRST <= '0';
        wait for 25 ns;
        nRST <= '1';
        wait;
    end process;

end architecture;
