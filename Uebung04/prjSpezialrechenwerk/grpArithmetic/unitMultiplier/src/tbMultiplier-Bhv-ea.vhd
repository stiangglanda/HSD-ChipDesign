-------------------------------------------------------------------------------
-- Title      : Testbench for multiplier using add and shift method
-- Project    : Excercise 5
-------------------------------------------------------------------------------
-- File       : tbMultiplier-Rtl-a.vhd
-- Author     : <your name>
-- Company    : FH-Hagenberg/HSD, Hagenberg/Austria
--              Copyright (c) 2013
-- Created    : 2013-11-07
-- Last update: 2013-11-07
-------------------------------------------------------------------------------
-- Description: Functional verification of multiplier behaviour using
--              add and shift method
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author        Description
-- 2013-11-07  1.0      <your name>   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.global.all;

entity tbMultiplier is
end tbMultiplier;


architecture Bhv of tbMultiplier is

  constant cArgRange : positive := 4;
  constant cDelay    : time     := 10 ns;

  signal sMultiplicant   : unsigned(cArgRange-1 downto 0)   := (others => '0');
  signal sMultiplier     : unsigned(cArgRange-1 downto 0)   := (others => '0');
  signal sProductLoop    : unsigned(2*cArgRange-1 downto 0);
  signal sProductGen     : unsigned(2*cArgRange-1 downto 0);
  signal sProductOp      : unsigned(2*cArgRange-1 downto 0);

begin

  DutLoop : entity work.Multiplier(UsingForLoop)
    generic map (gArgRange => cArgRange)
    port map (iMultiplicant => sMultiplicant,
              iMultiplier   => sMultiplier,
              oProduct      => sProductLoop);

  DutGenerate : entity work.Multiplier(UsingForGenerate)
    generic map (gArgRange => cArgRange)
    port map (iMultiplicant => sMultiplicant,
              iMultiplier   => sMultiplier,
              oProduct      => sProductGen);

  DutOperator : entity work.Multiplier(UsingOperator)
    generic map (gArgRange => cArgRange)
    port map (iMultiplicant => sMultiplicant,
              iMultiplier   => sMultiplier,
              oProduct      => sProductOp);

  -- Test loop for multiplicant and multiplier to verify completeness
  TestSequence : process is
  begin
    for a in 0 to 2**cArgRange - 1 loop
      for b in 0 to 2**cArgRange - 1 loop
        sMultiplicant <= to_unsigned(a, cArgRange);
        sMultiplier   <= to_unsigned(b, cArgRange);
        wait for cDelay;

        assert sProductLoop = sProductOp
          report "UsingForLoop falsch bei " & integer'image(a) & " * " & integer'image(b)
          severity failure;

        assert sProductGen = sProductOp
          report "UsingForGenerate falsch bei " & integer'image(a) & " * " & integer'image(b)
          severity failure;
      end loop;
    end loop;

    report "Test erfolgreich: alle Kombinationen geprueft" severity note;
    wait;
  end process TestSequence;

end Bhv;

