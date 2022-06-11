----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:09 06/10/2022 
-- Design Name: 
-- Module Name:    div - Behavioral 
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

entity enchanced_priority is
port(
	i_clk : in std_logic;
	i_en:	in std_logic;
	i_n : in std_logic_vector(31 downto 0);
	o_r : out std_logic_vector(31 downto 0)
);
end enchanced_priority;

architecture Behavioral of enchanced_priority is
signal highest_switch: unsigned(31 downto 0):=x"00000000";
signal tmp : unsigned(31 downto 0):=x"00000000";
signal temp_result : std_logic_vector(31 downto 0):=x"00000000";
type FSM is (Zero);
signal current_state, next_state: FSM;

begin
process(i_clk,i_en)
begin 
	if i_en = '1' then
		if(rising_edge(i_clk)) then
			current_state <= next_state;
		else
		current_state<=current_state;
		end if;
	end if;
end process;


process(current_state,i_n)
begin
	case(current_state) is
	
		when Zero =>
			for i in 0 to 31 loop
			  if i_n(i) = '1' then 
				 highest_switch <=to_unsigned(i+1,32);
			  end if;
			end loop;
			next_state <= Zero;
	end case;
end process;

o_r <= std_logic_vector(highest_switch);
end Behavioral;

