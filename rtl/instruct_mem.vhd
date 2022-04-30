----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:45:10 04/18/2022 
-- Design Name: 
-- Module Name:    instruct_mem - Behavioral 
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

entity instruct_mem is
port(
	i_addr : in std_logic_vector(31 downto 0);
	o_data : out std_logic_vector(31 downto 0)
);
end instruct_mem;

architecture Behavioral of instruct_mem is

begin
process(i_addr)
begin
	case i_addr is
		when x"00400000" =>
			o_data <= "00000000001100010000001000110011";    --add x4,x2,x3
		when x"00400004" =>
			o_data <= "01000000011100101000000110110011";    --sub x3, x7, x5
		when x"00400008" =>
			o_data <= "00000000011100110111001010110011";    --and x5, x6, x7
		when x"0040000c" =>
			o_data <= "00000000011100110110001010110011";    --or x5, x6, x7
		when x"00400010" =>
			o_data <= "00000000011100110100001010110011";    --xor x5, x6, x7
		when x"00400014" =>
			o_data <= "00000000011100110010001010110011";   --slt x5, x6, x7 
		when x"00400018" =>
			o_data <= "00000000011100110001001010110011";   --sll x5, x6, x7
		when x"0040001c" =>
			o_data <= "00000000011100110101001010110011";   --srl x5, x6, x7 
		when x"00400020" =>
			o_data <= "01000000011100110101001010110011";    --sra x5, x6, x7
		when x"00400024" =>
			o_data <= "00000000011000111010000110110011";   --sltu x3, x7, x6
	    -----------------------------------------------------------------------------
		-----------------------------------------------------------------------------
		when x"00400028" =>
			o_data <= "00000000100000110000000110110011";    --add x3,x6,x8
		when x"0040002c" =>
			o_data <= "01000000100000111000001100110011";    --sub x6, x7, x8
		when x"00400030" =>
			o_data <= "00000000010100011111010000110011";    --and x8, x3, x5
		when x"00400034" =>
			o_data <= "00000000010100011110001000110011";    --or x4, x3, x5
		when x"00400038" =>
			o_data <= "00000000100100100100000110110011";    --xor x3, x4, x9
		when x"0040003c" =>
			o_data <= "00000000010001001010000110110011";   --slt x3, x9, x4 
		when x"00400040" =>
			o_data <= "00000000010100111001000110110011";   --sll x3, x7, x5
		when x"00400044" =>
			o_data <= "00000000011100110101001010110011";   --srl x3, x4, x5 
		when x"00400048" =>
			o_data <= "01000000010000011101001100110011";   --sra x6, x3, x4
		when x"0040004c" =>
			o_data <= "00000000010100011010001100110011";   --sltu x6, x3, x5
		-----------------------------------------------------------------------------
		--IMMEDIATE TYPE
		-----------------------------------------------------------------------------
		when x"00400050" =>
			o_data <= "00000001100001011000100010010011";   --addi x17, x11, 24 --"00000001100001011000100010010011"
		when x"00400054" =>
			o_data <= "00000010110110001011100100010011";   --sltiu x18, x17, 13
		when x"00400058" =>
			o_data <= "00000000110010010100001100010011";   --xori x6, x18, 12
			
		 -----------------------------------------------------------------------------
		-----------------------------------------------------------------------------
		when others =>
			o_data <=  (others => '0');
	end case;
end process;

end Behavioral;

