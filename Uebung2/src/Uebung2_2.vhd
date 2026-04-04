

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

