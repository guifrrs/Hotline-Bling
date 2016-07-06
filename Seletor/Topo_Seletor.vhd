library IEEE;
use IEEE.std_logic_1164.all;

entity Topo_Seletor is
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
end Topo_Seletor;

architecture Arq_Seletor of Topo_Seletor is

	signal In_Pass: std_logic_vector(4 downto 0);
	signal IN_PASSTOTAL: std_logic_vector(19 downto 0);

  component Decoder
    port (SW: in std_logic_vector(9 downto 0); -- Entrada
          In_Pass: out std_logic_vector(4 downto 0) -- Saida
          );
  end component;
  
  component Mux_41
	port (In_Pass: in std_logic_vector(19 downto 0);
			Agenda: in std_logic_vector(19 downto 0);
			Conta_Asc: in std_logic_vector(19 downto 0);
			s: in std_logic_Vector(1 downto 0);
			m: out std_logic_vector(19 downto 0)
			);
	end component;
	
	component Mux_21
		port (Conta_Des: in std_logic_vector(9 downto 0);
        Tentativas: in std_logic_vector(1 downto 0);
        s: in std_logic;     -- Seletor
        m: out std_logic_vector(9 downto 0)  -- Saida do mux
        );
	end component;

  begin
IN_PASSTOTAL <= In_Pass & In_Pass & In_Pass & In_Pass;

  decod: Decoder port map(SW(9 downto 0), In_Pass);
  
  mux4to1: Mux_41 port map(IN_PASSTOTAL, Agenda, Conta_Asc, Sel_Disp, Reg);
  
  mux2to1: Mux_21 port map(Conta_Des, Tentativas, Sel_Led, Led_Out);

end Arq_Seletor;
