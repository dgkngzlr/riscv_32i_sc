----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:45:13 04/06/2022 
-- Design Name: 
-- Module Name:    SLL - Behavioral 
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

entity SLL_op is
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i_sr2: in  STD_LOGIC_VECTOR (4 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (31 downto 0));
end SLL_op;

architecture Behavioral of SLL_op is

begin
process (i_sr1,i_sr2)
begin			
	o_Result <= std_logic_vector(unsigned(i_sr1) SLL(to_integer(unsigned(i_sr2))));	
end process;

end Behavioral;

