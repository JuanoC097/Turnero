library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Utilidad7Segmentos is
	Port(
		clk : in STD_LOGIC;
		UIn0 : in STD_LOGIC_VECTOR(1 downto 0);
		UIn1 : in STD_LOGIC_VECTOR(3 downto 0);
		UOut0 : out STD_LOGIC_VECTOR(3 downto 0);
		UOut1 : out STD_LOGIC_VECTOR(7 downto 0)
	);
end Utilidad7Segmentos;

architecture arq_Utilidad7Segmentos of Utilidad7Segmentos is
	component Mux1a4
		Port(
			MSelect : in STD_LOGIC_VECTOR(1 downto 0);
			MInput : in STD_LOGIC_VECTOR(3 downto 0);
			MOutput0 : out STD_LOGIC_VECTOR(3 downto 0);
			MOutput1 : out STD_LOGIC_VECTOR(3 downto 0);
			MOutput2 : out STD_LOGIC_VECTOR(3 downto 0);
			MOutput3 : out STD_LOGIC_VECTOR(3 downto 0)
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
	
	signal Conex0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal Conex1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal Conex2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal Conex3 : STD_LOGIC_VECTOR(3 DOWNTO 0);

begin
	Multiplexor1 : Mux1a4
	Port map(
		MSelect => UIn0,
		MInput => UIn1,
		MOutput0 => Conex0,
		MOutput1 => Conex1,
		MOutput2 => Conex2,
		MOutput3 => Conex3
	);
	
	SieteSegmentos1 : SieteSegmentos
	Port map(
		clk => clk,
		in0 => Conex0,
		in1 => Conex1,
		in2 => Conex2,
		in3 => Conex3,
		out0 => UOut0,
		out1 => UOut1
	);

end arq_Utilidad7Segmentos;

