----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:24:38 04/18/2022 
-- Design Name: 
-- Module Name:    reg_file - Behavioral 
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_file is
	
	port(i_clk : in std_logic;
		 i_wen : in std_logic;
		 i_raddr1 : in std_logic_vector(4 downto 0);
		 i_raddr2 : in std_logic_vector(4 downto 0);
		 i_waddr1 : in std_logic_vector(4 downto 0);
		 i_wdata1 : in std_logic_vector(31 downto 0);
		 o_rdata1 : out std_logic_vector(31 downto 0);
		 o_rdata2 : out std_logic_vector(31 downto 0)
		 );
	
end reg_file;

architecture Behavioral of reg_file is
	-- 32x32 register file structure 
	type array_t is array (31 downto 0) of std_logic_vector(31 downto 0);
	signal register_file : array_t := ( others =>x"00000000" );
begin

-- Writes the data to the register at rising edge of the clock.
process(i_clk)
begin
	if rising_edge(i_clk) then
		if i_wen = '1' then
			if unsigned(i_waddr1) /= 0 then
				register_file(to_integer(unsigned(i_waddr1))) <= i_wdata1;	
			end if;
		end if;
	end if;
end process;

-- Reads the data from the register file in async. way.
process(i_raddr1, i_raddr2)
begin
	if unsigned(i_raddr1) = 0 then
		o_rdata1 <= (others => '0');
	else
		o_rdata1 <= register_file(to_integer(unsigned(i_raddr1)));
	end if;
	if unsigned(i_raddr2) = 0 then
		o_rdata2 <= (others => '0');
	else
		o_rdata2 <= register_file(to_integer(unsigned(i_raddr2)));
	end if;
end process;

end Behavioral;

