library IEEE;
use IEEE.std_logic_1164.all;

entity Registrador is
	port( clk, rst, en: in std_logic;
			d: in std_logic_vector(4 downto 0);
			q: out std_logic_vector(4 downto 0)
		);
end Registrador;

architecture bhv of Registrador is

	begin
		process (clk, rst, en)				 
			begin

				if rst = '0' then			
				
					Q <= (others => '0');		

				elsif rising_edge(clk) then
					if en = '1' then		
						Q <= D;		
					end if;
				end if;
		end process;

	end bhv;