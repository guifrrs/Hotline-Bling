library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(19 downto 0) );
end entity ROM1;

architecture behavioral of ROM1 is
  type mem is array ( 0 to 2**4 - 1) of std_logic_vector(19 downto 0);
  constant my_Rom : mem := (
    0  => "11110010101010111111", -- PAI
    1  => "10011110011001101010", -- LULA
    2  => "10000110011010111111", -- gUI
    3  => "01110011011100111111", -- edU
    4  => "10100010101010001010", -- nAnA
    5  => "10001110011000010110", -- HUGO
    6  => "01101101101011111000", -- dORy
    7  => "01101110010110111001", -- dUdU
    8  => "11011010100111011111", -- MAe
    9  => "11100101010110010110", -- ZICO
    10 => "11101110011110101010", -- XUXA
    11 => "10010110010110001010", -- JUCA
    12 => "01010011011011111000", -- Adry
    13 => "01011101110101010100", -- bRAn
    14 => "01110101111010101100", -- eRic
    15 => "01010101111100001010"); -- ARyA
begin
   process (address)
   begin
     case address is
       when "0000" => data <= my_rom(0);
       when "0001" => data <= my_rom(1);
       when "0010" => data <= my_rom(2);
       when "0011" => data <= my_rom(3);
       when "0100" => data <= my_rom(4);
       when "0101" => data <= my_rom(5);
       when "0110" => data <= my_rom(6);
       when "0111" => data <= my_rom(7);
       when "1000" => data <= my_rom(8);
       when "1001" => data <= my_rom(9);
       when "1010" => data <= my_rom(10);
       when "1011" => data <= my_rom(11);
       when "1100" => data <= my_rom(12);
       when "1101" => data <= my_rom(13);
       when "1110" => data <= my_rom(14);
       when "1111" => data <= my_rom(15);
       when others => data <= "00000000000000000000"; -- Não mostrar nada
     end case;
  end process;
end architecture behavioral;