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
		   i_Zero   : in STD_LOGIC;
		   o_PCSrc: out STD_LOGIC;
		   o_ResultSrc : out  STD_LOGIC_VECTOR (1 downto 0);
           o_MemWrite : out  STD_LOGIC;
		   o_ALUSrc : out  STD_LOGIC;
           o_ImmSrc : out  STD_LOGIC_VECTOR (1 downto 0);
		   o_ALUOp : out  STD_LOGIC_VECTOR(1 downto 0);
           o_RegWrite : out  STD_LOGIC;
		   o_stall : out STD_LOGIC);
end controller;

architecture Behavioral of controller is

signal sig_Branch, sig_Jump,sig_PCSrc, sig_MemWrite,sig_ALUSrc,sig_RegWrite,sig_stall: STD_LOGIC;
signal sig_ResultSrc, sig_ImmSrc,sig_ALUOp: STD_LOGIC_VECTOR(1 downto 0);
signal ResultAnd,ResultOr:STD_LOGIC;

begin
process(i_opcode,i_Zero)
begin
	sig_PCSrc  <='0';
	sig_ResultSrc  <="00";
    sig_MemWrite <='0';
    sig_ALUSrc<='0';
    sig_ImmSrc   <="00";
    sig_ALUOp<="00";
    sig_RegWrite<='0';
	sig_Branch<='0';
	sig_Jump<='0';
	sig_stall <= '0';
	case i_opcode is
	   when "0010011" =>--I type ALU
			sig_Jump<='0';
			sig_ALUOp<="10";
			sig_Branch<='0';
			sig_ResultSrc  <="00";
			sig_MEMWrite<='0';
			sig_ALUSrc<='1';
			sig_RegWrite<='1';
			sig_ImmSrc<="00";
	   when "0110011" =>-- R type ALU
			sig_Jump<='0';
			sig_ALUOp<="10";
			sig_Branch<='0';
			sig_ResultSrc  <="00";
			sig_MEMWrite<='0';
			sig_ALUSrc<='0';
			sig_RegWrite<='1';
			sig_ImmSrc<="00";--xx
	   when "0000011" =>-- lw type 
			sig_Jump<='0';
			sig_ALUOp<="00";
			sig_Branch<='0';
			sig_ResultSrc  <="01";
			sig_MEMWrite<='0';
			sig_ALUSrc<='1';
			sig_RegWrite<='1';
			sig_ImmSrc<="00";
	   when "0100011" =>-- sw type 
			sig_Jump<='0';
			sig_ALUOp<="00";
			sig_Branch<='0';
			sig_ResultSrc  <="00";--xx
			sig_MEMWrite<='1';
			sig_ALUSrc<='1';
			sig_RegWrite<='0';
			sig_ImmSrc<="01";
	   when "1100011" =>-- beq type 
			sig_Jump<='0';
			sig_ALUOp<="01";
			sig_Branch<='1';
			sig_ResultSrc  <="00";--xx
			sig_MEMWrite<='0';
			sig_ALUSrc<='0';
			sig_RegWrite<='0';
			sig_ImmSrc<="10";
	   when "1101111" =>-- jal type 
			sig_Jump<='1';
			sig_ALUOp<="00";--xx
			sig_Branch<='0';
			sig_ResultSrc  <="10";
			sig_MEMWrite<='0';
			sig_ALUSrc<='0';--x
			sig_RegWrite<='1';
			sig_ImmSrc<="11";
		
	   when "1111000" => -- custom instruction
			sig_Jump<='0';
			sig_ALUOp<="10"; --??
			sig_Branch<='0';
			sig_ResultSrc  <="11";
			sig_MEMWrite<='0';
			sig_ALUSrc<='0';
			sig_RegWrite<='0'; -- dont write until done
			sig_ImmSrc<="00";--xx
			sig_stall <= '1';
	   when others =>
			sig_Jump<='0';
			sig_ALUOp<="00";
			sig_Branch<='0';
			sig_ResultSrc  <="00";
			sig_MEMWrite<='0';
			sig_ALUSrc<='0';
			sig_RegWrite<='0';
			sig_ImmSrc<="00";
	end case;
end process;
ResultAnd<=sig_Branch and i_Zero;
ResultOr<= ResultAnd or sig_Jump;

o_PCSrc<=ResultOr;
o_ALUOp<=sig_ALUOp;
o_ResultSrc<=sig_ResultSrc;
o_MemWrite<=sig_MEMWrite;
o_ALUSrc<=sig_ALUSrc;
o_RegWrite<=sig_RegWrite;
o_ImmSrc<=sig_ImmSrc;
o_stall <= sig_stall;
end Behavioral;

