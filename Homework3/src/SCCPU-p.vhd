  -----------------------------------------------
-- Title      : Single Cycle CPU Project Package
-- Project    : Single Cycle CPU
  -----------------------------------------------
-- Author     : Copyright 2020: T. Mueller
-- Standard   : Using VHDL'93
-- Simulation : Modelsim Student Edition
  -----------------------------------------------
-- Description: Project Specific Package for 
-- Single Cycle CPU
  -----------------------------------------------
-- Updated 2022: toNat
  -----------------------------------------------
	

library ieee;
use ieee.std_logic_1164.all;

library work;
package SingleCycleCPUPack is

  -----------------------------------------------
  -- Constant Declarations
  -----------------------------------------------

  -- Widths of PC, data, instruction, register address
  constant cPCWidth     : natural := 32;
  constant cDataWidth   : natural := 32;
  constant cInstrWidth  : natural := 32;
  constant cRegAdrWidth : natural := 4;
 
  -----------------------------------------------
  -- Specific Definitions for Program Counter
  -----------------------------------------------
  
  -- Type of PC values (current and next value of Program Counter)
  subtype  aPCvalue is std_ulogic_vector(cPCWidth-1 downto 0);
  subtype  aPCbit is std_ulogic;
	
  -- Propagation delay from iclk and inRST repectively to oPCcurr
  constant cClkToPCcurrTpd  : time := 4 ns;
  constant cnRSTToPCcurrTpd : time := 3 ns;
  
  -----------------------------------------------
  -- Specific Definitions for Instruction Memory
  -----------------------------------------------
  
  -- Type definitions for instructions  
  subtype aInstruction is std_ulogic_vector(CInstrWidth-1 downto 0);
	
  -- Size of instruction memory
  constant cMaxInstrMemoryAdr : natural := 100;
  
  -- Type for instruction memory
  type aInstrMemArray is array (0 to cMaxInstrMemoryAdr) 
	   of aInstruction;
	 
  -- Propagation delay of instruction memory 
  -- (address to instruction_out)
  constant cInstrReadTpd : time := 2 ns;
	
  -----------------------------------------------
  -- Specific Definitions for Register File
  -----------------------------------------------
  
  -- Type definiton for data values
  subtype aData is std_ulogic_vector(cDataWidth-1 downto 0);
  subtype aDataBit is std_ulogic;
	
  -- Type for register addresses
  subtype  aRegAdr is std_ulogic_vector(cRegAdrWidth-1 downto 0);
  
  -- Maximum register address
  constant cMaxRegAdr	: natural := 15;
	
  -- Address of program counter
  constant cPCRegAdr	: aRegAdr := (others => '1');
	
  -- Delay RegAdress-to-RegData for reading a register value 
  constant cRegReadTpd : time := 2 ns;
	
  -- Delay Clk-to-Register for writing a register value
  constant cClkToRegisterTpd : time := 4 ns;
	
  -----------------------------------------------
  -- Specific Definitions for ALU
  -----------------------------------------------
  
  -- aALUop 
  subtype  aAluop is std_ulogic_vector(1 downto 0);
  constant cAluAdd: aALUop := "00";
  constant cAluSub: aALUop := "01";
  constant cAluAnd: aALUop := "10";
  constant cAluOr:  aALUop := "11";
	
  -- ALU Flags
  subtype aAluFlag is std_ulogic;

  -- Propagation delay (srcA/srcB/ALUop to ALUResult)
  constant cALUTpd : time := 8 ns;

  ---------------------------------------------------
  -- Specific Definitions for Adder4
  ---------------------------------------------------
  
  -- Propagation delay 
  constant cAdder4Tpd : time := 2 ns;
		
  ---------------------------------------------------
  -- Specific definitions for Extend Unit
  ---------------------------------------------------
  
  subtype  aImm24 is std_ulogic_vector(23 downto 0);
  constant cExtendTpd : time := 1 ns;
  
  ---------------------------------------------------
  -- Specific definitions for FlagReg
  ---------------------------------------------------
  
  constant cFlagRegClk2Q : time := 1 ns;
	
  ---------------------------------------------------
  -- Specific Definitions for Control Unit
  ---------------------------------------------------
  
  -- Opcodes: instruction[27:26]
  subtype  aOpCode is std_ulogic_vector (0 to 1); 
  constant cDOpCode : aOpCode := "00";
  constant cMOpCode : aOpCode := "01";
  constant cBOpCode : aOpCode := "10";
  
  -- Conditions: instruction[31:28]
  subtype  aCondCode is std_ulogic_vector(3 downto 0);
  constant cCondEQ : aCondCode := "0000";
  constant cCondNE : aCondCode := "0001";
  constant cCondAL : aCondCode := "1110";
  
  -- Commands for DP instructions: instruction[24:21]
  subtype  aCmd is std_ulogic_vector (3 downto 0);
  constant cAndCmd : aCmd := "0000";
  constant cSubCmd : aCmd := "0010";
  constant cAddCmd : aCmd := "0100";
  constant cOrrCmd : aCmd := "1100";
   
  constant cCrtlTpd : time := 2 ns;
  
  ---------------------------------------------------
  -- Specific definitions for Multiplexers
  ---------------------------------------------------
  
  constant cMuxTpd : time := 1 ns;
  


  -----------------------------------------------
  -- Function Definitions
  -----------------------------------------------
  
  function toNat(binaryVec: std_ulogic_vector) 
    return natural;

end package SingleCycleCPUPack;


  --=============================================
  -- Package Body
  --=============================================
  
package body SingleCycleCPUPack is

  -------------------------------------------------
  --
  -- toNat calculates the value (natural type) of a 
  -- std_ulogic_vector by means of the Horner scheme.
  -- MSB to LSB is supposed left to right.
  --
  -------------------------------------------------

  function toNat(binaryVec : std_ulogic_vector) 
    return natural is
    variable vResult  : natural := 0;
  begin
    for i in binaryVec'range loop
	  vResult := vResult*2;
	  if binaryVec(i) = '1' then
		 vResult := vResult+1;
	  end if;
	end loop;
    return vResult;
  end toNat;

end SingleCycleCPUPack;

-----------------------------------------------

