library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RSFlipFlop is
    port(
        iSet  : in std_ulogic;
        iR    : in std_ulogic;
        oQ    : out std_ulogic;
        oQn   : out std_ulogic
   );
end entity RSFlipFlop;

architecture Struct of RSFlipFlop is
begin
    Nor1: process is
    begin
        oQ <= oQn nor iR after 0 ns; -- 20 ns Q= 1
        wait on oQn, iR;
    end process Nor1;

    Nor2: process is -- s = 1 R = 0
    begin
        oQn <= oQ nor iSet after 0 ns; -- 20 ns Qn= 0 
        wait on oQ, iSet;
    end process Nor2;
end architecture Struct;