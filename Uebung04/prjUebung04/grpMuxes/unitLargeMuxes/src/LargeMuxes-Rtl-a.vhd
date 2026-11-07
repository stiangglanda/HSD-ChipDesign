
library ieee;
use ieee.std_logic_1164.all;

architecture Rtl of LargeMuxes is 
begin

    InstMuxUsingCase : entity work.Mpx(UsingCase)
    generic map (gNumInputs => gNumInputs)
    port map (
        iA   => iA,
        iSel => iSel,
        oY   => oCaseY
    );

    InstMuxUsingIf : entity work.Mpx(UsingIf)
    generic map (gNumInputs => gNumInputs)
    port map (
        iA   => iA,
        iSel => iSel,
        oY   => oIfY
    );


end architecture;