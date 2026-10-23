library ieee;
use ieee.std_logic_1164.all;

entity AllMyMuxesOnDE23Lite is
    port (
        SW : in std_ulogic_vector(2 downto 0);
        LEDR : out std_ulogic_vector(2 downto 0)
    );
end entity AllMyMuxesOnDE23Lite;

architecture Struct of AllMyMuxesOnDE23Lite is

    -- Interne Signale für die MUX-Ausgänge (Positiv-Logik)
    signal Yminterms : std_ulogic;
    signal Yprimimpl : std_ulogic;
    signal YnandOnly : std_ulogic;

begin

    -- Instanziierung von AllMyMuxes
    TheAllMyMuxes : entity work.AllMyMuxes(Struct)
        port map(
            iA => SW(1),
            iB => SW(0),
            iSel => SW(2),
            oYminterms => Yminterms,
            oYprimimpl => Yprimimpl,
            oYnandOnly => YnandOnly
        );
    -- Anbindung an die LEDs des DE23-Lite (Low-Aktiv: 0 = AN, 1 = AUS):
    LEDR(0) <= not Yminterms;
    LEDR(1) <= not Yprimimpl;
    LEDR(2) <= not YnandOnly;

end architecture Struct;