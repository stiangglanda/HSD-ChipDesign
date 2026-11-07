-------------------------------------------------------------------------------
-- Title      : Mux
-- Project    : 
-------------------------------------------------------------------------------
-- File       : Mux-e.vhd
-- Author     :   <pfaff@PFAFF-M4600>
-- Company    : 
-- Created    : 2015-10-15
-- Last update: 2015-10-19
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

entity TbdMux is
  
  port (
    iClk   : in  std_ulogic;
    iA, iB : in  std_ulogic;
    iSel   : in  std_ulogic;
    oY     : out std_ulogic_vector(5 downto 0) );

end entity TbdMux;
