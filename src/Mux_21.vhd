library IEEE;
use IEEE.std_logic_1164.all;

entity Mux_21 is
  port (Conta_Des: in std_logic_vector(9 downto 0); -- Recebe a contagem descendente do contador.
        Tentativas: in std_logic_vector(1 downto 0); -- Recebe o número de tentativas da fsm.
        s: in std_logic;     -- Seletor.
        m: out std_logic_vector(9 downto 0)  -- Saída do mux.
        );
end Mux_21;

architecture bhv_mux21 of Mux_21 is

begin

	m <= "00000000" & Tentativas when s = '0' else
			Conta_Des;
			
end bhv_mux21;