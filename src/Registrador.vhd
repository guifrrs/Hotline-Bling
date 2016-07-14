library IEEE;
use IEEE.std_logic_1164.all;

entity Registrador is
  port (Clk, Rst, En: in std_logic; -- Clock, reset e enable.
        D: in std_logic_vector(4 downto 0); -- Entrada
        Q: out std_logic_vector(4 downto 0) -- Saída
        );
end Registrador;

architecture bhv_reg of Registrador is

  begin
    process(Clk, Rst, En)    
      begin
        if Rst = '0' then -- RST assíncrono, como foi visto nas aulas de laboratório. 
          Q <= (others => '0');
        elsif rising_edge(Clk) then
          if En = '1' then -- Se o enable estiver em 1 na borda de subida do clock, a saída Q recebe o valor na entrada D.
            Q <= D;
          end if;
        end if;        
    end process;
end bhv_reg;