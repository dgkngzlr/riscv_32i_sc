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
			o_data <= x"07828193";   
		when x"00400004" =>
			o_data <= x"04A00213";    
		when x"00400008" =>
			o_data <= x"00900293";    
		when x"0040000c" =>
			o_data <= "00000000010100100000001101111000";    --bard x6, x4, x5
		when x"00400010" =>
			o_data <= x"0061A023";    
		when x"00400014" =>
			o_data <= x"0001A483";   
		when others =>
			o_data <=  (others => '0');
	end case;
end process;

end Behavioral;

