library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
ENTITY TB_Antirrebote IS
END TB_Antirrebote;
 
ARCHITECTURE behavior OF TB_Antirrebote IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Antirrebote
    PORT(
         clk : IN  std_logic;
         inp : IN  std_logic;
         outp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal inp : std_logic := '0';

 	--Outputs
   signal outp : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Antirrebote PORT MAP (
          clk => clk,
          inp => inp,
          outp => outp
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
	
		inp <='0';
		wait for 1 ms;
		
		inp <='1';
		wait for 9 ms;
		
		inp <='0';
		wait for 1 ms;
		
		inp <='1';
		wait for 300 ms;
		
		inp <='0';
		wait for 20 ms;
		
		inp <='1';
		wait for 200 ms;
		
		inp <='0';
		wait for 200 ms;
		
		inp <='1';
		wait for 50 ms;
		
		inp <='0';
		wait for 5 ms;
		
		inp <='1';
		wait for 10 ms;

      wait;
   end process;

END;
