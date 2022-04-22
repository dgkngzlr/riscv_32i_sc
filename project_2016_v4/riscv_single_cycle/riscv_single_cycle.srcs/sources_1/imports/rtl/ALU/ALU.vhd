----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:18:44 04/06/2022 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( i_op_sel : in  STD_LOGIC_VECTOR (3 downto 0);
           i_sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (31 downto 0);
		   o_V: out STD_LOGIC;
		   o_N: out STD_LOGIC;
		   o_Z: out STD_LOGIC;
		   o_C: out STD_LOGIC;
           o_Result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

signal sel: STD_LOGIC_VECTOR (3 downto 0);

signal add_result, sub_result,sll_result, slt_result, sltu_result, xor_result,srl_result,sra_result,or_result,and_result:STD_LOGIC_VECTOR (31 downto 0);
signal add_carry, add_zero, add_negate,add_overflow: STD_LOGIC;
signal sub_carry, sub_zero, sub_negate,sub_overflow: STD_LOGIC;
signal Result_temp:STD_LOGIC_VECTOR (31 downto 0);
component ADD is
	generic(N: integer := 32);
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (N-1  downto 0);
           o_Sum : out  STD_LOGIC_VECTOR (N-1  downto 0);
           o_Carry : out  STD_LOGIC);
end component;

component SUB is
	generic(N: integer := 32);
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (N-1  downto 0);
           o_Sum : out  STD_LOGIC_VECTOR (N-1  downto 0);
           o_Carry : out  STD_LOGIC);
end component;
component SLL_op is
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i_sr2: in  STD_LOGIC_VECTOR (4 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component slt_module is
	generic(N: integer := 32);
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component sltu_module is
	generic(N: integer := 32);
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component xor_module is
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (31 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component srl_module is
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (4 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component or_module is
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (31 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component and_module is
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (31 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component sra_module is
    Port ( i_sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (4 downto 0);
           o_Result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

begin
adder1: ADD port map(i_sr1=>i_sr1,i_sr2=>i_sr2, o_Sum=>add_result, o_Carry=>add_carry);

subtractor1: SUB port map(i_sr1=>i_sr1,i_sr2=>i_sr2, o_Sum=>sub_result, o_Carry=> sub_carry);

sll_module1: SLL_op port map(i_sr1=>i_sr1,i_sr2=>i_sr2(4 downto 0), o_Result=>sll_result);

slt_module1: slt_module port map(i_sr1=>i_sr1,i_sr2=>i_sr2, o_Result=>slt_result);

sltu_module1: sltu_module port map(i_sr1=>i_sr1,i_sr2=>i_sr2, o_Result=>sltu_result);

xor_module1:xor_module port map(i_sr1=>i_sr1,i_sr2=>i_sr2, o_Result=>xor_result);

srl_module1:srl_module port map(i_sr1=>i_sr1,i_sr2=>i_sr2(4 downto 0), o_Result=>srl_result);

or_module1: or_module port map (i_sr1=>i_sr1,i_sr2=>i_sr2, o_Result=>or_result);

and_module1: and_module port map(i_sr1=>i_sr1,i_sr2=>i_sr2, o_Result=> and_result);

sra_module1: sra_module port map(i_sr1=>i_sr1,i_sr2=>i_sr2(4 downto 0),o_Result=> sra_result);

sel <= i_op_sel;


with sel select Result_temp <=
	add_result when "0000",
	sll_result when "0001",
	slt_result when "0010",
	sltu_result when "0011",
	xor_result when "0100",
	srl_result when "0101",
	or_result when "0110",
	and_result when "0111",
	sub_result when "1000",
	sra_result when "1101",
	x"00000000" when others;


add_overflow<= (add_result(31) xor i_sr1(31)) or (sel(3) xnor i_sr1(31) xnor i_sr2(31));
sub_overflow<= (sub_result(31) xor i_sr1(31)) or (sel(3) xnor i_sr1(31) xnor i_sr2(31));

o_Result<= Result_temp;
o_N<= Result_temp(31);

o_Z<= '1' when Result_temp= x"00000000" else
	'0';	
	
with sel select o_V<=
	add_overflow when "0000",
	sub_overflow when "1000",
	'0' when others;
	
with sel select o_C<=
	add_carry when "0000",
	sub_carry when "1000",
	'0' when others;
	

end Behavioral;

