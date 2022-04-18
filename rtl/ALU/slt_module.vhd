----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:27 03/27/2022 
-- Design Name: 
-- Module Name:    slt_module - Behavioral 
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

entity slt_module is
	generic(N: integer := 32);
    Port ( sr1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           sr2 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           result : out  STD_LOGIC_VECTOR (N-1 downto 0));
end slt_module;

architecture Behavioral of slt_module is

component SUB is
	generic(N: integer := 32);
    Port ( sr1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           sr2 : in  STD_LOGIC_VECTOR (N-1  downto 0);
           sout : out  STD_LOGIC_VECTOR (N-1  downto 0);
           cout : out  STD_LOGIC);
end component;

signal sub_carry,diff_most :STD_LOGIC;
signal and_result1,and_result2,and_result3: STD_LOGIC;
signal sub_result:STD_LOGIC_VECTOR(N-1 downto 0);
begin

	subtractor: SUB port map(sr1,sr2,sub_result,sub_carry);
	diff_most<= sub_result(31);
	and_result1<= (not sr1(31) and (not diff_most));
	and_result2<= (not sr1(31)) and sr2(31);
	and_result3<= (sr2(31)) and (not diff_most);
	result(31 downto 1)<=x"0000000"&"000";
	result(0)     <= (not (and_result1 or and_result2 or and_result3));
end Behavioral;

