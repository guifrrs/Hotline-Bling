library IEEE;
use IEEE.std_logic_1164.all;

entity Topo_Controlador is
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
end Topo_Controlador;

architecture bhv_controlador of Topo_Controlador is

  component FSM_Control
    port (Clock_50, Reset, Enter: in std_logic;
			Pass_Certo, Saldo: in std_logic;
			Teste_Pass, Sel_Led, C3, C2, C1, C0: out std_logic;
			Estados: out std_logic_vector(4 downto 0);
			Tentativas, Sel_Disp: out std_logic_vector(1 downto 0)
			);
  end component;

  begin

	fsm: FSM_Control port map (Clock_50, BTN0, BTN3, Pass_Certo, Saldo, Teste_Pass, Sel_Led, C3, C2, C1, C0, Estados, Tentativas, Sel_Disp);


end bhv_controlador;
