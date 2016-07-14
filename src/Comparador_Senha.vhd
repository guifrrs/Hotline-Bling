library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Comparador_Senha is
	port	(SEQ_3, SEQ_2, SEQ_1, SEQ_0: in std_logic_vector(4 downto 0);
			Data: in std_logic;
			Saida: out std_logic
			);
end Comparador_Senha;

architecture bhv_comp of Comparador_Senha is

	signal SEQ: std_logic_vector(19 downto 0);
	signal saida1: std_logic;
	
begin
					
	SEQ <= SEQ_3 & SEQ_2 & SEQ_1 & SEQ_0;  -- Concatenação das diferentes partes da senha digitada.
	
	Saida1 <= '1' when (SEQ = "00000001110001000010") else  --  Compara se a senha digitada é a correta (0722).
				 '0';				
				 
	saida <= saida1 and data;  -- data corresponde ao Teste_Pass.
		
end bhv_comp;