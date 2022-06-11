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
signal pc_target_reg: STD_LOGIC_VECTOR(31 downto 0);
signal pc_src_mux_out: STD_LOGIC_VECTOR(31 downto 0);
signal ins_mem_output: STD_LOGIC_VECTOR(31 downto 0);
signal dec_rs2,dec_rs1,dec_wreg: STD_LOGIC_VECTOR(4 downto 0);
signal dec_funct7: STD_LOGIC_VECTOR(6 downto 0);
signal dec_funct3: STD_LOGIC_VECTOR(2 downto 0);
signal dec_opcode: STD_LOGIC_VECTOR(6 downto 0);
signal con_RegWrite, con_PCSrc, con_MemWrite ,con_ALUSrc, con_stall: STD_LOGIC;
signal con_ImmSrc,con_ResultSrc,con_ALUOp: STD_LOGIC_VECTOR(1 downto 0);
signal reg_file_data1, reg_file_data2:STD_LOGIC_VECTOR(31 downto 0);
signal alu_control_sel: STD_LOGIC_VECTOR(3 downto 0):="1111";
signal alu_result:STD_LOGIC_VECTOR(31 downto 0);
signal flag_C,flag_V, flag_N, flag_Z: STD_LOGIC;
signal sig_ex_out :STD_LOGIC_VECTOR(31 downto 0);
signal alu_src_mux_out: STD_LOGIC_VECTOR(31 downto 0);
signal data_mem_out: STD_LOGIC_VECTOR(31 downto 0);
signal write_data_mux_out: STD_LOGIC_VECTOR(31 downto 0);
signal pc_stall_logic, rf_en_signal : std_logic;
signal barret_done : std_logic := '0';
signal barret_result : STD_LOGIC_VECTOR(31 downto 0);

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
    Port ( i_ALU_op : in  STD_LOGIC_VECTOR(1 downto 0);
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
		   i_Zero   : in STD_LOGIC;
		   o_PCSrc: out STD_LOGIC;
		   o_ResultSrc : out  STD_LOGIC_VECTOR (1 downto 0);
           o_MemWrite : out  STD_LOGIC;
		   o_ALUSrc : out  STD_LOGIC;
           o_ImmSrc : out  STD_LOGIC_VECTOR (1 downto 0);
		   o_ALUOp : out  STD_LOGIC_VECTOR(1 downto 0);
           o_RegWrite : out  STD_LOGIC;
		   o_stall : out STD_LOGIC);
end component;

component instruct_mem is
	port(
		i_addr : in std_logic_vector(31 downto 0);
		o_data : out std_logic_vector(31 downto 0)
	);
end component;

component data_mem is
	port(
		i_clk : in std_logic;
		i_wen : in std_logic;
		i_addr : in std_logic_vector(31 downto 0);
		i_wdata : in std_logic_vector(31 downto 0);
		o_rdata : out std_logic_vector(31 downto 0)
	);
end component;

component write_data_mux is
    Port ( i_ResultSrc : in STD_LOGIC_VECTOR(1 downto 0);
           i_AluResult : in STD_LOGIC_VECTOR (31 downto 0);
           i_ReadData : in STD_LOGIC_VECTOR (31 downto 0);
		   i_PcInc : in STD_LOGIC_VECTOR (31 downto 0);
		   i_ReadBarret : in STD_LOGIC_VECTOR (31 downto 0);
           o_data: out STD_LOGIC_VECTOR (31 downto 0));
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
	i_en : in std_logic;
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

