library IEEE;				   
use IEEE.std_logic_1164.all;

architecture Minterms of Mux is
 begin

  oY <= (    iSel  and     iA  and     iB ) or
        (    iSel  and not(iA) and     iB ) or
        (not(iSel) and     iA  and not(iB)) or
        (not(iSel) and     iA  and     iB );

 end Minterms;


