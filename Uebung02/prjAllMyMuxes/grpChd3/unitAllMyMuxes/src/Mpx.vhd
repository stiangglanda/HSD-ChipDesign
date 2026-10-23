library ieee;
use ieee.std_logic_1164.all;

-- -----------------------------------------------------------------------------
-- Entity Mpx (2-zu-1 Multiplexer)
-- Hinweis: Nicht "MUX" nennen, da der Name durch Intel belegt ist!
-- -----------------------------------------------------------------------------
entity Mpx is
  port (
    iA   : in  std_ulogic;
    iB   : in  std_ulogic;
    iSel : in  std_ulogic;
    oY   : out std_ulogic
  );
end entity Mpx;

-- -----------------------------------------------------------------------------
-- 1. Architektur: Minterms (Alle 4 Einsen aus dem KV-Diagramm)
-- -----------------------------------------------------------------------------
architecture Minterms of Mpx is
begin
  oY <= (not iSel and     iA and not iB) or
        (not iSel and     iA and     iB) or
        (    iSel and not iA and     iB) or
        (    iSel and     iA and     iB);
end architecture Minterms;

-- -----------------------------------------------------------------------------
-- 2. Architektur: PrimeImpl (Minimiert mit KV-Diagramm)
-- -----------------------------------------------------------------------------
architecture PrimeImpl of Mpx is
begin
  oY <= (not iSel and iA) or 
        (    iSel and iB);
end architecture PrimeImpl;

-- -----------------------------------------------------------------------------
-- 3. Architektur: NandOnly (Ausschließlich mit NAND-Gattern)
-- De Morgan: A or B = (not A) nand (not B)
-- -----------------------------------------------------------------------------
architecture NandOnly of Mpx is
  signal not_iSel : std_ulogic;
  signal nand_A   : std_ulogic;
  signal nand_B   : std_ulogic;
begin
  -- Inverter über NAND:
  not_iSel <= iSel nand iSel;
  
  -- UND-Terme negiert erzeugen:
  nand_A   <= not_iSel nand iA;
  nand_B   <= iSel     nand iB;
  
  -- ODER-Verknüpfung durch NAND der negierten Terme:
  oY       <= nand_A   nand nand_B;
end architecture NandOnly;