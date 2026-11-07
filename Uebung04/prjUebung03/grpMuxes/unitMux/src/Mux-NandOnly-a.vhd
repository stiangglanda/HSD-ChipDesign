library IEEE;				   
use IEEE.std_logic_1164.all;

architecture NandOnly of Mux is
 begin

  oY <= (iA nand (iSel nand iSel)) nand (iB nand iSel);

 end NandOnly;


