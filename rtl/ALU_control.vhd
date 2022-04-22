----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:47:34 04/22/2022 
-- Design Name: 
-- Module Name:    ALU_control - Behavioral 
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

entity ALU_control is
    Port ( i_ALU_op : in  STD_LOGIC;
           i_func7 : in  STD_LOGIC_VECTOR (6 downto 0);
           i_func3 : in  STD_LOGIC_VECTOR (2 downto 0);
           o_op_sel : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_control;

architecture Behavioral of ALU_control is
signal sel: STD_LOGIC_VECTOR(3 downto 0);
begin

sel <= i_func7(5) & i_func3;

o_op_sel<= sel when i_ALU_op='1' else
		   "1111";	

end Behavioral;

