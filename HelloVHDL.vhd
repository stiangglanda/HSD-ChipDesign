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

  begin


  
    report "Hello VHDL";
    add (5, c2, sum);

    wait for 10 ns;

    if sum = 7 then
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

