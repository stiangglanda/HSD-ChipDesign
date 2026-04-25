entity DFlipFlop is
    port(
        iD : in bit;
        iCLK : in bit;
        oQ : out bit;
        inRST : in bit
   );
end entity DFlipFlop;

architecture behave of DFlipFlop is
begin
    process(inRST, iCLK)
    begin
        if inRST = '0' then
            oQ <= '0' after 3 ns;
        elsif iCLK'event and iCLK = '1' then
            oQ <= iD after 4 ns;
        end if;
    end process;
end architecture behave;