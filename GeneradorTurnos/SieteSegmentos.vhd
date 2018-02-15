library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SieteSegmentos is
    Port ( clk  : in  STD_LOGIC;
           in0  : in  STD_LOGIC_VECTOR(3 downto 0);
			  in1  : in  STD_LOGIC_VECTOR(3 downto 0);
			  in2  : in  STD_LOGIC_VECTOR(3 downto 0);
			  in3  : in  STD_LOGIC_VECTOR(3 downto 0);
           out0 : out  STD_LOGIC_VECTOR(3 downto 0) := "1111";
			  out1 : out  STD_LOGIC_VECTOR(7 downto 0) := "11111111"
			  );
end SieteSegmentos;

architecture arq_SieteSegmentos of SieteSegmentos is

	component Decodificador
		port (
			input : in  STD_LOGIC_VECTOR(3 downto 0);
			output : out  STD_LOGIC_VECTOR(7 downto 0)
			);
	end component;
	
	component Multiplexor
		port (
			MIn0  : in  STD_LOGIC_VECTOR(3 downto 0);
			MIn1  : in  STD_LOGIC_VECTOR(3 downto 0);
			MIn2  : in  STD_LOGIC_VECTOR(3 downto 0);
			MIn3  : in  STD_LOGIC_VECTOR(3 downto 0);
			MStade	: in STD_LOGIC_VECTOR(3 downto 0);
			MOutput : out STD_LOGIC_VECTOR(3 downto 0)
		);
	end component;

	signal Anodo : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
	signal InDecodificador : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	constant repeticion : integer := 200000;
	shared variable contador : integer := repeticion;

begin
	Multiplexor1 : Multiplexor
	port map (
		MIn0 => in0,
		MIn1 => in1,
		MIn2 => in2,
		MIn3 => in3,
		MStade => Anodo,
		MOutput => InDecodificador
	);
	
	Decodificador1 : Decodificador
	port map (
		input => InDecodificador,
		output => out1
	);
	
   process
	begin
      wait until rising_edge(clk);
		case(Anodo) is
			when "1000" =>
				if (contador <= 1) then
					contador := repeticion;
					Anodo <= "0100";
				else
					contador := contador - 1;
				end if;
					
			when "0100" =>
				if (contador <= 1) then
					contador := repeticion;
					Anodo <= "0010";
				else
					contador := contador - 1;
				end if;
					
			when "0010" =>
				if (contador <= 1) then
					contador := repeticion;
					Anodo <= "0001";
				else
					contador := contador - 1;
				end if;
					
			when others =>
				if (contador <= 1) then
					contador := repeticion;
					Anodo <= "1000";
				else
					contador := contador - 1;
				end if;
		end case;
		
		out0 <= not Anodo;
		
	end process;
end arq_SieteSegmentos;

