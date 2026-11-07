library IEEE;				   
use IEEE.std_logic_1164.all;

architecture PrimeImpl of Mux is
 begin

  oY <= (    iSel              and     iB ) or
        (not(iSel) and     iA             );

 end PrimeImpl;


