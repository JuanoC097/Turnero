library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
ENTITY TB_Utilidad7Segmentos IS
END TB_Utilidad7Segmentos;
 
ARCHITECTURE behavior OF TB_Utilidad7Segmentos IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Utilidad7Segmentos
    PORT(
         clk : IN  std_logic;
         UIn0 : IN  std_logic_vector(1 downto 0);
         UIn1 : IN  std_logic_vector(3 downto 0);
         UOut0 : OUT  std_logic_vector(3 downto 0);
         UOut1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal UIn0 : std_logic_vector(1 downto 0) := (others => '0');
   signal UIn1 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal UOut0 : std_logic_vector(3 downto 0);
   signal UOut1 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Utilidad7Segmentos PORT MAP (
          clk => clk,
          UIn0 => UIn0,
          UIn1 => UIn1,
          UOut0 => UOut0,
          UOut1 => UOut1
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
      
		UIn0 <= "00";
		UIn1 <= "0001";
      wait for 32 ms;
		
		UIn0 <= "01";
		UIn1 <= "0010";
      wait for 32 ms;
		
		UIn0 <= "10";
		UIn1 <= "0011";
      wait for 32 ms;
		
		UIn0 <= "11";
		UIn1 <= "0100";
      wait for 32 ms;
   end process;

END;
