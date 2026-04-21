---------------------------------------------------------------------
-- Title      : VHDL Uebung Homework2 ALU Testbench
---------------------------------------------------------------------
-- File       : Alu-tb.vhd
-- Author     : Mueller-W.
-- Platform   : Windows
---------------------------------------------------------------------
-- Description: Entity/Architecture der ALU-Testbench 
---------------------------------------------------------------------
-- Revisions  :
-- Date         Version  Author         Description
-- 2016/04/04   1.0      Mueller-W.     Created
-- 2017/04/11	1.1		 Mueller-W.		UUT8 + UUT16 
-- 2018-2025			 Mueller-W.		Stimuli update 
---------------------------------------------------------------------


-- =============================================================
--     Diese Datei NICHT EDITIEREN und NICHT ABGEBEN!!
-- =============================================================

-- =============================================================
--     Simulationsdauer: 3000 ns  
-- =============================================================

library std; 
use std.textio.all;	 -- Ausgabe der Ergebnisse in eine Datei

library work;
use work.all;

entity ALUTestbench is
end entity;

architecture Stimulate of ALUTestbench is

	--==== Types and Signals adapted from Single-Cycle-CPU ===

	subtype   aAluData8	    is bit_vector(7 downto 0);
	subtype	  aAluData16	is bit_vector(15 downto 0);
	subtype   aAluCode  	is bit_vector(0 to 1);

	signal SrcA8 	 	: aAluData8;
	signal SrcB8 	 	: aAluData8;
	signal ALUResult8 	: aAluData8;
	
	signal SrcA16 	 	: aAluData16;
	signal SrcB16 	 	: aAluData16;
	signal ALUResult16 	: aAluData16;
	
	signal zero8        : bit;
	signal zero16       : bit;
	
	signal ALUControl: aAluCode;
	

	--==== Types and Signals for Stimuli =====================

	subtype aAluCodeStr  	is string (1 to 5);
	type   	aAluOp       	is (addOp,subOp,andOp,orOp);

	type 	aAluCodeTable 	is array (aAluOp) of aAluCode;
	signal 	AluCodeTable  	: aAluCodeTable := 
								(addOp=>"00",subOp=>"01",
								 andOp=>"10",orOp =>"11");
						   
	type aAluCodeStrTable  	is array (aAluOp) of aAluCodeStr;
	signal AluCodeStrTable 	: aAluCodeStrTable := 
								(addOp=>" add ",subOp=>" sub ",
								 andOp=>" and ",orOp =>"  or ");
						  				  
	--==== Write Logfile  =======================================

	file logFile : text open write_mode is "logHW2Bsp2.txt";

	procedure LogResult (Op   	  : in aAluOp;		
						SrcA 	  : in bit_vector;		
						SrcB 	  : in bit_vector;
						ALUControl: in bit_vector;
						ALUResult : in bit_vector;
						Zero	  : in bit) is					 
		variable  outStr : string (1 to 3) := " = ";
		variable  logLine: line;
		begin			
			write(logLine,SrcA); 
			write(logLine,AluCodeStrTable(op));
			write(logLine,SrcB);
			write(logLine,outStr);
			write(logLine,ALUResult);
			write(logLine,'/');
			write(logLine,Zero);
			writeline(logFile,logLine);			
		end procedure LogResult;

	--==== Stimuldata ========================================

	type aStimulData8 is record
		Op	: 	aAluOp;
		A	:	aAluData8;
		B	:	aAluData8;
	end record;
	
	type aStimulData16 is record
		Op	: 	aAluOp;
		A	:	aAluData16;
		B	:	aAluData16;
	end record;
	
	type aStimulArray8  is array (1 to 12) of aStimulData8;
	type aStimulArray16 is array (1 to 12) of aStimulData16;
	
	 signal Stimuli8 : aStimulArray8 :=
		( 1 => (addOp,x"00",x"11"),
		  2 => (addOp,x"FF",x"01"),
		  3 => (addOp,x"80",x"01"),
		  4 => (addOp,x"AB",x"55"),	
		  
		  5 => (subOp,x"00",x"01"),
		  6 => (subOp,x"81",x"80"),
		  7 => (subOp,x"7F",x"01"),
		  8 => (subOp,x"00",x"FF"),
		  
		 
		  9 => (orOp, x"00",x"00"),		 
         10 => (andOp,x"00",x"FF"),
		 11 => (andOp,x"81",x"80"),
         12 => (orOp, x"AA",x"55")
		 );
	
	signal Stimuli16 : aStimulArray16 :=	
		( 1 => (addOp,x"0000",x"1111"),
		  2 => (addOp,x"FFFF",x"0001"),
		  3 => (addOp,x"8080",x"0101"),
		  4 => (addOp,x"AAAB",x"5555"),	
		  
		  5 => (subOp,x"0000",x"0001"),
		  6 => (subOp,x"8181",x"8080"),
		  7 => (subOp,x"7FFF",x"0001"),
		  8 => (subOp,x"0000",x"FFFF"),
		  
		  9 => (orOp, x"0000",x"0000"),
         10 => (andOp,x"0000",x"FFFF"),
		 11 => (andOp,x"8181",x"8000"),
         12 => (orOp, x"AAAA",x"5555")
		 );

--==== 2 UUT for 8 bit data and 16 bit data ============
	
begin

uut8: entity work.ALU(Behave)
       port map (
			iSrcA  	    => SrcA8,
			iSrcB       => SrcB8,
			iALUControl => ALUControl,
			oALUResult  => ALUResult8,
			oZero       => Zero8);
		
		
uut16: entity work.ALU(Behave)
       port map (
			iSrcA  	    => SrcA16,
			iSrcB       => SrcB16,
			iALUControl => ALUControl,
			oALUResult  => ALUResult16,
			oZero       => Zero16);
		
--==== Run Simulation with Stimuli for both UUT ===========

Stimul: process
   begin 
   
	for i in Stimuli8'range loop
		SrcA8      <= Stimuli8(i).A;
		SrcB8 	   <= Stimuli8(i).B;
		ALUControl <= AluCodeTable(Stimuli8(i).Op);	
		wait for 50 ns;
		
		report AluCodeStrTable(Stimuli8(i).Op);
		LogResult(Stimuli8(i).Op,SrcA8,SrcB8,
					ALUControl,ALUResult8,Zero8);				
		wait for 50 ns;
	end loop;
	
	wait for 300 ns;
	
	---------------------
	
	for i in Stimuli16'range loop
		SrcA16 	   <= Stimuli16(i).A;
		SrcB16 	   <= Stimuli16(i).B;
		ALUControl <= AluCodeTable(Stimuli16(i).Op);	
		wait for 50 ns;
		
		report AluCodeStrTable(Stimuli16(i).Op);
		LogResult(Stimuli16(i).Op,SrcA16,SrcB16,
					ALUControl,ALUResult16,Zero16);				
		wait for 50 ns;
	end loop; 
    wait;
  end process;
  
end architecture Stimulate;
