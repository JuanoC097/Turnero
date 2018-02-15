LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_GeneradorTurnos IS
END TB_GeneradorTurnos;
 
ARCHITECTURE behavior OF TB_GeneradorTurnos IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GeneradorTurnos
    PORT(
         clk : IN  std_logic;
         BotonSiguiente : IN  std_logic;
         GRecibo : IN  std_logic;
         Salida7Segmentos4bits : OUT  std_logic_vector(3 downto 0);
         Salida7Segmentos8bits : OUT  std_logic_vector(7 downto 0);
         GEnvio : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal BotonSiguiente : std_logic := '0';
   signal GRecibo : std_logic := '0';

 	--Outputs
   signal Salida7Segmentos4bits : std_logic_vector(3 downto 0);
   signal Salida7Segmentos8bits : std_logic_vector(7 downto 0);
   signal GEnvio : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GeneradorTurnos PORT MAP (
          clk => clk,
          BotonSiguiente => BotonSiguiente,
          GRecibo => GRecibo,
          Salida7Segmentos4bits => Salida7Segmentos4bits,
          Salida7Segmentos8bits => Salida7Segmentos8bits,
          GEnvio => GEnvio
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
		GRecibo <= '1';
		BotonSiguiente <= '1';
		-- IDLE --
		---------- Envio 000001000 paridad 1 -------------
		GRecibo <= '1';
      wait for 0.10416 ms;
		GRecibo <= '1';
      wait for 0.10416 ms;
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE INICIO --
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- BIT Numero 1 --
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 2
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 3
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 4
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 5
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- 6
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 7
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 8
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- BIT DE PARIDAD --
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		GRecibo <= '1';
      wait for 40 ms;
		
		-- IDLE --
		---------- Envio 11111111 paridad 0 -------------
		GRecibo <= '1';
      wait for 0.10416 ms;
		GRecibo <= '1';
      wait for 0.10416 ms;
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE INICIO --
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- BIT Numero 1 --		
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- 2
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- 3
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- 4
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- 5
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- 6
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- 7
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- 8
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE PARIDAD --
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		GRecibo <= '1';
      wait for 0.10416 ms;
		GRecibo <= '1';
		wait for 40 ms;
		
		-- IDLE --
		---------- Envio 00010000 paridad 1 -------------
		GRecibo <= '1';
      wait for 0.10416 ms;
		GRecibo <= '1';
      wait for 0.10416 ms;
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE INICIO --
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- BIT Numero 1 --		
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 2
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 3
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 4
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- 5
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 6
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 7
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- 8
		GRecibo <= '0';
      wait for 0.10416 ms;
		-- BIT DE PARIDAD --
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		GRecibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		GRecibo <= '1';
      wait for 0.10416 ms;
		GRecibo <= '1';
		wait for 300 ms;
		BotonSiguiente <= '0';
		wait;
   end process;

END;
