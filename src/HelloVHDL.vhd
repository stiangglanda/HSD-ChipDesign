entity first is
end first;

architecture do_it of first is
    -- deklarationen fuer architecture
begin

  lets_do_it : process is
    
    procedure add (a : in integer; b : in integer; y : out integer) is
    begin
      y := a + b;
    end;

    variable sum : integer;
    variable b1 : boolean := true;
    variable bit1 : bit := '0';

    variable r1 : real := 1.5;
    constant c2 : integer := 2;
    constant c3 : integer := 5;

    type tage is (mo, di,mi,do,fr,sa,so);
    variable tag1 : tage := fr;
    subtype werktage is tage range mo to fr;
    variable d1 : werktage := di;

    variable integer_var : integer := 42;
    variable real_var : real := 2.3;
    variable char_var : character := 'A';
    variable boolean_var : boolean := true;
    variable bit_var : bit := '1';

    type tage_array is array (tage) of tage; --(INDEX_DEFINITION)
    variable vTage : tage_array := (mo, di, mi, do, fr, sa, so);

    subtype aIntSub is integer range 0 to 255;
    variable aIntSubVar : aIntSub := 5;

    type aMathVector is array (integer range <>) of real; -- unconstrained
    variable vMathVec : aMathVector(0 to 3) := (1.0, 2.0, 3.0, 4.0);

    type string2 is array (positive range <>) of character; -- unconstrained
    variable vString : string2(1 to 5) := "Hello";

    variable vBitVec : bit_vector (7 downto 0) := "10101010";
    variable vBitVec2 : bit_vector (3 downto 0) := "1101";
  begin

    vBitVec2(3 downto 0) := vBitVec(7 downto 4); -- slice assignment
  
    report "Hello VHDL";
    add (c3, c2, sum);

    wait for 10 ns;

    if sum = 7 then --for uebung work with elsif
      report "5+2 = 7";
    else
       report "5+2 /= 7";
    end if;

    wait for 15 ns;

    for i in 0 to 2 loop
      report "for loop";
      sum := sum + sum / 2;
      wait for 5 ns;
    end loop;

    wait for 10 ns;

    while sum > 0 loop 
      report "while loop";
      sum := sum-3;
      wait for 5 ns;
    end loop;

    wait;
  end process;

end do_it;

