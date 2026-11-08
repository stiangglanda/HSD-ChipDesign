library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MultiplierTop is
    generic (
        gArgRange : positive := 4);
    port (
        iMultiplicant : in unsigned(gArgRange - 1 downto 0);
        iMultiplier : in unsigned(gArgRange - 1 downto 0);
        oProduct : out unsigned(2 * gArgRange - 1 downto 0));
end entity MultiplierTop;

architecture Rtl of MultiplierTop is
begin

    Inst : entity work.Multiplier(UsingForLoop)
        generic map(gArgRange => gArgRange)
        port map(iMultiplicant, iMultiplier, oProduct);

    --Inst : entity work.Multiplier(UsingForGenerate)
    --    generic map(gArgRange => gArgRange)
    --    port map(iMultiplicant, iMultiplier, oProduct);

    --Inst : entity work.Multiplier(UsingOperator)
    --    generic map(gArgRange => gArgRange)
    --    port map(iMultiplicant, iMultiplier, oProduct);

end architecture Rtl;