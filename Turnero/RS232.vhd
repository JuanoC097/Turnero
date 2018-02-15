library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS232 is
    Port ( clk : in  STD_LOGIC;
				-- Trasmisor --
           Entrada_8bits : in  STD_LOGIC_VECTOR (7 downto 0);
           Activador_Envio_Mensaje : in  STD_LOGIC;
           Salida_1bit : out  STD_LOGIC := '1';
			  Confirmado_Envio : out STD_LOGIC := '0';
				-- Receptor --
           Entrada_1bit : in  STD_LOGIC;
           Mensaje_8bits : out  STD_LOGIC_VECTOR (7 downto 0) := "00000000";
           Activador_Entrega_Mensaje : out  STD_LOGIC := '0');
end RS232;

architecture arq_RS232 of RS232 is

component Divisor_Frecuencia
	Port(
		clk : in  STD_LOGIC;
      Salida : out  STD_LOGIC
			);
end component;

component Reception_8bits
	Port(
		Divisor_Frecuencia : in  STD_LOGIC;
      Entrada : in  STD_LOGIC;
      Mensaje : out  STD_LOGIC_VECTOR (7 downto 0);
      Confirmado : out  STD_LOGIC
		);
end component;

component Transmission_8bits
	Port(
		Divisor_Frecuencia : in  STD_LOGIC;
      Entrada : in  STD_LOGIC_VECTOR (7 downto 0);
      Activo : in  STD_LOGIC;
      Salida : out  STD_LOGIC;
		TConfirmado_Envio : out STD_LOGIC
		);
end component;

signal Divisor_FrecuenciaAUX : std_logic := '1';

begin

Divisor_Frecuencia1 : Divisor_Frecuencia
	Port map(
		clk => clk,
      Salida => Divisor_FrecuenciaAUX
	);

Reception_8bits1 : Reception_8bits
	Port map(
		Divisor_Frecuencia => Divisor_FrecuenciaAUX,
      Entrada => Entrada_1bit,
      Mensaje => Mensaje_8bits,
      Confirmado => Activador_Entrega_Mensaje
	);

Transmission_8bits1 : Transmission_8bits
	Port map(
		Divisor_Frecuencia => Divisor_FrecuenciaAUX,
      Entrada => Entrada_8bits,
      Activo => Activador_Envio_Mensaje,
      Salida => Salida_1bit,
		TConfirmado_Envio => Confirmado_Envio
	);

end arq_RS232;

