----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:05:55 04/07/2022 
-- Design Name: 
-- Module Name:    srl_module - Behavioral 
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity srl_module is
    Port ( sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           sr2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end srl_module;

architecture Behavioral of srl_module is

begin
process (sr1,sr2)
begin			
	Result <= std_logic_vector(unsigned(sr1) SRL (to_integer(unsigned(sr2))));	
end process;


end Behavioral;