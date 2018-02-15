library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
ENTITY TB_SieteSegmentos IS
END TB_SieteSegmentos;
 
ARCHITECTURE behavior OF TB_SieteSegmentos IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SieteSegmentos
    PORT(
         clk : IN  std_logic;
         in0 : IN  std_logic_vector(3 downto 0);
         in1 : IN  std_logic_vector(3 downto 0);
         in2 : IN  std_logic_vector(3 downto 0);
         in3 : IN  std_logic_vector(3 downto 0);
         out0 : OUT  std_logic_vector(3 downto 0);
         out1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal in0 : std_logic_vector(3 downto 0) := (others => '0');
   signal in1 : std_logic_vector(3 downto 0) := (others => '0');
   signal in2 : std_logic_vector(3 downto 0) := (others => '0');
   signal in3 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal out0 : std_logic_vector(3 downto 0);
   signal out1 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SieteSegmentos PORT MAP (
          clk => clk,
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          out0 => out0,
          out1 => out1
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
	in0 <= "0000";
	in1 <= "0001";
	in2 <= "0010";
	in3 <= "0011";
	wait for 20 ms;
	
   end process;

END;
