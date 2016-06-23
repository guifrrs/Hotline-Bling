library IEEE;
use IEEE.std_logic_1164.all;

entity Comparador is
	port( TESTE_PASS: in std_logic;
			SEQ_3, SEQ_2, SEQ_1, SEQ_0: in std_logic_vector(4 downto 0);
			PASS_CERTO: out std_logic
		);
end Comparador;

architecture bhv_comp of Comparador is
signal saida: std_logic;
	begin
		process(SEQ_3, SEQ_2, SEQ_1, SEQ_0)
			begin
				if(SEQ_3 = "0000") then
					if(SEQ_2 = "0111") then
						if(SEQ_1 = "0010") then
							if(SEQ_0 = "0010") then
								saida <= '1';
							else 
								saida <= '0';
							end if;
						else
							saida <= '0';
						end if;
					else
						saida <= '0';
					end if;
				else
					saida <= '0';
				end if;
				PASS_CERTO <= saida and TESTE_PASS;				
			end process;
end bhv_comp;