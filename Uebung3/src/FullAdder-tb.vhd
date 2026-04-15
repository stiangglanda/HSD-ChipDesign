entity FullAdderTB is
end entity ;

architecture struct of FullAdderTB is
    signal a, b, cin : bit := '0';
    signal s, cout : bit;
begin
    uut: entity work.FullAdder(behave)
        port map (
            ia => a,
            ib => b,
            icin => cin,
            os => s,
            ocout => cout);

    Stimul: process is
   begin
      a <=  '0' after 100 ns, 
            '0' after 200 ns, 
            '0' after 300 ns, 
            '0' after 400 ns, 
            '1' after 500 ns, 
            '1' after 600 ns, 
            '1' after 700 ns, 
            '1' after 800 ns;

      b <=  '0' after 100 ns, 
            '0' after 200 ns, 
            '1' after 300 ns, 
            '1' after 400 ns, 
            '0' after 500 ns, 
            '0' after 600 ns, 
            '1' after 700 ns, 
            '1' after 800 ns;

      cin <='0' after 100 ns, 
            '1' after 200 ns, 
            '0' after 300 ns, 
            '1' after 400 ns, 
            '0' after 500 ns, 
            '1' after 600 ns, 
            '0' after 700 ns, 
            '1' after 800 ns;
      wait;
   end process Stimul;

   Tests: process is
   begin
      -- Test 1
      wait for 130 ns;
      if s = '0' and cout = '0' then
         report "++Test 1 passed++";
      else
         report "--Test 1 failed--";
      end if;

      -- Test 2
      wait for 100 ns;
      if s = '1' and cout = '0' then
         report "++Test 2 passed++";
      else
         report "--Test 2 failed--";
      end if;

      -- Test 3
      wait for 100 ns;
      if s = '1' and cout = '0' then
         report "++Test 3 passed++";
      else
         report "--Test 3 failed--";
      end if;

      -- Test 4
      wait for 100 ns;
      if s = '0' and cout = '1' then
         report "++Test 4 passed++";
      else
         report "--Test 4 failed--";
      end if;

      -- Test 5
      wait for 100 ns;
      if s = '1' and cout = '0' then
         report "++Test 5 passed++";
      else
         report "--Test 5 failed--";
      end if;

      -- Test 6
      wait for 100 ns;
      if s = '0' and cout = '1' then
         report "++Test 6 passed++";
      else
         report "--Test 6 failed--";
      end if;

      -- Test 7
      wait for 100 ns;
      if s = '0' and cout = '1' then
         report "++Test 7 passed++";
      else
         report "--Test 7 failed--";
      end if;

      -- Test 8
      wait for 100 ns;
      if s = '1' and cout = '1' then
         report "++Test 8 passed++";
      else
         report "--Test 8 failed--";
      end if;

      report "End of Simulation!";
      wait;
   end process Tests;
end architecture struct;