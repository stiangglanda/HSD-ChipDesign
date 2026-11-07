-------------------------------------------------------------------------------
-- Title      : Multiplier using add and shift method
-- Project    : Exercise 5
-------------------------------------------------------------------------------
-- File       : Multiplier-Rtl-a.vhd
-- Author     : <your name>
-- Company    : FH-Hagenberg/HSD, Hagenberg/Austria
--              Copyright (c) 2013
-- Created    : 2013-11-07
-- Last update: 2013-11-07
-------------------------------------------------------------------------------
-- Description: See entity
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author        Description
-- 2013-11-07  1.0      <your name>   Created
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Architecture UsingForLoop
-------------------------------------------------------------------------------

architecture UsingForLoop of Multiplier is
  type   tPP is array (0 to gArgRange - 1) of unsigned(oProduct'range);
  signal PP : tPP;

begin  -- UsingForLoop

  process (iMultiplicant, iMultiplier, PP)
  
  -- ------------------
  -- add your code here
  -- ------------------

  begin
   
  -- ------------------
  -- add your code here
  -- ------------------
    
  end process;
  
end UsingForLoop;

-------------------------------------------------------------------------------
-- Architecture UsingForGenerate
-------------------------------------------------------------------------------
                            
architecture UsingForGenerate of Multiplier is  
  type   tPP is array (0 to gArgRange - 1) of unsigned(oProduct'range);
  signal PP : tPP;
  
  -- ------------------
  -- add your code here
  -- ------------------

begin  -- UsingForGenerate
  
  -- ------------------
  -- add your code here
  -- ------------------

end UsingForGenerate;


-------------------------------------------------------------------------------
-- Architecture UsingOperator
-------------------------------------------------------------------------------

architecture UsingOperator of Multiplier is

begin  -- UsingOperator

  oProduct <= to_unsigned(to_integer(iMultiplier)*
                          to_integer(iMultiplicant),oProduct'length);
  
end UsingOperator;
