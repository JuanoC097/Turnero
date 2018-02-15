library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiplexor is
	port(
			MIn0 : in  STD_LOGIC_VECTOR(3 downto 0);
			MIn1 : in  STD_LOGIC_VECTOR(3 downto 0);
			MIn2 : in  STD_LOGIC_VECTOR(3 downto 0);
			MIn3 : in  STD_LOGIC_VECTOR(3 downto 0);
			MStade : in STD_LOGIC_VECTOR(3 downto 0);
			MOutput : out STD_LOGIC_VECTOR(3 downto 0)
		);
end Multiplexor;

architecture arq_Multiplexor of Multiplexor is

begin
	process(MIn0,MIn1,MIn2,MIn3,MStade)
	begin
		case(MStade) is
			when "0001" => MOutput <= MIn0;
			when "0010" => MOutput <= MIn1;
			when "0100" => MOutput <= MIn2;
			when "1000" => MOutput <= MIn3;
			when others => MOutput <= "0000";
		end case;
	end process;
end arq_Multiplexor;

