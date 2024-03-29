library IEEE;
use IEEE.std_logic_1164.all;

entity Topo_Comparador is
	port 	(SEQ_3, SEQ_2, SEQ_1, SEQ_0: in std_logic_vector(4 downto 0);
		Conta_Des: in std_logic_vector(9 downto 0);
		Teste_Pass: in std_logic;                         -- Entradas/saídas do bloco.
		Pass_Certo: out std_logic;
		Saldo: out std_logic
		);
end Topo_Comparador;

architecture bhv_topoComp of Topo_Comparador is

	component Comparador_Saldo
		port (Conta_Des: in std_logic_vector(9 downto 0);
		     Saldo: out std_logic
		     );
	end component;
	

	component Comparador_Senha
			port	(SEQ_3, SEQ_2, SEQ_1, SEQ_0: in std_logic_vector(4 downto 0);
					Data: in std_logic;
					Saida: out std_logic
					);
	end component;
	
	begin

		compsaldo: Comparador_Saldo port map (Conta_Des, Saldo);

		compSenha: Comparador_Senha port map (SEQ_3, SEQ_2, SEQ_1, SEQ_0, Teste_Pass, Pass_Certo);

end bhv_topoComp;