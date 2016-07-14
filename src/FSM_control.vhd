library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity FSM_Control is
	port (Clock_50, Reset, Enter: in std_logic;
	      Pass_Certo, Saldo: in std_logic;                      
	      Teste_Pass, Sel_Led, C3, C2, C1, C0: out std_logic;          --Entradas/Saídas
	      Estados: out std_logic_vector(4 downto 0);
	      Tentativas, Sel_Disp: out std_logic_vector(1 downto 0)
	      );
end FSM_Control;

architecture bhv_FSMC of FSM_Control is
	type states is (S0, S1, S2, S3, S4, S5, S6, S7, S8); -- Estados da FSM
	signal EA, PE: states;
	signal Clock, Rst: std_logic;
	signal tent: std_logic_vector(1 downto 0);

	begin
		clock <= Clock_50; -- Facilitar o uso
		Rst <= Reset;
		Tentativas <= tent;

		P1: process(clock, Rst) -- Processo 1, atualizando com o clock e reset.
			begin
				if Rst = '0' then -- Reset assíncrono.
					EA <= S0;
				elsif clock'event and clock = '1' then
					EA <= PE;
				end if;
		end process;

		P2: process(EA, Enter,clock,saldo) -- Processo 2, atualizando com o clock, com o enter e com e estado atual.
			begin
				if clock'event and clock = '0' then
					case EA is
						when S0 =>             -- Estado inicial (DESL).
							if Enter = '1' then
								PE <= S0;                 						
							else
								PE <= S1;
							end if;
							Sel_Disp <= "00";
							Sel_Led <= '0';
							tent <= "00";
							Estados <= "00000";
							C3 <= '1';
							C2 <= '1';          --Os registradores são carregados para que o display se comporte do modo desejado.
							C1 <= '1';
							C0 <= '1';
							Teste_Pass <= '0';
							
						when S1 =>             -- Estado S1 (intro_PASS).
							Sel_Disp <= "01";   -- É selecionado "01" no mux 4x1 , para que o valor do primeiro dígito seja passado aos registradores.
							Teste_Pass <= '0';	
							Estados <= "00001";
							if Enter = '1' then
								PE <= S1;
							else
								PE <= S2;
							end if;
							
						when S2 =>				  -- Estado S2 (REG 3).
							Estados <= "00010";
							if Enter = '1' then
								PE <= S2;
							else
								PE <= S3;
							end if;
							C3 <= '1';      -- O primeiro registrador é carregado de modo que receba a primeira parte da senha digitada.
							C2 <= '0';        
							C1 <= '0';
							C0 <= '0';

						when S3 =>				  -- Estado S3 (REG 2).
							Estados <= "00011";
							if Enter ='1' then
								PE <= S3;
							else
								PE <= S4;
							end if;
							C3 <= '0';
							C2 <= '1';
							C1 <= '0';
							C0 <= '0';

						when S4 =>				  -- Estado S4 (REG 1).
							Estados <= "00100";
							if Enter ='1' then
								PE <= S4;
							else
								PE <= S5;
							end if;
							C3 <= '0';
							C2 <= '0';
							C1 <= '1';
							C0 <= '0';

						when S5 =>				  -- Estado S5 (REG 0).
							Estados <= "00101";
							if Enter = '1' then
							PE <= S5;
							else
							PE <= S6;
							Teste_Pass <= '1';   -- O Teste_Pass recebe valor '1' aqui para que no próximo estado ele já esteja com valor definido.
							end if;
							C3 <= '0';
							C2 <= '0';
							C1 <= '0';
							C0 <= '1';

						when S6 =>				  -- Estado S6 (TESTE).
							tent <= tent + 1;    -- Ao chegar nesse estado, uma tentativa é somada ao total.
							Teste_Pass <= '1';
							C0 <= '0';
							Estados <= "00110";
							
							if (tent = "11" and Pass_Certo = '0') then
								PE <= S0;                                   --Condições que determinam o próximo estado, dependendo do número de tentativas e da senha colocada.
							elsif (tent < "11" and Pass_Certo = '0') then
								PE <= S1;
							else
								PE <= S7;
							end if;

						when S7 =>				  -- Estado S7 (ON).
							if Enter = '1' then
								PE <= S7;
							else
								PE <= S8;
							end if;
							Sel_Disp <= "10";
							Estados <= "00111";
							C3 <= '1';
							C2 <= '1';
							C1 <= '1';
							C0 <= '1';
							Sel_Led <= '0';    -- É selecionado '0' no mux 2x1, para que o número de tentativas apareça nos leds.
                                        -- Assim como nas outras ocasiões, essa declaração ocorre mais de uma vez somente para assegurar o valor desejado.
						 when S8 =>				 -- Estado S8 (LIGA).
							
						 	if Saldo = '0' then
								PE <= S0;
							elsif (Saldo = '1' and Enter = '0') then
								PE <= S7;
							else
								PE <= S8;
							end if;
							C3 <= '1';
							C2 <= '1';
							C1 <= '1';
							C0 <= '1';					
							Estados <= "01000";
							Sel_Disp <= "11"; -- É selecionado '11' no mux 4x1, para que a contagem ascendente seja mostrada nos displays correspondentes.
							Sel_Led <= '1';   -- É selecionado '1' no mux 2x1, para que a contagem descendente seja mostrada nos leds.
				end case;
			end if;
		end process;
end bhv_FSMC;