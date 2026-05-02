-----------------------------------------------------------
-- Titel      	  	: Homework 2 - Sommersemester 26
-- 					: Thomas Mueller-W.
-----------------------------------------------------------
-- Aufgabe        	: ALU entity/architecture
-- StudentIn      	: Leander Kieweg
-- Matrikelnummer 	: 52511155
-----------------------------------------------------------
library work;
use work.all;

entity ALU is
	port (
		iSrcA : in bit_vector;
		iSrcB : in bit_vector;
		iALUControl : in bit_vector(0 to 1);
		oALUResult : out bit_vector;
		oZero : out bit);
end ALU;

architecture Behave of ALU is

	-- ======= Editierbereich Beginn ======================== 

	-- iALUControl: "00": Add, "01": Sub, "10": And, "11": Or

	procedure addBV (a : in bit_vector; b : in bit_vector; y : out bit_vector) is
		variable carry : bit := '0';
		variable result : bit_vector(a'range);
	begin
		for i in a'reverse_range loop
			result(i) := a(i) xor b(i) xor carry;
			carry := (a(i) and b(i)) or (carry and (a(i) xor b(i)));
		end loop;
		y := result;
	end;

	procedure subBV (a : in bit_vector; b : in bit_vector; y : out bit_vector) is
		variable one : bit_vector(b'range) := (others => '0');
		variable nb : bit_vector(b'range) := not b;
		variable b2k : bit_vector(b'range);
	begin
		one(one'right) := '1';
		addBV(nb, one, b2k);
		addBV(a, b2k, y);
	end;
begin

	process
		variable result : bit_vector(iSrcA'range);
	begin
		case iALUControl is
			when "00" =>
				addBV(iSrcA, iSrcB, result);
			when "01" =>
				subBV(iSrcA, iSrcB, result);
			when "10" =>
				result := iSrcA and iSrcB;
			when "11" =>
				result := iSrcA or iSrcB;
		end case;

		oALUResult <= result after 10 ns;
		oZero <= '1' when result = (result'range => '0') else
			'0' after 15 ns;

		wait on iSrcA, iSrcB, iALUControl;
	end process;
	-- ======= Editierbereich Ende ===========================

end architecture Behave;