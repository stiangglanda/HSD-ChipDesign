-------------------------------------------------------------------------------
-- Titel      	  	: Homework 1 - Sommersemester 2026
-- Author			: Thomas Mueller-W.
-------------------------------------------------------------------------------
-- Aufgabe        	: Aufgabe 2
-- Student*in      	: Leander Kieweg
-------------------------------------------------------------------------------

use std.textio.all;	-- zur Ausgabe der Ergebnisse in eine Datei

entity HW1Bsp2 is
end HW1Bsp2;

architecture abgabe of HW1Bsp2 is
begin

  P1: process

	---------------------------- Deklarationen ----------------------------------
	
	-- Vektoren fuer Shift-Operationen
	subtype  aBVector is bit_vector (7 to 22);		
	variable vVec,vRes0,vRes: aBVector;
	
	-- erlaubte Shift Amounts
	subtype  ashamt is integer range 0 to aBVector'high-aBVector'low+1;  
	variable vShamt : ashamt;

	-- ================== Ab hier editieren =====================================
	
	--------- SLL ---------------------------------------------------------------

	procedure my_sll (vector: in aBVector; shamt: in ashamt; result: out aBVector) is
	begin
		result := (others => '0');			-- to be replaced
		for i in vector'right downto vector'left + shamt loop
			result(i-shamt) := vector(i);
		end loop;
	end procedure my_sll;

	--------- SRL ---------------------------------------------------------------
	
	procedure my_srl (vector: in aBVector; shamt: in ashamt; result: out aBVector) is
	begin
 	    result := (others => '0');			-- to be replaced
		for i in vector'left to vector'right - shamt loop
			result(i+shamt) := vector(i);
		end loop;
	end procedure my_srl;

	--------- SRA ---------------------------------------------------------------
	
	procedure my_sra (vector: in aBVector; shamt: in ashamt; result: out aBVector) is
	begin
		if vector(vector'left) = '1' then
			result := (others => '1');			-- to be replaced
		else
			result := (others => '0');			-- to be replaced
		end if;
 	    
		for i in vector'left to vector'right - shamt loop
			result(i+shamt) := vector(i);
		end loop;
	end procedure my_sra;
	
	--------- ROR ---------------------------------------------------------------
	
	procedure my_ror (vector: in aBVector; shamt: in ashamt; result: out aBVector) is
	begin
 	    result := (others => '0');			-- to be replaced

		for i in vector'left to vector'right loop
			result(((i+shamt-vector'left) mod vector'length)+vector'left) := vector(i); -- mod vector'length
		end loop;
	end procedure my_ror;
	
	-- ================== Ende des zu editierenden Bereiches ====================

	
	-----------------------------------------------------------------------------
	--  LogResult : Print result of shift operation to logFile 
	-----------------------------------------------------------------------------
	
	file logFile : text open write_mode is "logHW1Bsp2.txt";

	procedure LogResult (	ShiftOp : in string;		-- string to identify test 
				vec 	: in aBVector;		-- vector to be shifted
				result0 : in aBVector;		-- reference resulting vector 
				result  : in aBVector) is  	-- vector to be tested for correctness

		variable  outStr : string (1 to 11);
		variable  logLine: line;
	begin	
 		if result0 = result then 
		    outStr := "++ ok.   : ";
		    report "Result of " & ShiftOp & " passed.";
		else
		    outStr :=  "-- not ok: ";
		    report "Result of " & ShiftOp & " NOT passed.";
		end if;

		write(logLine,string'(outStr & Shiftop));
		write(logLine,vec); 
		write(logLine,':');
		write(logLine,' ');
		write(logLine,result0);
		write(logLine,'/');
		write(logLine,result);
		writeline(logFile,logLine);
			
	end procedure LogResult;

	---------------------------------------------------------------------------
	-- process P1: Sequential statements: run test cases
	---------------------------------------------------------------------------
	begin
		
		-- Test1 : sll 4 --------------
		vVec := x"AAAF";
		vShamt := 4;
		vRes0 := vVec sll vShamt;	
		my_sll(vVec,vShamt,vRes);
		LogResult("Test 1: sll, 4:  ",vVec,vRes0,vRes);
		wait for 20 ns;
		
		-- Test 2: sll 12 --------------
		vShamt := 12;
		vRes0 := vVec sll vShamt;
		my_sll(vVec,vShamt,vRes);
		LogResult("Test 2: sll, 12: ",vVec,vRes0,vRes);
		wait for 20 ns;

		-- Test 3: srl 8  --------------
		vshamt := 8;
		vRes0 := vVec srl vShamt;
		my_srl(vVec,vShamt,vRes);
		LogResult("Test 3: srl, 8:  ",vVec,vRes0,vRes);
		wait for 20 ns;

		-- Test 4: sra 4  --------------
		vVec := x"AAAF";
		vShamt := 4;
		vRes0 := vVec sra vShamt;
		my_sra(vVec,vShamt,vRes);
		LogResult("Test 4: sra, 4:  ",vVec,vRes0,vRes);
		wait for 20 ns;

		-- Test 5: sra 4  --------------
		vVec := x"6AAF";
		vShamt := 4;
		vRes0 := vVec sra vShamt;
		my_sra(vVec,vShamt,vRes);
		LogResult("Test 5: sra, 4:  ",vVec,vRes0,vRes);
		wait for 20 ns;
		
		-- Test 6: ror 12 --------------
		vVec := x"A06A";
		vShamt := 12;
		vRes0 := vVec ror vShamt;
		my_ror(vVec,vShamt,vRes);
		LogResult("Test 6: ror, 12: ",vVec,vRes0,vRes);
		wait for 20 ns;

		report "Process P1 finished";
		wait;
	end process P1;

end architecture abgabe;



