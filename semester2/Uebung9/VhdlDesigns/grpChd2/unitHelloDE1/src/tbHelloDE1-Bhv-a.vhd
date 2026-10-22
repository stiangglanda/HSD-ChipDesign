---------------------------------------------------------------------------
-- Title      : Testbench for HelloDE1
-- Project    : HelloDE1
-- Company    : FH OOe Hagenberg/A, Copyright (c) 2015
-------------------------------------------------------------------------------
-- Author	  : Thomas Mueller-W,
-- Date		  : 30.4.2015
-- Authors are
-- 		tm	  : Thomas Mueller-W., Hagenberg
-- Revisions  : V1, 30.4.15, tm
-------------------------------------------------------------------------------

architecture Bhv of tbHelloDE1 is

  signal Clk		: std_ulogic := '0';
  signal nReset		: std_ulogic;
  signal sw			: std_ulogic_vector(9 downto 0);
  signal sevenSeg0	: std_ulogic_vector(6 downto 0);
  signal sevenSeg1	: std_ulogic_vector(6 downto 0);
  signal led		: std_ulogic_vector(9 downto 0);
 
begin

   DUT: entity work.HelloDE1(Rtl)
		  port map(iClock		=> Clk,
					inReset		=> nReset,
					iSW			=> sw,
					o7SegCode0	=> sevenSeg0,
					o7SegCode1	=> sevenSeg1,
					oLed		=> led);

   ClkGen: Clk <= not(Clk) after 1 sec / 50E6; 

  Stimul : process is
  begin

    -- Start Simulation: Reset
    nReset	<= cnActivated;
    sw(0)   <= cInactivated;
	sw(1)	<= cInactivated;
	sw(2)	<= cInactivated;
	sw(3)	<= cInactivated;
	
	sw(4)	<= cInactivated;
	sw(5)	<= cInactivated;
	sw(6)	<= cInactivated;
	sw(7)	<= cInactivated;
    wait for 100 ns;

	-- User Inputs 
    nReset <= cnInactivated;
    wait for 100 ns;

    -- Display "11"
    sw(0)	<= cActivated;
	sw(1)	<= cInactivated;
	sw(2)	<= cInactivated;
	sw(3)	<= cInactivated;
	
	sw(4)	<= cActivated;
	sw(5)	<= cInactivated;
	sw(6)	<= cInactivated;
	sw(7)	<= cInactivated;
    wait for 100 ns;
    
    -- Display "88"
    sw(0)	<= cInactivated;
	sw(1)	<= cInactivated;
	sw(2)	<= cInactivated;
	sw(3)	<= cActivated;
	
	sw(4)	<= cInactivated;
	sw(5)	<= cInactivated;
	sw(6)	<= cInactivated;
	sw(7)	<= cActivated;
    wait for 100 ns;
	
	wait for 300 ns ;
	
    -- Break simulation as ClkGen continues running.
    assert false report "Simulation finished." severity note;
    assert false report "Stopping Clock-Generator!" severity failure;

    wait;
  end process Stimul;
  
end Bhv;

