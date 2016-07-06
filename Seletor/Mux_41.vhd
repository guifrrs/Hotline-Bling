library IEEE;
use IEEE.std_logic_1164.all;

entity Mux_41 is
  port (In_Pass: in std_logic_vector(19 downto 0);
			Agenda: in std_logic_vector(19 downto 0);
			Conta_Asc: in std_logic_vector(19 downto 0);
			s: in std_logic_Vector(1 downto 0);
			m: out std_logic_vector(19 downto 0)
        );
end Mux_41;

architecture bhv_mux41 of Mux_41 is



  begin
	process(s)
		begin
      if(s = "00") then
			m <= "00000000000000000000";
		elsif (s = "01") then
			m <= In_Pass;
		elsif (s = "10") then
			m <= Agenda;
		else
			m <= Conta_Asc;
		end if;
	end process;
end bhv_mux41;
