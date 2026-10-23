library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TbAllMyMuxes is
end entity TbAllMyMuxes;

architecture Sim of TbAllMyMuxes is

  -- Stimuli Signale
  signal iA         : std_ulogic := '0';
  signal iB         : std_ulogic := '0';
  signal iSel       : std_ulogic := '0';

  -- Antwort Signale
  signal oYminterms : std_ulogic;
  signal oYprimimpl : std_ulogic;
  signal oYnandOnly : std_ulogic;

begin

  -- Unit Under Test (UUT)
  uut : entity work.AllMyMuxes(Struct)
    port map (
      iA         => iA,
      iB         => iB,
      iSel       => iSel,
      oYminterms => oYminterms,
      oYprimimpl => oYprimimpl,
      oYnandOnly => oYnandOnly
    );

  -- Stimulus Prozess: Alle 8 Kombinationen durchtesten
  StimProc : process
    variable vExpected : std_ulogic;
  begin
    report "=== Starte Simulation AllMyMuxes ===" severity note;

    for sel in 0 to 1 loop
      for a in 0 to 1 loop
        for b in 0 to 1 loop
          -- Signale anlegen
          if sel = 1 then iSel <= '1'; else iSel <= '0'; end if;
          if a   = 1 then iA   <= '1'; else iA   <= '0'; end if;
          if b   = 1 then iB   <= '1'; else iB   <= '0'; end if;

          wait for 10 ns;

          -- Erwarteten Wert berechnen:
          if iSel = '0' then
            vExpected := iA;
          else
            vExpected := iB;
          end if;

          -- Prüfen, ob alle drei Architekturen korrekt sind
          assert (oYminterms = vExpected)
            report "Fehler in Minterms! iSel=" & std_ulogic'image(iSel) & " iA=" & std_ulogic'image(iA) & " iB=" & std_ulogic'image(iB)
            severity error;

          assert (oYprimimpl = vExpected)
            report "Fehler in PrimeImpl! iSel=" & std_ulogic'image(iSel) & " iA=" & std_ulogic'image(iA) & " iB=" & std_ulogic'image(iB)
            severity error;

          assert (oYnandOnly = vExpected)
            report "Fehler in NandOnly! iSel=" & std_ulogic'image(iSel) & " iA=" & std_ulogic'image(iA) & " iB=" & std_ulogic'image(iB)
            severity error;

        end loop;
      end loop;
    end loop;

    report "=== Simulation erfolgreich beendet: Alle 3 Architekturen funktionieren fehlerfrei! ===" severity note;
    wait; -- Simulation stoppen
  end process StimProc;

end architecture Sim;