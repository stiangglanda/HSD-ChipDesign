library ieee;
use ieee.std_logic_1164.all;

entity RSFlipFlop is
    port(
        iSet  : in std_ulogic;
        iR    : in std_ulogic;
        oQ    : out std_ulogic;
        oQn   : out std_ulogic
   );
end entity RSFlipFlop;

architecture Struct of RSFlipFlop is
    signal Q  : std_ulogic := '0';
    signal Qn : std_ulogic := '0';
begin
    oQ  <= Q;
    oQn <= Qn;

    Nor1: process is
    begin
        Q <= Qn nor iR after 20 ns; -- 20 ns Q= 1
        wait on Qn, iR;
    end process Nor1;

    Nor2: process is -- s = 1 R = 0
    begin
        Qn <= Q nor iSet after 20 ns; -- 20 ns Qn= 0 
        wait on Q, iSet;
    end process Nor2;
end architecture Struct;