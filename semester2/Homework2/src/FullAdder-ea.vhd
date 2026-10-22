entity FullAdder is
  port (
    ia : in bit;
    ib : in bit;
    icin : in bit;
    os : out bit;
    ocout : out bit);
end entity FullAdder;

architecture behave of FullAdder is
begin
    process
    begin
        os <= transport ia xor ib xor icin after 20 ns;
        ocout <= transport (ia and ib) or (icin and (ia xor ib)) after 15 ns;
        wait on ia, ib, icin;
    end process;
end architecture behave;