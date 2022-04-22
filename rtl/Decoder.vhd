----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:46:57 04/18/2022 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is
    Port ( i_instr : in  STD_LOGIC_VECTOR (31 downto 0);
		   o_funct7 : out  STD_LOGIC_VECTOR (6 downto 0);
		   o_r_reg1 : out  STD_LOGIC_VECTOR (4 downto 0);
		   o_r_reg2 : out  STD_LOGIC_VECTOR (4 downto 0);
           o_funct3 : out  STD_LOGIC_VECTOR (2 downto 0);
           o_wreg : out  STD_LOGIC_VECTOR (4 downto 0);
           o_opcode : out  STD_LOGIC_VECTOR (6 downto 0));
end Decoder;

architecture Behavioral of Decoder is
signal funct7: STD_LOGIC_VECTOR(6 downto 0);
signal funct3: STD_LOGIC_VECTOR(2 downto 0);
signal rs2: STD_LOGIC_VECTOR(4 downto 0);
signal rs1: STD_LOGIC_VECTOR(4 downto 0);
signal rd: STD_LOGIC_VECTOR(4 downto 0);
signal opcode:STD_LOGIC_VECTOR(6 downto 0);
--signal imm: STD_LOGIC_VECTOR(11 downto 0);

begin

funct7<= i_instr(31 downto 25);
rs2<= i_instr(24 downto 20);
rs1<= i_instr(19 downto 15);
funct3<= i_instr(14 downto 12);
rd<= i_instr(11 downto 7);
opcode<= i_instr(6 downto 0);

o_funct7<=funct7;
o_r_reg1<=rs2;
o_r_reg2<=rs1;
o_funct3<=funct3;
o_wreg<=rd;
o_opcode<=opcode;

end Behavioral;

