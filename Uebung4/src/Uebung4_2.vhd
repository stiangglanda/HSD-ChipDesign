entity Assign is
end entity Assign;

architecture Bhv of Assign is 
signal A, B, C, D: real := 1.9;
begin
  OneAndOnly: process is
    variable Z: real := 39.0;
  begin
    A <= 3.5 after 23 ns,
         7.8 after 31 ns,
         5.8 after 56 ns;     
    B <= transport 4.5 after 22 ns,
                   4.8 after 56 ns,
                   2.3 after 177 ns;
    C <= reject 34 ns inertial 4.2 after 41 ns;
    -- a) Bitte jetzt A,B,C,D und ihre driver und Z aufzeichnen
  
    D <= transport B+1.1 after 10 ns;
    B <= transport 5.3 after 13 ns;
    Z := Z-1.4;
    -- b) Bitte jetzt D,B,Z sowie driver von D und B aufzeichnen.
  
    A <= 78.1 after 163 ns;
    Z:= B;
    -- c) Bitte jetzt A, Z und den driver von A aufzeichnen
  
    D <= reject 61 ns inertial 3.0 after 71 ns; --71 - 61 = 10 ns
    C <= reject 63 ns inertial 2.3 after 89 ns;
    -- d) Bitte jetzt C, D und zugehoerige driver aufzeichnen
  
    wait;
  end process OneAndOnly;

end architecture Bhv;