library IEEE;
use IEEE.std_logic_1164.all;

entity Comparador_Senha is
	port	(SEQ_3, SEQ_2, SEQ_1, SEQ_0: in std_logic_vector(4 downto 0);
				Password: in std_logic_vector(19 downto 0);
				Saida: out std_logic
				);
end Comparador_Senha;

architecture bhv_comp of Comparador_Senha is

	signal S: std_logic;
	signal Pass: std_logic_vector(19 downto 0) := "00000000000000000000";
	begin
		process(SEQ_3, SEQ_2, SEQ_1, SEQ_0)
			begin
				if(SEQ_3 = Password(19 downto 15)) then
					if(SEQ_2 = Password(14 downto 10)) then
						if(SEQ_1 = Password(9 downto 5)) then
							if(SEQ_0 = Password(4 downto 0)) then
								Saida <= '1';
							else
								Saida <= '0';
							end if;
						else
							Saida <= '0';
						end if;
					else
						Saida <= '0';
					end if;
				else
					Saida <= '0';
				end if;
		end process;
end bhv_comp;
