library IEEE;
use IEEE.std_logic_1164.all;

entity Comparador2 is
	port( CONTA_DES: in std_logic_vector(9 downto 0);
			saldo: out std_logic
		);
end Comparador2;

architecture bhv_comp2 of Comparador2 is
	begin
		process(CONTA_DES)
			begin
				if(CONTA_DES = "0000000000") then
					saldo <= '1';
				else
					saldo <= '0';
				end if;
			end process;
end bhv_comp2;
