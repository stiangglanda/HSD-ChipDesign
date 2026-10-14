--------------------------------------------------
-- File       : SR1x4ea.vhd
-- Author     : tmw
-- Platform   : Modelsim Student Edition
--------------------------------------------------
-- Description: 1-Bit Shiftregister SR1g(struct)
--            : Length defined by gLength
--------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016/04/14  1.0      tmw     Created
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity SR2D is
    generic (gLength : natural := 4;
             gWidth  : natural := 8);
    port    (iClock	 : in std_ulogic;
			inReset	 : in std_ulogic;
			iData	 : in std_ulogic_vector;
            oQ       : out std_ulogic_vector);
begin
    assert (gWidth mod 4 = 0) report "Width nicht durch 4 teilbar" severity note;
end entity SR2D;

architecture struct of SR2D is
    subtype aStageConnect is std_ulogic_vector(0 to gWidth-1);
    type aConnectThem is array (0 to gLength) of aStageConnect;
    signal connectthem : aConnectThem;
begin
    Stages: for s in 0 to gLength-1 generate 
      Width: for w in 0 to gWidth-1 generate 
                begin   
                FF: entity work.DFF(BHV)
                    port map (iClk => iClock,
				        	  inRst => inReset,
					          iD => connectThem(s) (w),
					          oQ => connectThem(s+1) (w));                          
    end generate SR;
  
   connectThem(0) <= iData;
   oQ <= ConnectThem(gLength);
  
end architecture Struct;
