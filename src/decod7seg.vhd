library IEEE;
use IEEE.Std_Logic_1164.all;

entity Decod7seg is
	port (C: in std_logic_vector(4 downto 0);
			F: out std_logic_vector(6 downto 0)
			);
end Decod7seg;

architecture decod_bhv of Decod7seg is
	begin
		F <=  "1000000" when C = "00000" else -- 0
				"1111001" when C = "00001" else -- 1
				"0100100" when C = "00010" else -- 2
				"0110000" when C = "00011" else -- 3
				"0011001" when C = "00100" else -- 4
				"0010010" when C = "00101" else -- 5
				"0000010" when C = "00110" else -- 6
				"1111000" when C = "00111" else -- 7
				"0000000" when C = "01000" else -- 8
				"0010000" when C = "01001" else -- 9
				"0001000" when C = "01010" else -- A
				"0000011" when C = "01011" else -- b
				"1000110" when C = "01100" else -- C
				"0100001" when C = "01101" else -- d
				"0000110" when C = "01110" else -- E
				"0001110" when C = "01111" else -- f
				"0010000" when C = "10000" else -- g
				"0001001" when C = "10001" else -- H
				"1100001" when C = "10010" else -- J
				"1000111" when C = "10011" else -- L
				"0101011" when C = "10100" else -- n
				"1111001" when C = "10101" else -- I
				"1000000" when C = "10110" else -- O
				"0101111" when C = "10111" else -- r
				"0010001" when C = "11000" else -- y
				"1000001" when C = "11001" else -- U
				"1000001" when C = "11010" else -- V
				"1001000" when C = "11011" else -- M
				"0100100" when C = "11100" else -- Z
				"0001001" when C = "11101" else -- X
				"0001100" when C = "11110" else -- P
				"1111111"; -- ""
				
end decod_bhv;
