library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux1a4 is
	Port(
		MSelect : in STD_LOGIC_VECTOR(1 downto 0);
		MInput : in STD_LOGIC_VECTOR(3 downto 0);
		MOutput0 : out STD_LOGIC_VECTOR(3 downto 0);
		MOutput1 : out STD_LOGIC_VECTOR(3 downto 0);
		MOutput2 : out STD_LOGIC_VECTOR(3 downto 0);
		MOutput3 : out STD_LOGIC_VECTOR(3 downto 0)
		);
end Mux1a4;

architecture arq_Mux1a4 of Mux1a4 is
begin
	process(MSelect,MInput)
	begin
		case(MSelect) is
			when "00" =>
				MOutput0 <= MInput;
				MOutput1 <= "0000";
				MOutput2 <= "0000";
				MOutput3 <= "0000";
			when "01" =>
				MOutput0 <= "0000";
				MOutput1 <= MInput;
				MOutput2 <= "0000";
				MOutput3 <= "0000";
			when "10" =>
				MOutput0 <= "0000";
				MOutput1 <= "0000";
				MOutput2 <= MInput;
				MOutput3 <= "0000";
			when others =>
				MOutput0 <= "0000";
				MOutput1 <= "0000";
				MOutput2 <= "0000";
				MOutput3 <= MInput;
		end case;
	end process;
end arq_Mux1a4;

