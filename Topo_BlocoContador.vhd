library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Topo_BlocoContador is
  port (BTN0, Sel_Led, CLOCK_50: in std_logic;
        Sel_Disp: in std_logic_vector(1 downto 0);
        Conta_Des: out std_logic_vector(9 downto 0);
		  Conta_As: out std_logic_vector(19 downto 0)
        );
end Topo_BlocoContador;

architecture Arq_TopoContador of Topo_BlocoContador is

	signal CLK1, CLK2, RST_CONT: std_logic;
	
   component FSM_clk
     port(CLOCK_50: in std_logic;
			 CLK1, CLK2: out std_logic);
   end component;
  
   component Conta_Desc
	 port (CLK2, RST, EN: in std_logic;
			 Conta_Desc: out std_logic_vector(9 downto 0)
			 );
   end component;
	
   component Comb
		 port(RST: in std_logic;
			 SEL_DISP: in std_logic_vector(1 downto 0);
			 RST_CONT: out std_logic);
   end component;
	
	component Conta_Asc
		 port(CLK1, RST_CONT: in std_logic;
			   CONTA_ASC: out std_logic_vector(19 downto 0)
			   );
	end component;

  begin

  FSMclk: FSM_clk port map(CLOCK_50, CLK1, CLK2);
  
  ContaDesc: Conta_Desc port map(CLK2, BTN0, Sel_Led, Conta_Des);
  
  Combi: Comb port map(BTN0, Sel_Disp, RST_CONT);
  
  ContaAsc: Conta_Asc port map(CLK1, RST_CONT, Conta_As);

end Arq_TopoContador;