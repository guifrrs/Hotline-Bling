library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Conta_Desc is
	port (CLK2, RST, EN: in std_logic; -- Recebe o clock (4 Hz) gerado pela fsm_clk desse bloco. O enable corresponde ao Sel_Led da fsm.
			Conta_Desc: out std_logic_vector(9 downto 0)
			);
end Conta_Desc;

architecture bhv_conta of Conta_Desc is
	signal temp : std_logic_vector(9 downto 0);

	begin
	Conta_Desc <= temp;
		process(CLK2, RST, EN)
			begin
				if RST = '0' then 
					temp <= "1111110010";      -- Lógica responsável pela contagem descendente (1010 a 0).
				elsif rising_edge(CLK2) then
					if EN = '1' then
						if temp > "0000000000" then
							temp <= temp - 1;
						end if;
					end if;
				end if;
			end process;
end bhv_conta;