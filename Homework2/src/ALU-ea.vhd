-----------------------------------------------------------
-- Titel      	  	: Homework 2 - Sommersemester 26
-- 					: Thomas Mueller-W.
-----------------------------------------------------------
-- Aufgabe        	: ALU entity/architecture
-- StudentIn      	: 
-- Matrikelnummer 	: 
-----------------------------------------------------------
library work;
use work.all;

entity ALU is
   port (
     iSrcA      : in  bit_vector;
	 iSrcB      : in  bit_vector;
	 iALUControl: in  bit_vector(0  to 1);
	 oALUResult : out bit_vector;
	 oZero		: out bit);
end ALU;

architecture Behave of ALU is

	-- ======= Editierbereich Beginn ======================== 
   
	-- iALUControl: "00": Add, "01": Sub, "10": And, "11": Or

	-- ======= Editierbereich Ende ===========================

end architecture Behave;











