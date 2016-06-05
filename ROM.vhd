library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is
  port ( address : in std_logic_vector(4 downto 0);
         data : out std_logic_vector(8 downto 0) );
end entity ROM1;

architecture behavioral of ROM1 is
  type mem is array ( 0 to 2**5 - 1) of std_logic_vector(8 downto 0);
  constant my_Rom : mem := (
    0  => "000000000",
    1  => "000000001",
    2  => "000000010",
    3  => "000000011",
    4  => "000000100",
    5  => "111000000",
    6  => "110100000",
    7  => "101100000",
    8  => "011100000",
    9  => "110000000",
    10 => "100100000",
    11 => "001100000",
    12 => "101000000",
    13 => "010100000",
    14 => "101100100",
    15 => "111100100",
    16  => "000101000",
    17  => "000101001",
    18  => "000110010",
    19  => "010100011",
    20  => "010100100",
    21  => "111000000",
    22  => "111101000",
    23  => "111101100",
    24  => "111100100",
    25  => "111010001",
    26 => "111100001",
    27 => "111100010",
    28 => "111100100",
    29 => "111101000",
    30 => "111111110",
    31 => "111101010");
begin
   process (address)
   begin
     case address is
       when "00000" => data <= my_rom(0);
       when "00001" => data <= my_rom(1);
       when "00010" => data <= my_rom(2);
       when "00011" => data <= my_rom(3);
       when "00100" => data <= my_rom(4);
       when "00101" => data <= my_rom(5);
       when "00110" => data <= my_rom(6);
       when "00111" => data <= my_rom(7);
       when "01000" => data <= my_rom(8);
       when "01001" => data <= my_rom(9);
       when "01010" => data <= my_rom(10);
       when "01011" => data <= my_rom(11);
       when "01100" => data <= my_rom(12);
       when "01101" => data <= my_rom(13);
       when "01110" => data <= my_rom(14);
       when "01111" => data <= my_rom(15);
       when "10000" => data <= my_rom(16);
       when "10001" => data <= my_rom(17);
       when "10010" => data <= my_rom(18);
       when "10011" => data <= my_rom(19);
       when "10100" => data <= my_rom(20);
       when "10101" => data <= my_rom(21);
       when "10110" => data <= my_rom(22);
       when "10111" => data <= my_rom(23);
       when "11000" => data <= my_rom(24);
       when "11001" => data <= my_rom(25);
       when "11010" => data <= my_rom(26);
       when "11011" => data <= my_rom(27);
       when "11100" => data <= my_rom(28);
       when "11101" => data <= my_rom(29);
       when "11110" => data <= my_rom(30);
       when "11111" => data <= my_rom(31);
       when others => data <= "000000000";
	 end case;
  end process;
end architecture behavioral;