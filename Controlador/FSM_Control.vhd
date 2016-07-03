library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity FSM_Control is
	port (Clock_50, Reset, Enter: in std_logic;
		   Pass_Certo, Saldo: in std_logic;
			Teste_Pass, Sel_Led, C3, C2, C1, C0: out std_logic;
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

		P1: process(clock, Rst) -- Processo 1, atualizando sempre o clock e reset.
			begin
				if Rst = '0' then
					EA <= S0;
				elsif clock'event and clock = '1' then
					EA <= PE;
				end if;
		end process;

		P2: process(EA, Enter, clock) -- Processo 2, atualizando sempre com o Enter e o Ea.
			begin
				if clock'event and clock = '0' then
					case EA is
						-- Estado inicial.
						when S0 =>
							if Enter = '1' then
								PE <= S0;
							else
								PE <= S1;
							end if;

							Sel_Disp <= "00";
							Sel_Led <= '0';
							tent <= "00";
							Estados <= "00000";
						-- Estado S1.
					when S1 =>
						if Enter = '1' then
							PE <= S1;
						else
							PE <= S2;
						end if;

						Sel_Disp <= "01";
						Sel_Led <= '0';
						Estados <= "00001";
						Teste_Pass <= '0';
					-- Estado S2.
					when S2 =>
						if Enter = '1' then
							PE <= S2;
						else
							PE <= S3;
						end if;

						C3 <= '1';
						C2 <= '0';
						C1 <= '0';
						C0 <= '0';
						Estados <= "00010";
					-- Estado S3.
					when S3 =>
						if Enter ='1' then
							PE <= S3;
						else
							PE <= S4;
						end if;

						C3 <= '0';
						C2 <= '1';
						C1 <= '0';
						C0 <= '0';
						Estados <= "00011";
					-- Estado S4.
					when S4 =>
						if Enter ='1' then
							PE <= S4;
						else
							PE <= S5;
						end if;

						C3 <= '0';
						C2 <= '0';
						C1 <= '1';
						C0 <= '0';
						Estados <= "00100";
					-- Estado S5;
					when S5 =>
						if Enter = '1' then
						PE <= S5;
						else
						PE <= S6;
						end if;

						C3 <= '0';
						C2 <= '0';
						C1 <= '0';
						C0 <= '1';
						Estados <= "00101";
					-- Estado S6.
					when S6 =>
						if (tent = "11" and Pass_Certo = '0') then
							PE <= S0;
						elsif (tent < "11" and Pass_Certo = '1') then
							PE <= S1;
						else
							PE <= S7;
						end if;

						tent <= tent + 1;
						Teste_Pass <= '1';
						C0 <= '0';
						Estados <= "00110";
					-- Estado S7;
					when S7 =>
						if Enter = '1' then
							PE <= S7;
						else
							PE <= S8;
						end if;

						Sel_Disp <= "10";
				 -- Estado S8.
				 when S8 =>
					
				 	if(Saldo = '1' or Enter = '0') then
						PE <= S7;
					elsif Saldo = '0' then
						PE <= S0;
					else
						PE <= S8;
					end if;					
					
					Sel_Disp <= "11";
					Sel_Led <= '1';
				end case;
			end if;
		end process;
end bhv_FSMC;
