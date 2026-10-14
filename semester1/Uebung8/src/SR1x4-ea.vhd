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

entity SR1_4 is
    port    (iClock	 : in std_ulogic;
			inReset	 : in std_ulogic;
			iData	 : in std_ulogic;
            oQ       : out std_ulogic);
end entity SR1_4;

architecture struct of SR1_4 is 
    constant cLength : natural := 4;
    signal   connectthem : std_ulogic_vector(0 to cLength);  
begin
    SR: for i in 0 to cLength-1 generate 
        begin   
          Stage: entity work.DFF(BHV)
            port map (iClk => iClock,
					  inRst => inReset,
					  iD => connectThem(i),
					  oQ => connectThem(i+1));                          
    end generate SR;
  
   connectThem(0) <= iData;
   oQ <= ConnectThem(cLength);
  
end architecture Struct;
