library IEEE;
use IEEE.std_logic_1164.all;

entity Conta_DES is
	port (CLK2, RST, EN: in std_logic;
			Conta_Des: out std_logic_vector(9 downto 0);
			);
end Conta_DES;

architecture bhv_conta of Conta_DES is
signal desc: integer;
signal desc2: integer;
	begin
		process(CLK2, RST, EN)
			begin
				desc <= 1010;
				if RST = '0' then
					Conta_Des <= (others => '0');
				elsif	rising_edge(CLK2) then
					if EN = '1' then
						Conta_DES <= desc;
					if desc /= 0 then
						desc2 <= desc - 1;
						desc <= desc2;
					end if;	
					end if;
				end if;
			end process;
end bhv_conta;-- Quartus II VHDL Template
-- Binary Up/Down Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_up_down_counter is

	generic
	(
		MIN_COUNT : natural := 0;
		MAX_COUNT : natural := 255
	);

	port
	(
		clk		   : in std_logic;
		reset	   : in std_logic;
		enable	   : in std_logic;
		updown	   : in std_logic;
		q		   : out integer range MIN_COUNT to MAX_COUNT
	);

end entity;

architecture rtl of binary_up_down_counter is
	signal direction : integer;
begin

	process (updown)
	begin
		-- Determine the increment/decrement of the counter
		if (updown = '1') then
			direction <= 1;
		else
			direction <= -1;
		end if;
	end process;


	process (clk)
		variable   cnt			: integer range MIN_COUNT to MAX_COUNT;
	begin
		
		-- Synchronously update counter
		if (rising_edge(clk)) then

			if reset = '1' then
				-- Reset the counter to 0
				cnt := 0;

			elsif enable = '1' then
				-- Increment/decrement the counter
				cnt := cnt + direction;

			end if;
		end if;

		-- Output the current count
		q <= cnt;
	end process;

end rtl;
