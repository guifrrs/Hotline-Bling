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
		process(Teste_Pass, Data)
			begin
				Pass_Certo <= Data and Teste_Pass;
		end process;
end bhv_compAnd;
