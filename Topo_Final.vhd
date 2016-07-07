library IEEE;
use IEEE.std_logic_1164.all;

entity Topo_Final is
  port (SW: in std_logic_vector(9 downto 0);
        Clock_50: in std_logic;
        HEX5: out std_logic_vector(6 downto 0);
        HEX4: out std_logic_vector(6 downto 0);
        HEX3: out std_logic_vector(6 downto 0);
        HEX2: out std_logic_vector(6 downto 0);
        HEX1: out std_logic_vector(6 downto 0);
        HEX0: out std_logic_vector(6 downto 0);
        LEDR: out std_logic_vector(9 downto 0)
        );
end Topo_Final;

architecture bhv_topoFinal of Topo_Final is
  
  component Topo_Registrador
    port (BTN0, C0, C1, C2, C3: in std_logic; -- Reset e enable
          Clock_50: in std_logic; -- Clock
          REG: in std_logic_vector(19 downto 0);  -- Entrada da senha
          SEQ_3, SEQ_2, SEQ_1, SEQ_0: out std_logic_vector(4 downto 0) -- Saida da senha
          );
  end component;
  
  component Topo_Seletor
    port (SW: in std_logic_vector(9 downto 0);
        Agenda: in std_logic_vector(19 downto 0);
        Conta_Asc: in std_logic_vector(19 downto 0);
        Conta_Des: in std_logic_vector(9 downto 0);
        Sel_Disp: in std_logic_vector(1 downto 0);
        Sel_Led: in std_logic;
        Led_Out: out std_logic_vector(9 downto 0);
      	Tentativas: in std_logic_vector(1 downto 0);
        Reg: out std_logic_vector(19 downto 0)
        );
  end component;
  
  component Topo_Comparador
    port (SEQ_3, SEQ_2, SEQ_1, SEQ_0: in std_logic_vector(4 downto 0);
	     	 Teste_Pass: in std_logic;
		     Pass_Certo: out std_logic;
		     Saldo: out std_logic
		     );
  end component;
  
  component Topo_BlocoContador
    port (BTN0, Sel_Led, CLOCK_50: in std_logic;
         Sel_Disp: in std_logic_vector(1 downto 0);
         Conta_Des: out std_logic_vector(9 downto 0);
		     Conta_As: out std_logic_vector(19 downto 0)
         );
  end component;
  
  component Topo_Controlador
    port (Pass_Certo: in std_logic; -- Senha correta
          BTN3, BTN0: in std_logic; -- Enter e Reset
          Saldo: in std_logic; -- Saldo disponível
          Clock_50: in std_logic; -- Sinal de Clock
          C0, C1, C2, C3: out std_logic; -- Sinal de carga dos Registradores
          Sel_Led: out std_logic; -- Seletor do Mux que vai pro LED
          Sel_Disp: out std_logic_vector(1 downto 0); -- Seletor do Mux que vai pro Display
          Teste_Pass: out std_logic; -- Senha passou
          Tentativas: out std_logic_vector(1 downto 0); -- Número de tentativas
          Estados: out std_logic_vector(4 downto 0) -- Estado atual que vai pro Dipslay
          );
  end component;
  
  begin
  
  seletor: Topo_Seletor port map ();
  
  contador: Topo_BlocoContador port map ();
  
  comparador: Topo_Comparador port map ();
  
  registrador: Topo_Registrador port map ();
  
  fsm: Topo_Controlador port map ();


end bhv_topoFinal;
