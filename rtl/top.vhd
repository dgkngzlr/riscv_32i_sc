----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2022 20:02:58
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
	Port(
		i_clk: in STD_LOGIC;
		i_rst: in STD_LOGIC
	);
end top;

architecture Behavioral of top is

signal pc_reg_output,pc_inc_output: STD_LOGIC_VECTOR(31 downto 0);
signal ins_mem_output: STD_LOGIC_VECTOR(31 downto 0);
signal dec_rs2,dec_rs1,dec_wreg: STD_LOGIC_VECTOR(4 downto 0);
signal dec_funct7: STD_LOGIC_VECTOR(6 downto 0);
signal dec_funct3: STD_LOGIC_VECTOR(2 downto 0);
signal dec_opcode: STD_LOGIC_VECTOR(6 downto 0);
signal con_RegDst, con_Branch, con_MemRead ,con_MemtoReg,con_ALUOp , con_MEMWrite , con_ALUSrc  , con_RegWrite : STD_LOGIC;
signal reg_file_data1, reg_file_data2:STD_LOGIC_VECTOR(31 downto 0);
signal alu_control_sel: STD_LOGIC_VECTOR(3 downto 0):="1111";
signal alu_result:STD_LOGIC_VECTOR(31 downto 0);
signal flag_C,flag_V, flag_N, flag_Z: STD_LOGIC;

component ALU is
    Port ( i_op_sel : in  STD_LOGIC_VECTOR (3 downto 0);
           i_sr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i_sr2 : in  STD_LOGIC_VECTOR (31 downto 0);
		   o_V: out STD_LOGIC;
		   o_N: out STD_LOGIC;
		   o_Z: out STD_LOGIC;
		   o_C: out STD_LOGIC;
           o_Result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALU_control is
    Port ( i_ALU_op : in  STD_LOGIC;
           i_func7 : in  STD_LOGIC_VECTOR (6 downto 0);
           i_func3 : in  STD_LOGIC_VECTOR (2 downto 0);
           o_op_sel : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder is
    Port ( i_instr : in  STD_LOGIC_VECTOR (31 downto 0);
		   o_funct7 : out  STD_LOGIC_VECTOR (6 downto 0);
		   o_r_reg1 : out  STD_LOGIC_VECTOR (4 downto 0);
		   o_r_reg2 : out  STD_LOGIC_VECTOR (4 downto 0);
           o_funct3 : out  STD_LOGIC_VECTOR (2 downto 0);
           o_wreg : out  STD_LOGIC_VECTOR (4 downto 0);
           o_opcode : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component controller is
    Port ( i_opcode : in  STD_LOGIC_VECTOR (6 downto 0);
		   o_RegDst : out  STD_LOGIC;
           o_Branch : out  STD_LOGIC;
		   o_MemRead : out  STD_LOGIC;
           o_MemtoReg : out  STD_LOGIC;
		   o_ALUOp : out  STD_LOGIC;
           o_MEMWrite : out  STD_LOGIC;
		   o_ALUSrc : out  STD_LOGIC;
           o_RegWrite : out  STD_LOGIC);
end component;

component instruct_mem is
	port(
		i_addr : in std_logic_vector(31 downto 0);
		o_data : out std_logic_vector(31 downto 0)
	);
end component;

component pc_inc is
port(
	i_data : in std_logic_vector(31 downto 0);
	o_data : out std_logic_vector(31 downto 0)
);
end component;

component pc_reg is
port(
	i_clk : in std_logic;
	i_rst : in std_logic;
	i_addr : in std_logic_vector(31 downto 0);
	o_addr : out std_logic_vector(31 downto 0)
);
end component;

component reg_file is
	
	port(i_clk : in std_logic;
		 i_wen : in std_logic;
		 i_raddr1 : in std_logic_vector(4 downto 0);
		 i_raddr2 : in std_logic_vector(4 downto 0);
		 i_waddr1 : in std_logic_vector(4 downto 0);
		 i_wdata1 : in std_logic_vector(31 downto 0);
		 o_rdata1 : out std_logic_vector(31 downto 0);
		 o_rdata2 : out std_logic_vector(31 downto 0)
		 );
	
end component;

begin

PC_reg1: pc_reg port map(i_clk=>i_clk,i_rst=>i_rst, i_addr=>pc_inc_output ,o_addr=>pc_reg_output);

PC_inc1: pc_inc port map(i_data=>pc_reg_output,o_data=>pc_inc_output);

ins_mem1:instruct_mem port map(i_addr=>pc_reg_output,o_data=>ins_mem_output);

decoder1: Decoder port map(i_instr=>ins_mem_output,
						   o_funct7=>dec_funct7,
						   o_r_reg1=>dec_rs2 ,
						   o_r_reg2=>dec_rs1,
						   o_funct3=>dec_funct3,
						   o_wreg=>dec_wreg,
						   o_opcode=>dec_opcode);
						   
controller1:controller port map(i_opcode=>dec_opcode,
								o_RegDst=>con_RegDst, 
								o_Branch=>con_Branch, 
								o_MemRead=>con_MemRead, 
								o_MemtoReg=>con_MemtoReg, 
								o_ALUOp=>con_ALUOp, 
								o_MEMWrite=>con_MEMWrite, 
								o_ALUSrc=>con_ALUSrc, 
								o_RegWrite=>con_RegWrite);
								
reg_file1:reg_file port map(i_clk=>i_clk,
							i_wen=>con_RegWrite,
							i_raddr1=>dec_rs1,
							i_raddr2=>dec_rs2,
							i_waddr1=>dec_wreg,
							i_wdata1=>alu_result,
							o_rdata1=>reg_file_data1,
							o_rdata2=>reg_file_data2);
							
alu_control1: ALU_control port map(i_ALU_op=>con_ALUOp,
								   i_func7=>dec_funct7,		
								   i_func3=>dec_funct3,
								   o_op_sel=>alu_control_sel);		
	
alu1: 	ALU port map(i_op_sel=>alu_control_sel,
					 i_sr1=>reg_file_data1,
					 i_sr2=>reg_file_data2,
					 o_V=>flag_V,
					 o_N=>flag_N,
					 o_Z=>flag_Z,
					 o_C=>flag_C,
					 o_Result=>alu_result);
					 
end Behavioral;
