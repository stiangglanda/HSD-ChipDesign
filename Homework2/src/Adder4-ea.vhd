entity Adder4 is
    port(
        ia : in bit_vector(3 downto 0);
        ib : in bit_vector(3 downto 0);
        icin : in bit;
        os : out bit_vector(3 downto 0);
        ocout : out bit
    );
end entity Adder4;

architecture Struct of Adder4 is
    signal carry : bit_vector(2 downto 0);
begin
    fa0: entity work.FullAdder(behave)
        port map(
            ia => ia(0),
            ib => ib(0),
            icin => icin,
            os => os(0),
            ocout => carry(0)
        );

    fa1: entity work.FullAdder(behave)
        port map(
            ia => ia(1),
            ib => ib(1),
            icin => carry(0),
            os => os(1),
            ocout => carry(1)
        );

    fa2: entity work.FullAdder(behave)
        port map(
            ia => ia(2),
            ib => ib(2),
            icin => carry(1),
            os => os(2),
            ocout => carry(2)
        );

    fa3: entity work.FullAdder(behave)
        port map(
            ia => ia(3),
            ib => ib(3),
            icin => carry(2),
            os => os(3),
            ocout => ocout
        );
end architecture Struct;