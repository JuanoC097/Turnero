library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GeneradorTurnos is
    Port ( clk : in  STD_LOGIC;
			  BotonSiguiente : in  STD_LOGIC;
           GRecibo : in  STD_LOGIC;
			  Salida7Segmentos4bits : out STD_LOGIC;
			  Salida7Segmentos8bits : out STD_LOGIC;
           GEnvio : out  STD_LOGIC);
end GeneradorTurnos;

architecture arq_GeneradorTurnos of GeneradorTurnos is

component RS232
	Port ( clk : in  STD_LOGIC;
				-- Trasmisor --
           Entrada_8bits : in  STD_LOGIC_VECTOR (7 downto 0);
           Activador_Envio_Mensaje : in  STD_LOGIC;
           Salida_1bit : out  STD_LOGIC;
			  Confirmado_Envio : out STD_LOGIC;
				-- Receptor --
           Entrada_1bit : in  STD_LOGIC;
           Mensaje_8bits : out  STD_LOGIC_VECTOR (7 downto 0);
           Activador_Entrega_Mensaje : out  STD_LOGIC
	);
end component;

component SieteSegmentos
		Port(
			clk  : in  STD_LOGIC;
			in0  : in  STD_LOGIC_VECTOR(3 downto 0);
			in1  : in  STD_LOGIC_VECTOR(3 downto 0);
			in2  : in  STD_LOGIC_VECTOR(3 downto 0);
			in3  : in  STD_LOGIC_VECTOR(3 downto 0);
			out0 : out  STD_LOGIC_VECTOR(3 downto 0);
			out1 : out  STD_LOGIC_VECTOR(7 downto 0)
		);
end component;

component Antirrebote
    Port ( clk  : in  STD_LOGIC;
           inp  : in  STD_LOGIC;
           outp : out STD_LOGIC);
end component;

signal Activador_Enviado : STD_LOGIC := '0';
signal AuxConfirmado_Envio : STD_LOGIC := '0';

signal Mensaje_Recibido : STD_LOGIC_VECTOR(7 downto 0);
signal Activador_Recibido : STD_LOGIC := '0';

signal Conex0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
signal Conex1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
signal Conex3 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
signal Conex4 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

signal AuxBotonS : STD_LOGIC := '0';

shared variable contador : integer := 0;

begin

RS232_1 : RS232
	Port map( clk => clk,
				-- Trasmisor --
           Entrada_8bits => "10000000",
           Activador_Envio_Mensaje => Activador_Enviado,
           Salida_1bit => GEnvio,
			  Confirmado_Envio => AuxConfirmado_Envio,
				-- Receptor --
           Entrada_1bit => GRecibo,
           Mensaje_8bits => Mensaje_Recibido,
           Activador_Entrega_Mensaje => Activador_Recibido
	);

	SieteSegmentos1 : SieteSegmentos
	Port map(
		clk => clk,
		in0 => Conex0,
		in1 => Conex1,
		in2 => Conex2,
		in3 => Conex3,
		out0 => Salida7Segmentos4bits,
		out1 => Salida7Segmentos8bits
	);
	
	Antirrebote1 : Antirrebote
	Port map(
		clk => clk,
		inp => BotonSiguiente,
		outp => AuxBotonS
	);
process(AuxConfirmado_Envio) begin
	if AuxConfirmado_Envio = '1' then
		Activador_Enviado <= '0';
	end if;
	if AuxBotonS = '1' then
		Activador_Enviado <= '1';
	end if;
end process;
end arq_GeneradorTurnos;

