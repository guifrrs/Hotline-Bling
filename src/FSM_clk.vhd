library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
 
entity FSM_clk is 
	port(CLOCK_50: in std_logic; -- Recebe o clock de 50 MHz da placa DE1.
			CLK1, CLK2: out std_logic); -- Gera dois outros clocks(1 e 2) de 1 e 4 Hz, respectivamente.
end FSM_clk;
 
architecture FSM_bhv of FSM_clk is
  	signal contador: std_logic_vector(27 downto 0) := "0000000000000000000000000000";
 	signal contador2: std_logic_vector(27 downto 0) := "0000000000000000000000000000"; -- Sinais responsáveis por representar a quantidade de oscilações do clock de 50 MHz.
 	
begin
	process (CLOCK_50, contador, contador2)
		begin
			if CLOCK_50'event and CLOCK_50 = '1' then
				contador <= contador + 1;
				contador2 <= contador2 + 1;
			end if;

			if contador = x"2FAF07F" then  -- Quando o contador chega em 49999999, o CLK1 recebe 1, de forma a gerar 1 oscilação por segundo.
				contador <= x"0000000";
				CLK1 <= '1';
			else
				CLK1 <= '0';
			end if;
			
			if contador2 = x"BEBC1F" then -- Quando o contador2 chega em 12499999, o CLK2 recebe 1, gerando um padrão oscilatório de aproximadamente 4 Hz.
				contador2 <= x"0000000";
				CLK2 <= '1';
			else
				CLK2 <= '0';
			end if;
		end process;
end FSM_bhv;