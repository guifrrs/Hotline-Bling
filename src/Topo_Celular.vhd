library IEEE;
use IEEE.std_logic_1164.all;

entity Topo_Celular is
  port (SW: in std_logic_vector(9 downto 0);
        CLOCK_50: in std_logic;
		  KEY:in std_logic_vector(3 downto 0);
        HEX5: out std_logic_vector(6 downto 0);
        HEX4: out std_logic_vector(6 downto 0);
        HEX3: out std_logic_vector(6 downto 0);    -- Entradas/saídas do projeto.
        HEX2: out std_logic_vector(6 downto 0);
        HEX1: out std_logic_vector(6 downto 0);
        HEX0: out std_logic_vector(6 downto 0);
        LEDR: out std_logic_vector(9 downto 0)
        );
end Topo_Celular;

architecture bhv_topoFinal of Topo_Celular is
	signal BTN0, BTN1, BTN2, BTN3,C0, C1, C2, C3, Sel_Led, Teste_Pass, Pass_Certo, Saldo: std_logic;
	signal REG, Conta_Asc, Agenda: std_logic_vector(19 downto 0);
	signal Conta_Des: std_logic_vector(9 downto 0);                            -- Sinais necessários para a comunicação entre os blocos.
	signal SEQ_3, SEQ_2, SEQ_1, SEQ_0, Estados: std_logic_vector(4 downto 0);
	signal Sel_Disp, Tentativas: std_logic_vector(1 downto 0);

  component ButtonSync
	 port
	(	key0	: in  std_logic;
		key1	: in  std_logic;
		key2	: in  std_logic;
		key3	: in  std_logic;	
		clk : in std_logic;
		btn0	: out std_logic;
		btn1	: out std_logic;
		btn2	: out std_logic;
		btn3	: out std_logic
	);
  end component;

  
  component Topo_Registrador                                                  -- São "chamados" os topos dos blocos.
    port (BTN0, C0, C1, C2, C3: in std_logic; 
          Clock_50: in std_logic; 
          REG: in std_logic_vector(19 downto 0);  
          SEQ_3, SEQ_2, SEQ_1, SEQ_0: out std_logic_vector(4 downto 0) 
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
		Conta_Des: in std_logic_vector(9 downto 0);
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
  
  component FSM_Control
	port (Clock_50, Reset, Enter: in std_logic;
	      Pass_Certo, Saldo: in std_logic;
	      Teste_Pass, Sel_Led, C3, C2, C1, C0: out std_logic;
	      Estados: out std_logic_vector(4 downto 0);
	      Tentativas, Sel_Disp: out std_logic_vector(1 downto 0)
	      );
  end component;
  
  component decod7seg
	 port (C: in std_logic_vector(4 downto 0);
			F: out std_logic_vector(6 downto 0)
			);
  end component;
  
  component ROM1 
    port ( address : in std_logic_vector(3 downto 0);
			  data : out std_logic_vector(19 downto 0)
	      );
  end component;
  
  begin -- Aqui são feitas as ligações entre os blocos.
  Button: ButtonSync port map (KEY(0), KEY(1), KEY(2), KEY(3), CLOCK_50, BTN0, BTN1, BTN2, BTN3);
  
  registrador: Topo_Registrador port map (BTN0, C0, C1, C2, C3, CLOCK_50, REG, SEQ_3, SEQ_2, SEQ_1, SEQ_0 );
  
  seletor: Topo_Seletor port map (SW(9 downto 0), Agenda, Conta_Asc, Conta_Des, Sel_Disp, Sel_Led, LEDR(9 downto 0), Tentativas, REG);
  
  comparador: Topo_Comparador port map (SEQ_3, SEQ_2, SEQ_1, SEQ_0, Conta_Des, Teste_Pass, Pass_Certo, Saldo);
  
  contador: Topo_BlocoContador port map (BTN0, Sel_Led, CLOCK_50, Sel_Disp, Conta_Des, Conta_Asc); 
  
  controlador: FSM_control port map (CLOCK_50, BTN0, BTN3, Pass_Certo, Saldo, Teste_Pass, Sel_Led, C3, C2, C1, C0, Estados, Tentativas, Sel_Disp );
  
  agendinea: ROM1 port map (SW(3 downto 0), Agenda);
  
  decod1: decod7seg port map (SEQ_0, HEX0);
  
  decod2: decod7seg port map (SEQ_1, HEX1);
  
  decod3: decod7seg port map (SEQ_2, HEX2);
  
  decod4: decod7seg port map (SEQ_3, HEX3);
  
  decod5: decod7seg port map (Estados, HEX4);
  
  HEX5 <= "0000110"; -- Display que mostra "E".
  

end bhv_topoFinal;