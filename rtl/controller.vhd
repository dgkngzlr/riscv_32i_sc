----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:05 04/22/2022 
-- Design Name: 
-- Module Name:    controller - Behavioral 
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

entity controller is
    Port ( i_opcode : in  STD_LOGIC_VECTOR (6 downto 0);
		   o_ImmSrc: out STD_LOGIC_VECTOR (1 downto 0);
		   o_RegDst : out  STD_LOGIC;
           o_PCSrc : out  STD_LOGIC;
		   o_MemRead : out  STD_LOGIC;
           o_MemtoReg : out  STD_LOGIC;
		   o_ALUOp : out  STD_LOGIC;
           o_MEMWrite : out  STD_LOGIC;
		   o_ALUSrc : out  STD_LOGIC;
           o_RegWrite : out  STD_LOGIC);
end controller;

architecture Behavioral of controller is

begin
process(i_opcode)
begin
	o_RegDst  <='0';
	o_PCSrc  <='0';
    o_MemRead <='0';
    o_MemtoReg<='0';
    o_ALUOp   <='0';
    o_MEMWrite<='0';
    o_ALUSrc  <='0';
    o_RegWrite<='0';
	o_ImmSrc<="11";
	case i_opcode is
	   when "0010011" =>--I type ALU
		
		    o_RegDst<='1';
			o_MemRead<='0';
			o_MemtoReg<='1';
			o_ALUOp<='1';
			o_MEMWrite<='0';
			o_ALUSrc<='1';
			o_RegWrite<='1';
			o_ImmSrc<="00";
	   when "0110011" =>-- R type ALU
			o_RegDst<='0';
			o_MemRead<='0';
			o_MemtoReg<='1';
			o_ALUOp<='1';
			o_MEMWrite<='0';
			o_ALUSrc<='0';
			o_RegWrite<='1';
			o_ImmSrc<="11";
		when others =>
			o_RegDst  <='0';
			o_PCSrc  <='0';
			o_MemRead <='0';
			o_MemtoReg<='0';
			o_ALUOp   <='0';
			o_MEMWrite<='0';
			o_ALUSrc  <='0';
			o_RegWrite<='0';
			o_ImmSrc<="11";
	
			
	end case;
end process;
end Behavioral;

