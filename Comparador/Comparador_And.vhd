library ieee;
use ieee.std_logic_1164.all;

entity Comparador_And is
	port (Data: in std_logic;
			Teste_Pass: in std_logic;
			Pass_Certo: out std_logic
			);
end Comparador_And;

architecture bhv_compAnd of Comparador_And is
	begin
		process(Teste_Pass)
		begin
			if(Teste_Pass = '1') then
				Pass_Certo <= Data;
			else
				Pass_Certo <= '0';
			end if;
		end process;
end bhv_compAnd;
