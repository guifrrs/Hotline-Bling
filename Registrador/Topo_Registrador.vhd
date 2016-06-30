library IEEE;
use IEEE.std_logic_1164.all;

entity Topo_Registrador is
  port (BTN0, C0, C1, C2, C3: in std_logic; -- Reset e enable
        REG: in std_logic_vector(19 downto 0);  -- Entrada da senha
        SEQ_3, SEQ_2, SEQ_1, SEQ_0: out std_logic_vector(4 downto 0) -- Saida da senha
        );
end Topo_Registrador;

architecture Arq_reg of Topo_Registrador is
  component Registrador
    port (Clk, Rst, En: in std_logic; -- Clock, reset e enable.
          D: in std_logic_vector(4 downto 0); -- Entrada
          Q: out std_logic_vector(4 downto 0) -- Saída
          );
  end component;

  begin

  reg1: Registrador port map (CLOCK_50, BTN0, C3, REG(19 downto 15), SEQ_3); 

  reg2: Registrador port map (CLOCK_50, BTN0, C2, REG(14 downto 10), SEQ_2);

  reg3: Registrador port map (CLOCK_50, BTN0, C1, REG(9 downto 5), SEQ_1);

  reg4: Registrador port map (CLOCK_50, BTN0, C0, REG(4 downto 0), SEQ_0);

end Arq_reg
