library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Antirrebote is
    Port ( clk  : in  STD_LOGIC;
           inp  : in  STD_LOGIC;
           outp : out STD_LOGIC);
end Antirrebote;

architecture arq_Antirrebote of Antirrebote is

signal state : STD_LOGIC_VECTOR(1 downto 0) := "00";--señal de estado para reconocer el cambio
constant repeticion : integer := 10500000;--valor inicial del contador, recordar que desde 0 es 20ns y por cada +1 es +20ns de espera o duración
-- recordar que 10000000 es 200ms y 500000 es 10ms (caso de seguridad de comprobación de pulso real)
shared variable contador : integer := repeticion;--Control de la relación entre variables
--00 sin haber cambio
--10 estado en que resultó cambio (contando)
--11 señal aceptada (envio)
--Comportamenta
begin
   process begin
      wait until rising_edge(clk);--determina usar o pasar por este proces unicamente en cada ciclo de reloj
		case(state) is
			when "00" =>
				if (inp='1') then
					contador := contador - 1;--avance de contador
					if(contador<=10000000) then
						state<="11";
					end if;
				else
					contador := repeticion;--reinicia control de contador
				end if;
			when "11" =>
				state<="10";
				contador := contador - 1;--avance de contador
			when "10" =>
				if(contador>0) then
					contador := contador - 1;--avance de contador
				else
					state<="00";
					contador := repeticion;--reinicia control de contador
				end if;
		--end wait until
			when others => null;
		end case;
   end process;
outp <= state(0);
end arq_Antirrebote;
