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
  type tPP is array (0 to gArgRange - 1) of unsigned(oProduct'range);
  signal PP : tPP;

begin -- UsingForLoop

  process (iMultiplicant, iMultiplier) is
    variable vPP : tPP;
    variable vPrev : unsigned(oProduct'range);
    variable vSum : unsigned(gArgRange downto 0);
  begin
    for i in 0 to gArgRange - 1 loop
      -- Vorgänger holen
      if i = 0 then
        vPrev := (others => '0');
      else
        vPrev := vPP(i - 1);
      end if;

      -- obere Hälfte des Vorgängers, mit einem Bit mehr für den Übertrag
      vSum := '0' & vPrev(2 * gArgRange - 1 downto gArgRange);

      -- Multiplikand addieren, wenn das Bit des Multipliers 1 ist
      if iMultiplier(i) = '1' then
        vSum := vSum + resize(iMultiplicant, gArgRange + 1);
      end if;

      -- eine Stelle nach rechts schieben
      vPP(i) := vSum & vPrev(gArgRange - 1 downto 1);
    end loop;

    PP <= vPP;
    oProduct <= vPP(gArgRange - 1);
  end process;

end UsingForLoop;

-------------------------------------------------------------------------------
-- Architecture UsingForGenerate
-------------------------------------------------------------------------------

architecture UsingForGenerate of Multiplier is
  type tPP is array (0 to gArgRange - 1) of unsigned(oProduct'range);
  signal PP : tPP;

  function Step(
    iPrev : unsigned(2 * gArgRange - 1 downto 0);
    iMcand : unsigned(gArgRange - 1 downto 0);
    iBit : std_ulogic) return unsigned is
    variable vSum : unsigned(gArgRange downto 0);
  begin
    vSum := '0' & iPrev(2 * gArgRange - 1 downto gArgRange);
    if iBit = '1' then
      vSum := vSum + resize(iMcand, gArgRange + 1);
    end if;
    return vSum & iPrev(gArgRange - 1 downto 1);
  end function Step;

begin -- UsingForGenerate

  Stages : for i in 0 to gArgRange - 1 generate
    First : if i = 0 generate
      PP(i) <= Step((others => '0'), iMultiplicant, iMultiplier(i));
    end generate First;
    Chain : if i > 0 generate
      PP(i) <= Step(PP(i - 1), iMultiplicant, iMultiplier(i));
    end generate Chain;
  end generate Stages;

  oProduct <= PP(gArgRange - 1);

end UsingForGenerate;

-------------------------------------------------------------------------------
-- Architecture UsingOperator
-------------------------------------------------------------------------------

architecture UsingOperator of Multiplier is

begin -- UsingOperator

  oProduct <= iMultiplier * iMultiplicant;

end UsingOperator;