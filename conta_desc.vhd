library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Conta_DES is
	port (CLK2, RST, EN: in std_logic;
			Conta_Des: out std_logic_vector(9 downto 0)
			);
end Conta_DES;

architecture bhv_conta of Conta_DES is
	signal temp : std_logic_vector(9 downto 0):= "1111110010";

	begin
	Conta_Des <= temp;
		process(CLK2, RST, EN)
			begin
				if RST = '0' then 
					temp <= "1111110010";
				elsif rising_edge(CLK2) then
					if EN = '1' then
						if temp /= "0000000000" then
						temp <= temp - 1;
						end if;	
					end if;
				end if;
			end process;
end bhv_conta;

