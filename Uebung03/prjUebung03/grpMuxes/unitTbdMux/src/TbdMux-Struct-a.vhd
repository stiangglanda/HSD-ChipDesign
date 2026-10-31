library IEEE;				   
use IEEE.std_logic_1164.all;

architecture Struct of TbdMux is
 begin

 -------------------------------------------------------------------------------


   ResetReleaseIP_Insta : entity work.ResetReleaseIP
     port map (
       iClk         => iClk,
       inResetAsync => '1',
       onResetSync  => open
   );

   Mux_0: entity work.Mux(Minterms)
     port map (
       iA   => iA,
       iB   => iB,
       iSel => iSel,
       oY   => oY(0));
   
   Mux_1: entity work.Mux(PrimeImpl)
     port map (
       iA   => iA,
       iB   => iB,
       iSel => iSel,
       oY   => oY(1));
   
   Mux_2: entity work.Mux(NandOnly)
     port map (
       iA   => iA,
       iB   => iB,
       iSel => iSel,
       oY   => oY(2));
   
   Mux_3: entity work.Mux(StructTheNand2)
     port map (
       iA   => iA,
       iB   => iB,
       iSel => iSel,
       oY   => oY(3));
   
   Mux_4: entity work.Mux(UsingCase)
     port map (
       iA   => iA,
       iB   => iB,
       iSel => iSel,
       oY   => oY(4));
   
   Mux_5: entity work.Mux(UsingIf)
     port map (
       iA   => iA,
       iB   => iB,
       iSel => iSel,
       oY   => oY(5));
   
 end Struct;


