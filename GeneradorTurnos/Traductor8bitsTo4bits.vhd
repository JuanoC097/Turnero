library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Traductor8bitsTo4bits is
    Port ( Tinp : in  STD_LOGIC_VECTOR (7 downto 0);
           Toutp0 : out  STD_LOGIC_VECTOR (3 downto 0);
           Toutp1 : out  STD_LOGIC_VECTOR (3 downto 0));
end Traductor8bitsTo4bits;

architecture arq_Traductor8bitsTo4bits of Traductor8bitsTo4bits is

begin
process(Tinp) begin
	case(Tinp) is
		when "00000000" => -- 00
			Toutp0 <= "0000";
			Toutp1 <= "0000";
		when "00000001" => -- 01
			Toutp0 <= "0001";
			Toutp1 <= "0000";
		when "00000010" => -- 02
			Toutp0 <= "0010";
			Toutp1 <= "0000";
		when "00000011" => -- 03
			Toutp0 <= "0011";
			Toutp1 <= "0000";
		when "00000100" => -- 04
			Toutp0 <= "0100";
			Toutp1 <= "0000";
		when "00000101" => -- 05
			Toutp0 <= "0101";
			Toutp1 <= "0000";
		when "00000110" => -- 06
			Toutp0 <= "0110";
			Toutp1 <= "0000";
		when "00000111" => -- 07
			Toutp0 <= "0111";
			Toutp1 <= "0000";
		when "00001000" => -- 08
			Toutp0 <= "1000";
			Toutp1 <= "0000";
		when "00001001" => -- 09
			Toutp0 <= "1001";
			Toutp1 <= "0000";
		when "00001010" => -- 10
			Toutp0 <= "0000";
			Toutp1 <= "0001";
		when "00001011" => -- 11
			Toutp0 <= "0001";
			Toutp1 <= "0001";
		when "00001100" => -- 12
			Toutp0 <= "0010";
			Toutp1 <= "0001";
		when "00001101" => -- 13
			Toutp0 <= "0011";
			Toutp1 <= "0001";
		when "00001110" => -- 14
			Toutp0 <= "0100";
			Toutp1 <= "0001";
		when "00001111" => -- 15
			Toutp0 <= "0101";
			Toutp1 <= "0001";
		when "00010000" => -- 16
			Toutp0 <= "0110";
			Toutp1 <= "0001";
		when "00010001" => -- 17
			Toutp0 <= "0111";
			Toutp1 <= "0001";
		when "00010010" => -- 18
			Toutp0 <= "1000";
			Toutp1 <= "0001";
		when "00010011" => -- 19
			Toutp0 <= "1001";
			Toutp1 <= "0001";
		when "00010100" => -- 20
			Toutp0 <= "0000";
			Toutp1 <= "0010";
		when "00010101" => -- 21
			Toutp0 <= "0001";
			Toutp1 <= "0010";
		when "00010110" => -- 22
			Toutp0 <= "0010";
			Toutp1 <= "0010";
		when "00010111" => -- 23
			Toutp0 <= "0011";
			Toutp1 <= "0010";
		when "00011000" => -- 24
			Toutp0 <= "0100";
			Toutp1 <= "0010";
		when "00011001" => -- 25
			Toutp0 <= "0101";
			Toutp1 <= "0010";
		when "00011010" => -- 26
			Toutp0 <= "0110";
			Toutp1 <= "0010";
		when "00011011" => -- 27
			Toutp0 <= "0111";
			Toutp1 <= "0010";
		when "00011100" => -- 28
			Toutp0 <= "1000";
			Toutp1 <= "0010";
		when "00011101" => -- 29
			Toutp0 <= "1001";
			Toutp1 <= "0010";
		when "00011110" => -- 30
			Toutp0 <= "0000";
			Toutp1 <= "0011";
		when "00011111" => -- 31
			Toutp0 <= "0001";
			Toutp1 <= "0011";
		when "00100000" => -- 32
			Toutp0 <= "0010";
			Toutp1 <= "0011";
		when "00100001" => -- 33
			Toutp0 <= "0011";
			Toutp1 <= "0011";
		when "00100010" => -- 34
			Toutp0 <= "0100";
			Toutp1 <= "0011";
		when "00100011" => -- 35
			Toutp0 <= "0101";
			Toutp1 <= "0011";
		when "00100100" => -- 36
			Toutp0 <= "0110";
			Toutp1 <= "0011";
		when "00100101" => -- 37
			Toutp0 <= "0111";
			Toutp1 <= "0011";
		when "00100110" => -- 38
			Toutp0 <= "1000";
			Toutp1 <= "0011";
		when "00100111" => -- 39
			Toutp0 <= "1001";
			Toutp1 <= "0011";
		when "00101000" => -- 40
			Toutp0 <= "0000";
			Toutp1 <= "0100";
		when "00101001" => -- 41
			Toutp0 <= "0001";
			Toutp1 <= "0100";
		when "00101010" => -- 42
			Toutp0 <= "0010";
			Toutp1 <= "0100";
		when "00101011" => -- 43
			Toutp0 <= "0011";
			Toutp1 <= "0100";
		when "00101100" => -- 44
			Toutp0 <= "0100";
			Toutp1 <= "0100";
		when "00101101" => -- 45
			Toutp0 <= "0101";
			Toutp1 <= "0100";
		when "00101110" => -- 46
			Toutp0 <= "0110";
			Toutp1 <= "0100";
		when "00101111" => -- 47
			Toutp0 <= "0111";
			Toutp1 <= "0100";
		when "00110000" => -- 48
			Toutp0 <= "1000";
			Toutp1 <= "0100";
		when "00110001" => -- 49
			Toutp0 <= "1001";
			Toutp1 <= "0100";
		when "00110010" => -- 50
			Toutp0 <= "0000";
			Toutp1 <= "0101";
		when "00110011" => -- 51
			Toutp0 <= "0001";
			Toutp1 <= "0101";
		when "00110100" => -- 52
			Toutp0 <= "0010";
			Toutp1 <= "0101";
		when "00110101" => -- 53
			Toutp0 <= "0011";
			Toutp1 <= "0101";
		when "00110110" => -- 54
			Toutp0 <= "0100";
			Toutp1 <= "0101";
		when "00110111" => -- 55
			Toutp0 <= "0101";
			Toutp1 <= "0101";
		when "00111000" => -- 56
			Toutp0 <= "0110";
			Toutp1 <= "0101";
		when "00111001" => -- 57
			Toutp0 <= "0111";
			Toutp1 <= "0101";
		when "00111010" => -- 58
			Toutp0 <= "1000";
			Toutp1 <= "0101";
		when "00111011" => -- 59
			Toutp0 <= "1001";
			Toutp1 <= "0101";
		when "00111100" => -- 60
			Toutp0 <= "0000";
			Toutp1 <= "0110";
		when "00111101" => -- 61
			Toutp0 <= "0001";
			Toutp1 <= "0110";
		when "00111110" => -- 62
			Toutp0 <= "0010";
			Toutp1 <= "0110";
		when "00111111" => -- 63
			Toutp0 <= "0011";
			Toutp1 <= "0110";
		when "01000000" => -- 64
			Toutp0 <= "0100";
			Toutp1 <= "0110";
		when "01000001" => -- 65
			Toutp0 <= "0101";
			Toutp1 <= "0110";
		when "01000010" => -- 66
			Toutp0 <= "0110";
			Toutp1 <= "0110";
		when "01000011" => -- 67
			Toutp0 <= "0111";
			Toutp1 <= "0110";
		when "01000100" => -- 68
			Toutp0 <= "1000";
			Toutp1 <= "0110";
		when "01000101" => -- 69
			Toutp0 <= "1001";
			Toutp1 <= "0110";
		when "01000110" => -- 70
			Toutp0 <= "0000";
			Toutp1 <= "0111";
		when "01000111" => -- 71
			Toutp0 <= "0001";
			Toutp1 <= "0111";
		when "01001000" => -- 72
			Toutp0 <= "0010";
			Toutp1 <= "0111";
		when "01001001" => -- 73
			Toutp0 <= "0011";
			Toutp1 <= "0111";
		when "01001010" => -- 74
			Toutp0 <= "0100";
			Toutp1 <= "0111";
		when "01001011" => -- 75
			Toutp0 <= "0101";
			Toutp1 <= "0111";
		when "01001100" => -- 76
			Toutp0 <= "0110";
			Toutp1 <= "0111";
		when "01001101" => -- 77
			Toutp0 <= "0111";
			Toutp1 <= "0111";
		when "01001110" => -- 78
			Toutp0 <= "1000";
			Toutp1 <= "0111";
		when "01001111" => -- 79
			Toutp0 <= "1001";
			Toutp1 <= "0111";
		when "01010000" => -- 80
			Toutp0 <= "0000";
			Toutp1 <= "1000";
		when "01010001" => -- 81
			Toutp0 <= "0001";
			Toutp1 <= "1000";
		when "01010010" => -- 82
			Toutp0 <= "0010";
			Toutp1 <= "1000";
		when "01010011" => -- 83
			Toutp0 <= "0011";
			Toutp1 <= "1000";
		when "01010100" => -- 84
			Toutp0 <= "0100";
			Toutp1 <= "1000";
		when "01010101" => -- 85
			Toutp0 <= "0101";
			Toutp1 <= "1000";
		when "01010110" => -- 86
			Toutp0 <= "0110";
			Toutp1 <= "1000";
		when "01010111" => -- 87
			Toutp0 <= "0111";
			Toutp1 <= "1000";
		when "01011000" => -- 88
			Toutp0 <= "1000";
			Toutp1 <= "1000";
		when "01011001" => -- 89
			Toutp0 <= "1001";
			Toutp1 <= "1000";
		when "01011010" => -- 90
			Toutp0 <= "0000";
			Toutp1 <= "1000";
		when "01011011" => -- 91
			Toutp0 <= "0001";
			Toutp1 <= "1000";
		when "01011100" => -- 92
			Toutp0 <= "0010";
			Toutp1 <= "1000";
		when "01011101" => -- 93
			Toutp0 <= "0011";
			Toutp1 <= "1000";
		when "01011110" => -- 94
			Toutp0 <= "0100";
			Toutp1 <= "1000";
		when "01011111" => -- 95
			Toutp0 <= "0101";
			Toutp1 <= "1000";
		when "01100000" => -- 96
			Toutp0 <= "0110";
			Toutp1 <= "1000";
		when "01100001" => -- 97
			Toutp0 <= "0111";
			Toutp1 <= "1000";
		when "01100010" => -- 98
			Toutp0 <= "1000";
			Toutp1 <= "1000";
		when "01100011" => -- 99
			Toutp0 <= "1001";
			Toutp1 <= "1000";
		when others =>
			Toutp0 <= "1110";
			Toutp1 <= "1110";
	end case;
end process;
end arq_Traductor8bitsTo4bits;