component sign_extend is
    Port ( i_imm : in STD_LOGIC_VECTOR (24 downto 0);
		   i_sel: in STD_LOGIC_VECTOR (1 downto 0);
           o_imm : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component alu_src_mux is
    Port ( i_AluSrc : in STD_LOGIC;
           i_rs2 : in STD_LOGIC_VECTOR (31 downto 0);
           i_imm : in STD_LOGIC_VECTOR (31 downto 0);
           o_reg : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component PC_target is
    Port ( i_data : in STD_LOGIC_VECTOR (31 downto 0);
           i_extended : in STD_LOGIC_VECTOR (31 downto 0);
           o_pctarget : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component PC_src_mux is
    Port ( i_pc_src: in STD_LOGIC;
		   i_in1 : in STD_LOGIC_VECTOR (31 downto 0);
           i_in2 : in STD_LOGIC_VECTOR (31 downto 0);
           o_muxout : out STD_LOGIC_VECTOR (31 downto 0));
end component;


component barret_top is
	Port ( i_clk : in std_logic;
		  i_start: in std_logic;
		  i_n    :in std_logic_vector(31 downto 0);
		  i_x    :in std_logic_vector(31 downto 0);
		  o_r    :out std_logic_vector(31 downto 0);
		  o_done   :out std_logic
		  );
end component;

begin

PC_reg1: pc_reg port map(i_clk=>i_clk,
					     i_rst=>i_rst,
						 i_en =>pc_stall_logic, 
						 i_addr=>pc_inc_output ,
						 o_addr=>pc_reg_output);

PC_inc1: pc_inc port map(i_data=>pc_reg_output,
						 o_data=>pc_inc_output);

PC_target1: PC_target port map(i_data=>pc_reg_output, 
							   i_extended=>sig_ex_out, 
							   o_pctarget=> pc_target_reg);

PC_src_mux1: PC_src_mux port map(i_pc_src=>con_PCSrc,
								 i_in1=>pc_inc_output,
								 i_in2=> pc_target_reg,
								 o_muxout=> pc_src_mux_out );

ins_mem1:instruct_mem port map(i_addr=>pc_src_mux_out ,
							   o_data=>ins_mem_output);

data_mem1: data_mem port map(i_clk=> i_clk,
							 i_wen=> con_MemWrite,
							 i_addr=>alu_result,
							 i_wdata=>reg_file_data2,
							 o_rdata=> data_mem_out);
							 
write_data_mux1: write_data_mux port map(i_ResultSrc=> con_ResultSrc,
										 i_AluResult=> alu_result,
										 i_ReadData=> data_mem_out,
										 i_PcInc=>pc_inc_output,
										 i_ReadBarret=>barret_result,
										 o_data=>write_data_mux_out);
										 
decoder1: Decoder port map(i_instr=>ins_mem_output,
						   o_funct7=>dec_funct7,
						   o_r_reg1=>dec_rs2 ,
						   o_r_reg2=>dec_rs1,
						   o_funct3=>dec_funct3,
						   o_wreg=>dec_wreg,
						   o_opcode=>dec_opcode);
	
sign_extend1: sign_extend port map(i_imm=>ins_mem_output(31 downto 7),
								   i_sel=> con_ImmSrc,
						           o_imm=>sig_ex_out
						   );

	
controller1:controller port map(i_opcode=>dec_opcode,
								i_Zero=>flag_Z,
								o_PCSrc=>con_PCSrc,
								o_ResultSrc=>con_ResultSrc, 
								o_MemWrite=>con_MEMWrite, 
								o_ALUSrc=>con_AluSrc, 
								o_ImmSrc=>con_ImmSrc, 
								o_ALUOp=>con_ALUOp, 
								o_RegWrite=>con_RegWrite,
								o_stall => con_stall);
								
reg_file1:reg_file port map(i_clk=>i_clk,
							i_wen=>rf_en_signal,
							i_raddr1=>dec_rs1,
							i_raddr2=>dec_rs2,
							i_waddr1=>dec_wreg,
							i_wdata1=>write_data_mux_out,
							o_rdata1=>reg_file_data1,
							o_rdata2=>reg_file_data2);
							
alu_control1: ALU_control port map(i_ALU_op=>con_ALUOp,
								   i_func7=>dec_funct7,		
								   i_func3=>dec_funct3,
								   o_op_sel=>alu_control_sel);		

alu_src_mux1: alu_src_mux port map( i_AluSrc => con_ALUSrc,
								    i_rs2 =>reg_file_data2,
								    i_imm => sig_ex_out,
								    o_reg => alu_src_mux_out);
	
alu1: 	ALU port map(i_op_sel=>alu_control_sel,
					 i_sr1=>reg_file_data1,
					 i_sr2=>alu_src_mux_out,
					 o_V=>flag_V,
					 o_N=>flag_N,
					 o_Z=>flag_Z,
					 o_C=>flag_C,
					 o_Result=>alu_result);

barret_1: barret_top port map ( i_clk =>i_clk,
							    i_start =>con_stall,
							    i_n    => reg_file_data2,
							    i_x    =>reg_file_data1,
							    o_r    =>barret_result,
							    o_done  =>barret_done);



pc_stall_logic <= (not con_stall) or barret_done;
rf_en_signal <= con_RegWrite or barret_done;		 
					 
end Behavioral;
