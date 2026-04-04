---------------------------------------------------------------------------
-- Titel      	    : Homework 1 - Sommersemester 2026
-- Author		    : Thomas Mueller-W.
---------------------------------------------------------------------------
-- Aufgabe        	: Aufgabe 1 - BinToInt
-- Student*in      	: Leander Kieweg
---------------------------------------------------------------------------

use std.textio.all;	-- zur Ausgabe der Ergebnisse in eine Datei

entity HW1Bsp1 is
end HW1Bsp1;

architecture abgabe of HW1Bsp1 is
begin

P1: process

	-------------------------- Deklarationen ------------------------------
	
	subtype aBitVector8  is bit_vector (7 downto 0);		
    subtype aBitVector16 is bit_vector (15 downto 0);		    
	
	-- Testdaten
	variable vBVector1: aBitVector8  := (others=>'0');			            
	variable vBVector2: aBitVector8  := (7=>'1', 2=>'1', others=>'0');	    
	variable vBVector3: aBitVector8  := ('0','0','0','0','1','1','1','1');	
	variable vBVector4: aBitVector8  := "10000000";				            
	variable vBVector5: aBitVector16 := x"FFFF";				            
	variable vBVector6: aBitVector16 := x"0064";				            
	
	-- Ergebnis-Variablen
	variable vResUnsigned, vResSigned:  integer; 			
	
	-- ========================= Ab hier editieren =======================

	-- ==> Hier die Funktion:	BinToInt definieren <==
	-- Der 1. Eingabe-Parameter hat Typ bit_vector
	-- Der 2. Eingabe-Parameter hat Typ boolean (true: Zahl im Zweierkomplement)
	-- Der Rueckgabe-Wert hat den Typ Integer.
	function PowOfTwo(pow: integer) return integer is
		variable nResult : integer := 1;
	begin
		if pow = 1 then
			return 2;
		end if;

		for i in 1 to pow loop
			nResult := nResult * 2;
		end loop;

		return nResult;
	end;

	function BinToInt(vBVector : bit_vector; bTwosComplement : boolean) return integer is
		variable vResult : integer := 0;
	begin
		for i in vBVector'range loop
			if vBVector(i) = '1' then
				vResult := vResult + PowOfTwo(i);
			end if;
		end loop;
		return vResult;
	end;
	
	-- =============== Ende des zu editierenden Bereiches ==================
		
	------------------------------------------------------------------------
	--  LogResult : Print results to logFile
	------------------------------------------------------------------------
	
	file logFile : text open write_mode is "logHW1Bsp1.txt";

	procedure LogResult (bvector 	 : in bit_vector;	-- bitvector to convert
				         resUnsigned : in integer; 		-- unsigned result value 
                         resSigned	 : in integer) is  	-- signed result value
	
		variable headline: string (1 to 24) := "Vektor/Unsigned/Signed: ";
		variable logLine: line;
	begin	
		write(logLine,string'(headline));
		write(logLine,bvector); 
		write(logLine,'/');
		write(logLine,resUnsigned);
		write(logLine,'/');
		write(logLine,resSigned);
		writeline(logFile,logLine);		
	end procedure LogResult;


	-------------------------------------------------------------------------
	-- process P1: Sequential statements: run test cases
	-------------------------------------------------------------------------
	begin	
		vResUnsigned := BinToInt(vBVector1,false);
		vResSigned   := BinToInt(vBVector1,true);
		LogResult(vBVector1,vResUnsigned,vResSigned);
		wait for 20 ns;
		
		vResUnsigned := BinToInt(vBVector2,false);
		vResSigned   := BinToInt(vBVector2,true);
		LogResult(vBVector2,vResUnsigned,vResSigned);
		wait for 20 ns;

		vResUnsigned := BinToInt(vBVector3,false);
		vResSigned   := BinToInt(vBVector3,true);
		LogResult(vBVector3,vResUnsigned,vResSigned);
		wait for 20 ns;

		vResUnsigned := BinToInt(vBVector4,false);
		vResSigned   := BinToInt(vBVector4,true);
		LogResult(vBVector4,vResUnsigned,vResSigned);
		wait for 20 ns;

		vResUnsigned := BinToInt(vBVector5,false);
		vResSigned   := BinToInt(vBVector5,true);
		LogResult(vBVector5,vResUnsigned,vResSigned);
		wait for 20 ns;

		vResUnsigned := BinToInt(vBVector6,false);
		vResSigned   := BinToInt(vBVector6,true);
		LogResult(vBVector6,vResUnsigned,vResSigned);
		wait for 20 ns;

		report "Process P1 finished";
		
		wait;
	end process;

end abgabe;





