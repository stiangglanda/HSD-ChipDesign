-------------------------------------------------------------------------------
-- Title      : Mux
-- Project    : 
-------------------------------------------------------------------------------
-- File       : Mux-UsingCase-a.vhd
-- Author     :   <pfaff@PFAFF-M4600>
-- Company    : 
-- Created    : 2015-10-15
-- Last update: 2015-10-15
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2015-10-15  1.0      pfaff	Created
-------------------------------------------------------------------------------

architecture UsingCase of Mux is

begin  -- architecture UsingCase

  -- purpose: Describing a Mux in RTL style
  -- type   : combinational
  -- inputs : iA, iB, iSel
  -- outputs: oY
  Comb: process (iA, iB, iSel) is
  begin  -- process Comb
    case iSel is
      when '0' | 'L' => oY <= iA;
      when '1' | 'H' => oY <= iB;
      when others => oY <= 'X';
    end case;
  end process Comb;

end architecture UsingCase;
