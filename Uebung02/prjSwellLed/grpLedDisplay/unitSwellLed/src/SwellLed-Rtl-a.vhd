-------------------------------------------------------------------------------
-- Title      : Synthesis efficient architecture of SwellLed
-------------------------------------------------------------------------------
-- Company    : FH-Hagenberg/HSSE, Hagenberg/Austria
--              Copyright (c) 2000
-------------------------------------------------------------------------------
-- Authors are:
-- pfaff: Markus Pfaff
-------------------------------------------------------------------------------

architecture Rtl of SwellLed is

  -- the logarithm dualis (= bit width) of the cyclic counter
  constant cCycleBitCount : natural := LogDualis(gClkFrequency/gPwmRate);

  -- what the user wants to do
  signal UserCommand : std_ulogic_vector(1 downto 0);

  -- the value that marks the change from on to off state for the Led
  signal Brightness   : unsigned(cCycleBitCount-1 downto 0);
  -- the counter which goes from 0 to maximum during each cycle
  signal PlaceInCycle : unsigned(cCycleBitCount-1 downto 0);

begin  -- Rtl

  -- I'd like to use a case statement later on thus have to unify the user input
  UserCommand <= iDimmKey & iBrightenKey;

  -- purpose: cyclic counting, adjusting Bightness
  -- type   : sequential
  -- inputs : Clk, Reset_an, DimmKey, BrightenKey
  -- outputs: Led, PlaceInCycle, Brightness
  CountAndAdjust : process (iClk, inResetAsync)

  begin  -- process AskKeys
    if inResetAsync = cnActivated then  -- asynchronous reset (active low)

      PlaceInCycle <= to_unsigned(0, PlaceInCycle'length);
      Brightness   <= to_unsigned(0, Brightness'length);

    elsif iClk'event and iClk = '1' then  -- rising clock edge

      -- the Counter is always running through the full cycle
      -- the value given by the user for PWM rate is not followed exactly
      PlaceInCycle <= (PlaceInCycle + 1) mod (2**cCycleBitCount);

      -- adjustment happens once per cycle
      if PlaceInCycle = 0 then
        -- adjust Brightness according to the keys pressed
        case UserCommand is
          -- Dimm the light please
          when "10" =>
            if Brightness /= 0 then
              Brightness <= Brightness - 1;
            end if;
            -- Brighten the light please
          when "01" =>
            if Brightness /= (2**cCycleBitCount)-1 then
              Brightness <= Brightness + 1;
            end if;
            -- Do nothing if no or both keys are pressed
          when "00" | "11" => null;
          when others      => Brightness <= (others => 'X');
        end case;
      end if;

    end if;

  end process CountAndAdjust;

  -- When does the led glow?
  oLed <= cActivated when PlaceInCycle < Brightness else
          cInactivated;

  
end Rtl;
