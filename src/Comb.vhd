library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Comb is 
		port(RST: in std_logic;
			SEL_DISP: in std_logic_vector(1 downto 0);
			RST_CONT: out std_logic);
end Comb;

architecture Comb_bhv of Comb is

begin
	process(RST, SEL_DISP)
		begin
			if SEL_DISP = "11" then
				if RST = '0' then
					RST_CONT <= '0';       --Lógica responsável por resetar a contagem ascendente enquanto essa não é selecionada no mux 4x1. 
				else
					RST_CONT <= '1';
				end if;
			else 
				RST_CONT <= '0';
			end if;
		end process;
end Comb_bhv;