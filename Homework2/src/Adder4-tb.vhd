-----------------------------------------------------------
-- Titel      	  	: Homework 2 - Sommersemester 26
-- 					: Thomas Mueller-W.
-----------------------------------------------------------
-- Aufgabe        	: Testbench f. Adder4
-- StudentIn      	: 
-- Matrikelnummer 	: 
-----------------------------------------------------------

library work;
use work.all;

entity Adder4Testbench is
end entity;

architecture Stimulate of Adder4Testbench is
  
    constant cLength : integer := 4;
	subtype  aData   is bit_vector(cLength-1 downto 0);
	
	signal   a,b,s   : aData;   -- siehe Angabe zur Homework2
	signal   carry   : bit;     -- siehe Angabe zur Homework2
  
	begin
  
	-- ===== Editierbereich Beginn ========================
   
    -- Adder4 instanziieren -------------------------------
	uut : entity work.Adder4(Struct)
		port map (
			ia => a,
			ib => b,
			icin => '0',
			ocout => carry,
			os => s	
		);
	
	-- Adder4Report instanziieren -------------------------
	a4r : entity work.Adder4Report(Behave)
   		port map (
     		iDataA => a,
	 		iDataB => b,
	 		iDataSum => s,
	 		iCarry => carry
		);
		
	-- ===== Editierbereich Ende ===========================
		
	
	-- ===== Simulationsdauer: 500 ns ======================
	 
	Stimul: process is
	begin
		a <= 	"0000",
				"1111" after 100 ns,			
				"1010" after 200 ns,
				"0001" after 300 ns,
				"1111" after 400 ns;
		b <= 	"0000",
				"0001" after 100 ns,				
				"0101" after 200 ns,
				"1111" after 300 ns,
				"1111" after 400 ns;		
		wait;
	end process Stimul;

end architecture Stimulate;
