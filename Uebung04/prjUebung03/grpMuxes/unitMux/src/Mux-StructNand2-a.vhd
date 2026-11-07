library IEEE;				   
use IEEE.std_logic_1164.all;

architecture StructNand2 of Mux is
  signal nSel, Branch1, Branch2 : std_ulogic;
begin

  Nand2_1: entity work.NandGate2(Rtl)
    port map (
      iA => iSel,
      iB => iSel,
      oY => nSel);

  Nand2_2: entity work.NandGate2(Rtl)
    port map (
      iA => iA,
      iB => nSel,
      oY => Branch1);

  Nand2_3: entity work.NandGate2(Rtl)
    port map (
      iA => iSel,
      iB => iB,
      oY => Branch2);

  Nand2_4: entity work.NandGate2(Rtl)
    port map (
      iA => Branch1,
      iB => Branch2,
      oY => oY);

 end StructNand2;


