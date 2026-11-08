library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.global.all;

entity tbMultiplier is
end tbMultiplier;

architecture Bhv of tbMultiplier is

  constant cArgRange : positive := 16;
  constant cDelay : time := 10 ns;
  constant cNumRandom : positive := 10000;

  signal sMultiplicant : unsigned(cArgRange - 1 downto 0) := (others => '0');
  signal sMultiplier : unsigned(cArgRange - 1 downto 0) := (others => '0');
  signal sProductLoop : unsigned(2 * cArgRange - 1 downto 0);
  signal sProductGen : unsigned(2 * cArgRange - 1 downto 0);
  signal sProductOp : unsigned(2 * cArgRange - 1 downto 0);

begin

  DutLoop : entity work.Multiplier(UsingForLoop)
    generic map(gArgRange => cArgRange)
    port map(
      iMultiplicant => sMultiplicant,
      iMultiplier => sMultiplier,
      oProduct => sProductLoop);

  DutGenerate : entity work.Multiplier(UsingForGenerate)
    generic map(gArgRange => cArgRange)
    port map(
      iMultiplicant => sMultiplicant,
      iMultiplier => sMultiplier,
      oProduct => sProductGen);

  DutOperator : entity work.Multiplier(UsingOperator)
    generic map(gArgRange => cArgRange)
    port map(
      iMultiplicant => sMultiplicant,
      iMultiplier => sMultiplier,
      oProduct => sProductOp);

  TestSequence : process is

    constant cMax : unsigned(cArgRange - 1 downto 0) := (others => '1');

    procedure Check (a, b : unsigned(cArgRange - 1 downto 0)) is
      variable vExpected : unsigned(2 * cArgRange - 1 downto 0);
    begin
      sMultiplicant <= a;
      sMultiplier <= b;
      vExpected := a * b;
      wait for cDelay;

      assert sProductLoop = vExpected
      report "UsingForLoop falsch bei " & integer'image(to_integer(a)) &
        " * " & integer'image(to_integer(b))
        severity failure;

      assert sProductGen = vExpected
      report "UsingForGenerate falsch bei " & integer'image(to_integer(a)) &
        " * " & integer'image(to_integer(b))
        severity failure;

      assert sProductOp = vExpected
      report "UsingOperator falsch bei " & integer'image(to_integer(a)) &
        " * " & integer'image(to_integer(b))
        severity warning;
    end procedure Check;

    variable vSeed1 : positive := 1;
    variable vSeed2 : positive := 2;
    variable vRand : real;
    variable vA, vB : unsigned(cArgRange - 1 downto 0);

  begin
    if cArgRange <= 8 then
      -- kleine Breite: alle Kombinationen
      for a in 0 to 2 ** cArgRange - 1 loop
        for b in 0 to 2 ** cArgRange - 1 loop
          Check(to_unsigned(a, cArgRange), to_unsigned(b, cArgRange));
        end loop;
      end loop;
    else
      -- grosse Breite: Randwerte
      Check(to_unsigned(0, cArgRange), to_unsigned(0, cArgRange));
      Check(to_unsigned(0, cArgRange), cMax);
      Check(cMax, to_unsigned(0, cArgRange));
      Check(to_unsigned(1, cArgRange), cMax);
      Check(cMax, to_unsigned(1, cArgRange));
      Check(cMax, cMax);

      -- grosse Breite: Zufallswerte
      for i in 1 to cNumRandom loop
        uniform(vSeed1, vSeed2, vRand);
        vA := to_unsigned(integer(floor(vRand * real(2 ** cArgRange))), cArgRange);
        uniform(vSeed1, vSeed2, vRand);
        vB := to_unsigned(integer(floor(vRand * real(2 ** cArgRange))), cArgRange);
        Check(vA, vB);
      end loop;
    end if;

    report "Test erfolgreich" severity note;
    wait;
  end process TestSequence;

end Bhv;