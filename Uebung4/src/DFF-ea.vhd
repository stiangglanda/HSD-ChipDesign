entity DFlipFlop is
    port(
        iD      : in bit;
        iCLK    : in bit;
        inRST   : in bit;
        oQ      : out bit
   );
end entity DFlipFlop;

architecture behave of DFlipFlop is
begin
    process -- (iCLK, inRST) sensitivity list
    begin
        if inRST = '0' then
            -- wait for 10 ns; sensitivity liste nicht erlaubt
            oQ <= '0' after 3 ns;
        elsif iCLK'event and iCLK = '1' then
            oQ <= iD after 4 ns;
        end if;
        wait on iCLK, inRST;
    end process;
end architecture behave;