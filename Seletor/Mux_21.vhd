library IEEE;
use IEEE.std_logic_1164.all;

entity Mux_21 is
  port (Conta_Des: in std_logic_vector(9 downto 0);
        Tentativas: in std_logic_vector(1 downto 0);
        s: in std_logic;     -- Seletor
        m: out std_logic_vector(9 downto 0)  -- Saida do mux
        );
end Mux_21;

architecture bhv_mux21 of Mux_21 is

  begin
	process(s)
	begin
    if (s = '1') then
      m <= Conta_Des;
    else
      m <= "00000000" & Tentativas;
    end if;
	end process;
end bhv_mux21;
