library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Turnero is
    Port ( clk : in  STD_LOGIC;	-- Entrada de Reloj
           Envio : out  STD_LOGIC;	-- Salida de informacion o transmisor
			  -- Protocolo RS232 con los siguientes parametros
			  -- 8 bits de informacion
			  -- 1 bit de paridad PAR con 0 es par (activo bajo)
			  -- 2 bits de finalizacion
           Recibo : in  STD_LOGIC;	-- Recepcion de informacion o Receptor (Protocolo RS232)
			  BotonSiguiente : in STD_LOGIC;	-- Boton de la FPGA para pedir nuevos turnos
			  BotonAnterior : in STD_LOGIC;	-- Boton de la FPGA para devolver turnos
			  SwitchEncendido : in STD_LOGIC;	-- Switch de la FPGA para desactivar los botones
			  -- Con 1 esta los botos estan desactivos y con 0 estan activos
			  
			  -- prueba : out STD_LOGIC;
			  
			  Salida7Segmentos4bits : out STD_LOGIC_VECTOR(3 downto 0) := "1111";	-- Conecta al 7Seg 4bits
			  Salida7Segmentos8bits : out STD_LOGIC_VECTOR(7 downto 0) := "11111111"	-- Conecta al 7Seg 8bits
			  );
end Turnero;

architecture arq_Turnero of Turnero is

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

component Traductor8bitsTo4bits
    Port ( Tinp : in  STD_LOGIC_VECTOR (7 downto 0);
           Toutp0 : out  STD_LOGIC_VECTOR (3 downto 0);
           Toutp1 : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal AuxBotonS : STD_LOGIC := '0';
signal AuxBotonA : STD_LOGIC := '0';

signal Conex0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
signal Conex1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
signal Conex3 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

signal Activador_Enviado : std_logic;
signal Mensaje_Enviado : std_logic_vector(7 downto 0) := "00000000";

signal Activador_Recibido : std_logic;
signal Mensaje_Recibido : std_logic_vector(7 downto 0) := "00000000";

signal AuxMensaje_Recibido : std_logic_vector(7 downto 0) := "00000000";

signal AuxConfirmado_Envio : std_logic;

begin
RS232_1 : RS232
	Port map( clk => clk,
				-- Trasmisor --
           Entrada_8bits => Mensaje_Enviado,
           Activador_Envio_Mensaje => Activador_Enviado,
           Salida_1bit => Envio,
			  Confirmado_Envio => AuxConfirmado_Envio,
				-- Receptor --
           Entrada_1bit => Recibo,
           Mensaje_8bits => Mensaje_Recibido,
           Activador_Entrega_Mensaje => Activador_Recibido
	);

	SieteSegmentos1 : SieteSegmentos
	Port map(
		clk => clk,
		in0 => Conex0,
		in1 => Conex1,
		in2 => "0000",
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
	
	Antirrebote2 : Antirrebote
	Port map(
		clk => clk,
		inp => BotonAnterior,
		outp => AuxBotonA
	);
	
	Traductor8bitsTo4bits1 : Traductor8bitsTo4bits
	Port map(
		Tinp => AuxMensaje_Recibido,
		Toutp0 => Conex0,
		Toutp1 => Conex1
	);

process(AuxConfirmado_Envio,SwitchEncendido,Activador_Recibido,Mensaje_Recibido,AuxBotonS,AuxBotonA,Conex3,Mensaje_Enviado,AuxMensaje_Recibido)
begin
	-- prueba <= AuxConfirmado_Envio;
	if AuxConfirmado_Envio = '1' then
		Activador_Enviado <= '0';
	end if;
	if false then--SwitchEncendido = '1' then
		Conex3 <= "1101";
	else
		Conex3 <= "0000";
		if(Activador_Recibido = '1') then
			AuxMensaje_Recibido <= Mensaje_Recibido;
		end if;
		
		if(AuxBotonS = '1' and AuxBotonA = '0') then
			if AuxConfirmado_Envio = '0' then
				Mensaje_Enviado <= "10000000";
				Activador_Enviado <= '1';
			end if;
		end if;
		
		if(AuxBotonS = '0' and AuxBotonA = '1') then
			if AuxConfirmado_Envio = '0' then
				Mensaje_Enviado <= "01000000";
				Activador_Enviado <= '1';
			end if;
		end if;
	end if;
end process;
end arq_Turnero;
