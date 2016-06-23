library ieee;
use ieee.std_logic_1164.all;

entity topo is
port (BTN0, C0, C1, C2, C3: in std_logic;
		REG: in std_logic_vector (19 downto 0);		
		CLOCK_50: in std_logic;
		SEQ_3: out std_logic_vector(4 downto 0);		
		SEQ_2: out std_logic_vector(4 downto 0);		
		SEQ_1: out std_logic_vector(4 downto 0);		
		SEQ_0: out std_logic_vector(4 downto 0)		
	);
end topo;


architecture arq of topo is
	
	component Registrador

		port (clk, rst, en: IN STD_LOGIC;
				d: IN STD_LOGIC_VECTOR (4 DOWNTO 0);		
				q: OUT STD_LOGIC_VECTOR (4 DOWNTO 0)		
			 );
	end component;

	begin
	
	reg1: Registrador port map (CLOCK_50, BTN0, C3, REG(19 downto 15), SEQ_3);	-- pormap conforme especificoes
	reg2: Registrador port map (CLOCK_50, BTN0, C2, REG(14 downto 10), SEQ_2);	-- pormap conforme especificoes
	reg3:	 Registrador port map(CLOCK_50, BTN0, C1, REG(9 downto 5), SEQ_1);	-- pormap conforme especificoes
	reg4:	 Registrador port map (CLOCK_50, BTN0, C0, REG(4 downto 0), SEQ_0);	-- pormap conforme especificoes

	end arq;
