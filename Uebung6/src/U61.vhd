library ieee;
use ieee.std_logic_1164.all;

entity clkTree is
end entity;

architecture bhv_transport of clkTree is
    signal clk : std_ulogic := '0';
    signal y1, y2, y3 : std_ulogic;
    constant cClkPhase : time := 10 ns;
    constant cBufferDelay : time := 10 ns;
begin
    CG: process is
    begin
        clk <= not clk after cClkPhase;
        wait on clk;
    end process;

    B1: process is
    begin
        y1 <= transport clk after cBufferDelay;
        wait on clk;
    end process;

    B2: process (y1) is    --sensitivitylist
    begin
        y2 <= transport y1 after cBufferDelay;
        -- wait on y1;
    end process;

    B3: y3 <= transport y2 after cBufferDelay; -- concurrent signal assignment

    B13: y4 <= transport clk after 3*cBufferDelay;

end architecture bhv_transport;