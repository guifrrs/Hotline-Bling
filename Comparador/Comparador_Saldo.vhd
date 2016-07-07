library IEEE;
use IEEE.std_logic_1164.all;

entity Comparador_Saldo is
	port (Conta_Des: in std_logic_vector(9 downto 0);
	     Saldo: out std_logic
	     );
end Comparador_Saldo;

architecture bhv_compSaldo of Comparador_Saldo is

	signal zero: std_logic_vector(9 downto 0) := "0000000000";

	begin
		process(Conta_Des)
			begin
				if(Conta_Des = zero) then
					Saldo <= '1';
				else
					Saldo <= '0';
				end if;
		end process;
end bhv_compSaldo;
