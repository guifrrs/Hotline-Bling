library IEEE;
use IEEE.std_logic_1164.all;

entity Comparador_Saldo is
	port (Conta_Des: in std_logic_vector(9 downto 0); -- Recebe a conta descendente do contador.
	     Saldo: out std_logic
	     );
end Comparador_Saldo;

architecture bhv_compSaldo of Comparador_Saldo is

begin

	Saldo <= '0' when Conta_Des = "0000000000" else -- Comparação feita para determinar se o saldo acabou ou não.
				'1';
	
end bhv_compSaldo;