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

entity mult is
port(
	i_en: in std_logic;
	i_a : in std_logic_vector(31 downto 0);
	i_b : in std_logic_vector(31 downto 0);
	o_r : out std_logic_vector(31 downto 0)
);
end mult;

architecture Behavioral of mult is

signal ext_res : std_logic_vector(63 downto 0);

begin

process(i_a, i_b, i_en)
begin
	if i_en = '1' then
		ext_res <= std_logic_vector(unsigned(i_a) * unsigned(i_b));
	else
		ext_res <= (others => '0');
	end if;
end process;

o_r <= ext_res(31 downto 0);
end Behavioral;

