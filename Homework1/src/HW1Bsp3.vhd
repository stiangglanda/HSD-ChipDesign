--------------------------------------------------------------------
-- Titel      	  	: Homework 1 - Sommersemester 2026
-- Author	  	    : Thomas Mueller-W.
--------------------------------------------------------------------
-- Aufgabe       	: Aufgabe 3 - Hex to SevenSegment
-- Student*in      	: 
--------------------------------------------------------------------

use std.textio.all;		-- zur Ausgabe der Ergebnisse in eine Datei

entity HW1Bsp3 is
end HW1Bsp3;

architecture abgabe of HW1Bsp3 is
begin

  P1: process

	---------------------------- Deklarationen ---------------------
	
	-- Eingabewerte fuer Konvertierungen
	subtype  aHexVal is bit_vector (3 downto 0);  	
	variable vHex1 : aHexVal := "0000";		-- Test 1
	variable vHex2 : aHexVal := "0001";		-- Test 2
	variable vHex3 : aHexVal := "1000";		-- Test 3
	variable vHex4 : aHexVal := "0011";		-- Test 4
	variable vHex5 : aHexVal := "1010";		-- Test 5
	variable vHex6 : aHexVal := "1011";		-- Test 6
	variable vHex7 : aHexVal := "1110";		-- Test 7
	variable vHex8 : aHexVal := "1111";		-- Test 8
	
	type aSegment is (a,b,c,d,e,f,g);		   -- Namen der Segmente
	type a7SegVal is array (aSegment) of bit;  -- Anzeige aus 7 Segmenten

	-- ======================= Ab hier editieren =====================

	function HexTo7SegA (HexVal : aHexVal) return a7SegVal is
	begin
 	     return ("1111111");		-- to be replaced
	end function HexTo7SegA;
	
	
	function HexTo7SegB (HexVal : aHexVal) return a7SegVal is
	begin
 	     return ("1111111");		-- to be replaced
	end function HexTo7SegB;

    	-- =============== Ende des zu editierenden Bereiches ==========
	
	--------------------------------------------------------------------
	--  LogResult : Print result of conversions to logFile 
	--------------------------------------------------------------------
	
	file logFile : text open write_mode is "logHW1Bsp3.txt";
	subtype aBV7 is bit_vector(6 downto 0);

	function Seg2BV7 (SegVal : a7SegVal) return aBV7 is
		variable bv7 : aBV7;
	begin
		bv7(6):= Segval(a);
		bv7(5):= Segval(b);
		bv7(4):= Segval(c);
		bv7(3):= Segval(d);
		bv7(2):= Segval(e);
		bv7(1):= Segval(f);
		bv7(0):= Segval(g);	
		return (bv7);
	end function Seg2BV7;
	
	procedure LogResult (HexVal : in aHexVal; -- a BCD Value to be displayed 
				res7SegA: in a7SegVal;		  -- ResultA computedby using an array 
				res7SegB: in a7SegVal) is  	  -- ResultB computed by using a case statement
		
		variable headline	: string (1 to 21) := "Hex/ResultA/ResultB: ";
		variable outStr		: string (1 to 25) := " <-- ungleiche Ergebnisse";
		variable logLine	: line;
	begin	
		write(logLine,string'(headline));
		write(logLine,HexVal); 
		write(logLine,'/');
		write(logLine,Seg2BV7(res7SegA));
		write(logLine,'/');
		write(logLine,Seg2BV7(res7SegB));
		if res7SegA /= res7SegB then
			write(logLine,string'(outStr));
		end if;
		writeline(logFile,logLine);
			
	end procedure LogResult;

	--------------------------------------------------------------------
	-- process P1: Sequential statements: run test cases
	--------------------------------------------------------------------
	begin
			
		logResult(vHex1,Hexto7SegA(vHex1),Hexto7SegB(vHex1));
		wait for 20 ns;
		logResult(vHex2,Hexto7SegA(vHex2),Hexto7SegB(vHex2));
		wait for 20 ns;
		logResult(vHex3,Hexto7SegA(vHex3),Hexto7SegB(vHex3));
		wait for 20 ns;
		logResult(vHex4,Hexto7SegA(vHex4),Hexto7SegB(vHex4));
		wait for 20 ns;
		logResult(vHex5,Hexto7SegA(vHex5),Hexto7SegB(vHex5));
		wait for 20 ns;
		logResult(vHex6,Hexto7SegA(vHex6),Hexto7SegB(vHex6));
		wait for 20 ns;
		logResult(vHex7,Hexto7SegA(vHex7),Hexto7SegB(vHex7));
		wait for 20 ns;
		logResult(vHex8,Hexto7SegA(vHex8),Hexto7SegB(vHex8));
		wait for 20 ns;
		
		report "Process P1 finished";
		wait;
	end process P1;

end architecture abgabe;



