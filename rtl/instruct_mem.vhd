----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:45:10 04/18/2022 
-- Design Name: 
-- Module Name:    instruct_mem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruct_mem is
port(
	i_addr : in std_logic_vector(31 downto 0);
	o_data : out std_logic_vector(31 downto 0)
);
end instruct_mem;

architecture Behavioral of instruct_mem is

begin
process(i_addr)
begin
	case i_addr is
		when x"00400000" =>
			o_data <= "00001110110000101000000110010011";    --add x4,x2,x3
		when x"00400004" =>
			o_data <= "00001111110000101000000110010011";    --sub x3, x7, x5
		when x"00400008" =>
			o_data <= "00000000010000101000000010010011";    --and x5, x6, x7
		when x"0040000c" =>
			o_data <= "00000000000100011010000000100011";    --or x5, x6, x7
		when x"00400010" =>
			o_data <= "00000000000000011010010010000011";
		when others =>
			o_data <=  (others => '0');
	end case;
end process;

end Behavioral;

