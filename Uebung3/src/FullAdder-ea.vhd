entity FullAdder is
  port (
    A, B, Cin : in bit;
    Sum, Cout : out bit
  );
end entity FullAdder;

architecture Behavioral of FullAdder is
begin
    process (A, B, Cin)
    begin
        Sum <= (A xor B) xor Cin after 20 ns;
        Cout <= (A and B) or (Cin and (A xor B)) after 15 ns;
    end process;
end architecture Behavioral;