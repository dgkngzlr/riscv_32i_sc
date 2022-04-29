----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2022 12:06:42
-- Design Name: 
-- Module Name: PC_target - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_target is
    Port ( i_data : in STD_LOGIC_VECTOR (31 downto 0);
           i_extended : in STD_LOGIC_VECTOR (31 downto 0);
           o_pctarget : out STD_LOGIC_VECTOR (31 downto 0));
end PC_target;

architecture Behavioral of PC_target is
signal u_data : unsigned(31 downto 0) := (others => '0');
begin

	u_data <= unsigned(i_data) + unsigned(i_extended);
	o_pctarget <= std_logic_vector(u_data);
end Behavioral;
