library IEEE;
use IEEE.std_logic_1164.all;

entity Mux_41 is
  port (In_Pass: in std_logic_vector(19 downto 0); -- Recebe a concatenação dos dígitos da senha vindos do decoder.
			Agenda: in std_logic_vector(19 downto 0); -- 20 bits correspondentes ao nome escolhido da agenda.
			Conta_Asc: in std_logic_vector(19 downto 0); -- Contagem ascendente recebida do contador.
			s: in std_logic_Vector(1 downto 0);
			m: out std_logic_vector(19 downto 0)
        );
end Mux_41;

architecture bhv_mux41 of Mux_41 is

begin

	m <= "00000000000000000000" when s = "00" else -- Quando o seletor é "00", a saída é zerada.
		  In_Pass when s = "01" else
		  Agenda when s = "10" else
		  Conta_Asc;
		  
end bhv_mux41;