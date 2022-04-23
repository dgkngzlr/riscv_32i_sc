----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:25:55 03/27/2022 
-- Design Name: 
-- Module Name:    check_unsigned_less - Behavioral 
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
USE ieee.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sltu_module is
	generic(N: integer := 32);
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (N-1 downto 0));
end sltu_module;

architecture Behavioral of sltu_module is

signal sr1_u,sr2_u: unsigned (N-1 downto 0);
signal result_temp: std_logic;
begin
sr1_u<= unsigned(i_sr1);
sr2_u<= unsigned(i_sr2);
process(i_sr1,i_sr2)
	begin
		if(i_sr1<=i_sr2) then
			result_temp<='1';
		else
			result_temp<='0';
		end if;
end process;
o_Result(30 downto 0)<=x"0000000"&"000";
o_Result(31)<= result_temp;

end Behavioral;

