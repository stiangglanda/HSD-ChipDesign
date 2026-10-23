library ieee;
use ieee.std_logic_1164.all;

entity AllMyMuxes is
  port (
    iA          : in  std_ulogic;
    iB          : in  std_ulogic;
    iSel        : in  std_ulogic;
    oYminterms  : out std_ulogic;
    oYprimimpl  : out std_ulogic;
    oYnandOnly  : out std_ulogic
  );
end entity AllMyMuxes;

architecture Struct of AllMyMuxes is
begin

  -- Instanz 1: Minterms Architektur
  MpxMintermsInst : entity work.Mpx(Minterms)
    port map (
      iA   => iA,
      iB   => iB,
      iSel => iSel,
      oY   => oYminterms
    );

  -- Instanz 2: PrimeImpl Architektur
  MpxPrimeImplInst : entity work.Mpx(PrimeImpl)
    port map (
      iA   => iA,
      iB   => iB,
      iSel => iSel,
      oY   => oYprimimpl
    );

  -- Instanz 3: NandOnly Architektur
  MpxNandOnlyInst : entity work.Mpx(NandOnly)
    port map (
      iA   => iA,
      iB   => iB,
      iSel => iSel,
      oY   => oYnandOnly
    );

end architecture Struct;