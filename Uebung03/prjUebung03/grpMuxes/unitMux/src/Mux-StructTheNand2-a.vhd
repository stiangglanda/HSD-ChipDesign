library IEEE;				   
use IEEE.std_logic_1164.all;

architecture StructTheNand2 of Mux is
    signal nSel : std_ulogic;
    signal nBSel : std_ulogic;
    signal nSelA : std_ulogic;
 begin
    niSel: entity work.TheNand2(Rtl)
    port map (
       iA   => iSel,
       iB   => iSel,
       oY   => nSel);

    niBSel: entity work.TheNand2(Rtl)
    port map (
       iA   => iB,
       iB   => iSel,
       oY   => nBSel);

    nSeliA: entity work.TheNand2(Rtl)
    port map (
       iA   => iA,
       iB   => nSel,
       oY   => nSelA);

    nSelAnBSel: entity work.TheNand2(Rtl)
    port map (
       iA   => nSelA,
       iB   => nBSel,
       oY   => oY);

 end StructTheNand2;


