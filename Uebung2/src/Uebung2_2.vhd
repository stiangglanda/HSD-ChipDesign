entity uebung2_2 is
end entity uebung2_2;

architecture behav of uebung2_2 is

  shared variable r, s : bit;

begin
  Stimul: process
  begin
    wait for 100 ns;                    -- reset
    S := '0';
    R := '1';
    wait for 100 ns;                    -- store
    R := '0';
    wait for 100 ns;                    -- set
    S := '1';
    wait for 100 ns;                    -- store
    S := '0';
    wait for 100 ns;                    -- not defined ??
    S := '1';
    R := '1';
    wait for 100 ns;                    -- ?
    S := '0';
    R := '0';
    wait;
  end process Stimul;

end architecture behav;