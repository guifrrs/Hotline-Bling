library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Conta_Asc is 
		port(CLK1, RST_CONT: in std_logic;                  -- Recebe o clock (1 Hz) gerado pela fsm_clk desse bloco, e o reset oriundo da lógica Comb.
			CONTA_ASC: out std_logic_vector(19 downto 0));
end Conta_Asc;

architecture Contasc_bhv of Conta_Asc is
	signal seg1: std_logic_vector(4 downto 0) := "00000";
	signal seg2: std_logic_vector(4 downto 0):= "00000";   -- Sinais necessários para que a lógica funcione.
	signal min1: std_logic_vector(4 downto 0):= "00000";
	signal min2: std_logic_vector(4 downto 0):= "00000";
	
begin
	CONTA_ASC <= min2 & min1 & seg2 & seg1;
	process(CLK1, RST_CONT)
		begin
			if RST_CONT = '0' then -- Reset recebido do componente Comb.
				seg1 <= "00000";
				seg2 <= "00000";
				min1 <= "00000";
				min2 <= "00000";
			elsif rising_edge(CLK1) then
				seg1 <= seg1 + 1;
				if seg1 = "01001" then
					seg1 <= "00000";             -- Lógica responsável por contar os segundos e fazer atribuições necessárias, de forma que a contagem ocorra de forma correta nos displays.
					seg2 <= seg2 + 1;
					if seg2 = "00101" then
						seg2 <= "00000";
						min1 <= min1 + 1;
						if min1 = "01001" then
							min1 <= "00000";
							min2 <= min2 + 1;
								if min2 = "00101" then
									min2 <= "00000";
								end if;
						end if;
					end if;
				end if;
			end if;
		end process;
end Contasc_bhv;