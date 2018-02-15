library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Decodificador is
	port(
		input  : in  STD_LOGIC_VECTOR(3 downto 0);
		output  : out  STD_LOGIC_VECTOR(7 downto 0)
		);
end Decodificador;

architecture arq_Decodificador of Decodificador is

begin
	process(input)
	begin
		case(input) is
			when "0000" => output <= "00000011";
			when "0001" => output <= "10011111";
			when "0010" => output <= "00100101";
			when "0011" => output <= "00001101";
			when "0100" => output <= "10011001";
			when "0101" => output <= "01001001";
			when "0110" => output <= "01000001";
			when "0111" => output <= "00011101";
			when "1000" => output <= "00000001";
			when "1001" => output <= "00011001";
			when "1010" => output <= "00010001";
			when "1011" => output <= "11000001";
			when "1100" => output <= "01100011";
			when "1101" => output <= "10000101";
			when "1110" => output <= "01100001";
			when others => output <= "01110001";
		end case;
	end process;
end arq_Decodificador;

