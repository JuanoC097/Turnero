LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Turnero IS
END TB_Turnero;
 
ARCHITECTURE behavior OF TB_Turnero IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Turnero
    PORT(
         clk : IN  std_logic;
         Envio : OUT  std_logic;
         Recibo : IN  std_logic;
         BotonSiguiente : IN  std_logic;
         BotonAnterior : IN  std_logic;
         SwitchEncendido : IN  std_logic;
			
			-- prueba : out STD_LOGIC;
			
         Salida7Segmentos4bits : OUT  std_logic_vector(3 downto 0);
         Salida7Segmentos8bits : OUT  std_logic_vector(7 downto 0)			
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Recibo : std_logic := '0';
   signal BotonSiguiente : std_logic := '0';
   signal BotonAnterior : std_logic := '0';
   signal SwitchEncendido : std_logic := '0';

 	--Outputs
   signal Envio : std_logic;
   signal Salida7Segmentos4bits : std_logic_vector(3 downto 0);
   signal Salida7Segmentos8bits : std_logic_vector(7 downto 0);
	-- signal prueba : STD_LOGIC;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Turnero PORT MAP (
          clk => clk,
          Envio => Envio,
          Recibo => Recibo,
          BotonSiguiente => BotonSiguiente,
          BotonAnterior => BotonAnterior,
          SwitchEncendido => SwitchEncendido,
			 
			 -- prueba => prueba,
			 
          Salida7Segmentos4bits => Salida7Segmentos4bits,
          Salida7Segmentos8bits => Salida7Segmentos8bits
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
      -- hold reset state for 100 ns.
		Recibo <= '1';
		BotonSiguiente <= '1';
		BotonAnterior <= '0';
		SwitchEncendido <= '1';
      wait for 2 ms;
		BotonSiguiente <= '1';
		BotonAnterior <= '1';
		wait for 10 ms;
		SwitchEncendido <= '0';
		wait for 32 ms;
		BotonSiguiente <= '1';
		BotonAnterior <= '0';
		wait for 200 ms;
		BotonSiguiente <= '1';
      wait for 10 ms;
		-- IDLE --
		---------- Envio 000001000 paridad 1 -------------
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE INICIO --
		Recibo <= '0';
      wait for 0.10416 ms;
		-- BIT Numero 1 --
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 2
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 3
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 4
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 5
		Recibo <= '1';
      wait for 0.10416 ms;
		-- 6
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 7
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 8
		Recibo <= '0';
      wait for 0.10416 ms;
		-- BIT DE PARIDAD --
		Recibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Recibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Recibo <= '1';
      wait for 40 ms;
		
		-- IDLE --
		---------- Envio 11111111 paridad 0 -------------
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE INICIO --
		Recibo <= '0';
      wait for 0.10416 ms;
		-- BIT Numero 1 --		
		Recibo <= '1';
      wait for 0.10416 ms;
		-- 2
		Recibo <= '1';
      wait for 0.10416 ms;
		-- 3
		Recibo <= '1';
      wait for 0.10416 ms;
		-- 4
		Recibo <= '1';
      wait for 0.10416 ms;
		-- 5
		Recibo <= '1';
      wait for 0.10416 ms;
		-- 6
		Recibo <= '1';
      wait for 0.10416 ms;
		-- 7
		Recibo <= '1';
      wait for 0.10416 ms;
		-- 8
		Recibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE PARIDAD --
		Recibo <= '0';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Recibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
		wait for 40 ms;
		
		-- IDLE --
		---------- Envio 00010000 paridad 1 -------------
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE INICIO --
		Recibo <= '0';
      wait for 0.10416 ms;
		-- BIT Numero 1 --		
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 2
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 3
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 4
		Recibo <= '1';
      wait for 0.10416 ms;
		-- 5
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 6
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 7
		Recibo <= '0';
      wait for 0.10416 ms;
		-- 8
		Recibo <= '0';
      wait for 0.10416 ms;
		-- BIT DE PARIDAD --
		Recibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Recibo <= '1';
      wait for 0.10416 ms;
		-- BIT DE FINALIZACION --
		Recibo <= '1';
      wait for 0.10416 ms;
		Recibo <= '1';
		wait for 40 ms;
		wait;
   end process;

END;
