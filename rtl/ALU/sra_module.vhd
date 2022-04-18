----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:08:58 04/07/2022 
-- Design Name: 
-- Module Name:    sra_module - Behavioral 
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

entity sra_module is
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (4 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (31 downto 0));
end sra_module;

architecture Behavioral of sra_module is

begin
process (i_sr1,i_sr2)
begin			
	o_Result <= to_stdlogicvector(to_bitvector(i_sr1) SRA (to_integer(unsigned(i_sr2))));	
end process;


end Behavioral;
