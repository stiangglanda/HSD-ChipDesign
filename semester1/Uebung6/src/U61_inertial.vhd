library ieee;
use ieee.std_logic_1164.all;

entity clkTree is
end entity;

architecture bhv_inertial of clkTree is
    signal clk : std_ulogic := '0';
    signal y1, y2, y3, y4 : std_ulogic;
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
        y1 <= reject cBufferDelay inertial clk after cBufferDelay;
        wait on clk;
    end process;

    B2: process (y1) is    --sensitivitylist
    begin
        y2 <= y1 after cBufferDelay; -- inertial implicit
        -- wait on y1;
    end process;

    B3: y3 <= y2 after cBufferDelay; -- concurrent signal assignment

    B13: y4 <= reject cBufferDelay inertial clk after 3*cBufferDelay;

end architecture bhv_inertial;