library IEEE;
use IEEE.std_logic_1164.all;

entity Conta_DES is
	port (CLK2, RST, EN: in std_logic;
			Conta_Des: out std_logic_vector(9 downto 0);
			);
end Conta_DES;

architecture bhv_conta of Conta_DES is
signal desc: integer;
signal desc2: integer;
	begin
		process(CLK2, RST, EN)
			begin
				desc <= 1010;
				if RST = '0' then
					Conta_Des <= (others => '0');
				elsif	rising_edge(CLK2) then
					if EN = '1' then
						Conta_DES <= desc;
					if desc /= 0 then
						desc2 <= desc - 1;
						desc <= desc2;
					end if;	
					end if;
				end if;
			end process;
end bhv_conta;
