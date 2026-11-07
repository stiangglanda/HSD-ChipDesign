-------------------------------------------------------------------------------
-- Title      : LargeMuxes
-- Project    : 
-------------------------------------------------------------------------------
-- File       : LargeMuxes-e.vhd
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
-- 2015-10-15  1.0      pfaff   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity LargeMuxes is
  generic (
    gNumInputs : positive := 12);
  port (
    iA : in std_ulogic_vector(gNumInputs - 1 downto 0);
    iSel : in std_ulogic_vector(integer(ceil(log2(real(gNumInputs)))) - 1 downto 0);
    oCaseY : out std_ulogic;
    oIfY : out std_ulogic);
end entity LargeMuxes;