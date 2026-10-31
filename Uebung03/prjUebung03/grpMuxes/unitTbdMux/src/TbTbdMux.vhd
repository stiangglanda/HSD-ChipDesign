library IEEE;
use IEEE.std_logic_1164.all;

entity TbTbdMux is
end TbTbdMux;

architecture Sim of TbTbdMux is

  signal iClk  : std_ulogic := '0';
  signal iA    : std_ulogic := '0';
  signal iB    : std_ulogic := '0';
  signal iSel  : std_ulogic := '0';
  signal oY    : std_ulogic_vector(5 downto 0);
  signal Done  : boolean := false;

begin

  -- Das zu testende Design
  Dut : entity work.TbdMux
    port map (
      iClk => iClk,
      iA   => iA,
      iB   => iB,
      iSel => iSel,
      oY   => oY);

  -- Takt, bis der Test fertig ist
  Clock : process is
  begin
    while not Done loop
      iClk <= '0';
      wait for 10 ns;
      iClk <= '1';
      wait for 10 ns;
    end loop;
    wait;
  end process;

  Stimulus : process is
    variable Expected : std_ulogic;
  begin
    wait for 50 ns;

    -- Teil 1: alle Kombinationen mit 0 und 1, mit Prüfung
    for sel in std_ulogic range '0' to '1' loop
      for a in std_ulogic range '0' to '1' loop
        for b in std_ulogic range '0' to '1' loop
          iSel <= sel;
          iA   <= a;
          iB   <= b;
          wait for 20 ns;

          if sel = '1' then
            Expected := a;
          else
            Expected := b;
          end if;

          for i in oY'range loop
            assert oY(i) = Expected
              report "Fehler bei Mux " & integer'image(i) &
                     ": iSel=" & std_ulogic'image(sel) &
                     " iA=" & std_ulogic'image(a) &
                     " iB=" & std_ulogic'image(b) &
                     " oY=" & std_ulogic'image(oY(i))
              severity error;
          end loop;
        end loop;
      end loop;
    end loop;

    -- Teil 2: alle neun Werte an iSel, nur zum Ansehen in der Wellenform
    iA <= '1';
    iB <= '0';
    for sel in std_ulogic loop
      iSel <= sel;
      wait for 20 ns;
    end loop;

    report "Test fertig" severity note;
    Done <= true;
    wait;
  end process;

end Sim;