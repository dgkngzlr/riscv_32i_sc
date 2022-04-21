----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:27:49 04/21/2022 
-- Design Name: 
-- Module Name:    pc_inc - Behavioral 
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

entity pc_inc is
port(
	i_data : in std_logic_vector(31 downto 0);
	o_data : out std_logic_vector(31 downto 0)
);
end pc_inc;

architecture Behavioral of pc_inc is
	signal u_data : unsigned(31 downto 0) := (others => '0');
begin

	u_data <= unsigned(i_data) + 4;
	o_data <= std_logic_vector(u_data);
end Behavioral;

