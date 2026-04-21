----------------------------------------------------------------
-- Title      : VHDL Uebung Homework2
----------------------------------------------------------------
-- File       : Adder4Report-ea.vhd
-- Author     : Mueller-W.
-- Platform   : 
----------------------------------------------------------------
-- Description: reporting Unit for Adder4
----------------------------------------------------------------
-- Revisions  :
-- Date         Version  Author         Description
-- 2016/04/04   1.0      Mueller-W.     Created
-- 2017/04/11   1.1      Mueller-W.	    Print Events
----------------------------------------------------------------

-- =============================================================
-- Diese Datei NICHT EDITIEREN und NICHT ABGEBEN!!
-- =============================================================

library std;
use std.textio.all;	 -- Ausgabe der Ergebnisse in eine Datei

library work;
use work.all;

entity Adder4Report is
   port (
     iDataA    : in  bit_vector;
	 iDataB    : in  bit_vector;
	 iDataSum  : in  bit_vector;
	 iCarry    : in bit);
end Adder4Report;

architecture Behave of Adder4Report is

	file logFile : text open write_mode is "logHW2Bsp1.txt";

	-----------------------------------------------------------------
	
	procedure prtEvent (eventp: in boolean; logLine: inout line) is
	begin
	    if eventp then
			write(logLine,'!');
		else 
			write(logLine,' ');
		end if;
	end;
	
	-----------------------------------------------------------------
	
	procedure prtTime (logLine: inout line) is
	   constant maxTimeLen : positive := 7;
	   variable vblanks : string (1 to maxTimeLen) := (others=> ' ');
	   variable vNowLen: positive;
	begin
	    vNowlen:=time'image(now)'length;
		write(logLine,time'image(now));
	    if vNowLen < maxTimeLen then
		   write(logline, vblanks(1 to maxTimeLen-vNowLen));
		end if;
		write(logLine,':');	
	end;
	
	-------------------------------------------------------------------
	
	procedure LogResult (SrcA 	   : in bit_vector;	
						 SrcAEvent : in boolean;
						 SrcB 	   : in bit_vector;
						 SrcBEvent : in boolean;
						 Sum	   : in bit_vector;
						 SumEvent  : in boolean;
						 Carry	   : in bit;
						 CarryEvent: in boolean) is					 
		variable  outStrA  : string (1 to 3)  := " A=";
		variable  outStrB  : string (1 to 4)  := "  B=";		
		variable  outStrC  : string (1 to 4)  := "  C=";
		variable  outStrS  : string (1 to 4)  := "  S=";
		variable  logLine: line;
		
		begin
			prtTime (logLine);
			
			write(logLine,outStrA);
			write(logLine,SrcA); 
			prtEvent(SrcAEvent,logLine);
			
			write(logLine,outStrB);
			write(logLine,SrcB);
			prtEvent(SrcBEvent,logLine);
			
			write(logLine,outStrC);
			write(logLine,Carry);
			prtEvent(CarryEvent,logLine);
			
			write(logLine,outStrS);
			write(logLine,Sum);
			prtEvent(SumEvent,logLine);
			
			writeline(logFile,logLine);			
		end procedure LogResult;

	begin
		
Reporter: process is
  begin 
	LogResult  (iDataA,iDataA'event,
				iDataB,iDataB'event,
				iDataSum,iDataSum'event,
				iCarry,iCarry'event);
	wait on iDataA,iDataB,iDataSum,iCarry;
  end process Reporter;
  
end architecture Behave;











