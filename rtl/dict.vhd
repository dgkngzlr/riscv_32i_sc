----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:41 06/10/2022 
-- Design Name: 
-- Module Name:    lut - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dict is
	port(
		i_clk : in std_logic;
		i_wen : in std_logic; -- write/read
		i_valid : in std_logic; -- master assert if given key is valid
		i_key : in std_logic_vector(31 downto 0); -- key pair
		i_value : in std_logic_vector(31 downto 0); -- value pair
		o_value : out std_logic_vector(31 downto 0); -- value data of given key for read
		o_valid : out std_logic -- assert if given value data is valid
	);
end dict;

architecture Behavioral of dict is
	type array_t is array (15 downto 0) of std_logic_vector(31 downto 0);
	
	signal key_table : array_t := (others => (others => '0'));
	signal value_table : array_t := (others => (others => '0'));
	
	signal ptr : integer range 0 to 15 := 0;
	
begin

-- Write logic
process(i_clk)
begin
	if rising_edge(i_clk) then
		if i_wen = '1' and i_valid = '1' then
			key_table(ptr) <= i_key;
			value_table(ptr) <= i_value;
			ptr <= (ptr + 1) mod 16;
		end if;
	end if;
end process;

-- Read logic
process(i_clk)
begin
	if rising_edge(i_clk) then
		o_value <= (others => '0');
		o_valid <= '0';
		if i_wen = '0' and i_valid = '1' then
			for i in 0 to 15 loop
				if i_key = key_table(i) then
					if value_table(i) /= x"00000000" then
						o_value <= value_table(i);
						o_valid <= '1';
					else
						o_value <= (others => '0');
						o_valid <= '0';
					end if;
				end if;
			end loop;
		end if;
	end if;
end process;


end Behavioral;

