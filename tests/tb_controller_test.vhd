--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:27:53 04/22/2022
-- Design Name:   
-- Module Name:   G:/xlinx_projects/computer_arch/Controller/tb_controller_test.vhd
-- Project Name:  Controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: controller
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_controller_test IS
END tb_controller_test;
 
ARCHITECTURE behavior OF tb_controller_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controller
    PORT(
         i_opcode : IN  std_logic_vector(6 downto 0);
         o_RegDst : OUT  std_logic;
         o_Branch : OUT  std_logic;
         o_MemRead : OUT  std_logic;
         o_MemtoReg : OUT  std_logic;
         o_ALUOp : OUT  std_logic;
         o_MEMWrite : OUT  std_logic;
         o_ALUSrc : OUT  std_logic;
         o_RegWrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i_opcode : std_logic_vector(6 downto 0) := (others => '0');

 	--Outputs
   signal o_RegDst : std_logic;
   signal o_Branch : std_logic;
   signal o_MemRead : std_logic;
   signal o_MemtoReg : std_logic;
   signal o_ALUOp : std_logic;
   signal o_MEMWrite : std_logic;
   signal o_ALUSrc : std_logic;
   signal o_RegWrite : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controller PORT MAP (
          i_opcode => i_opcode,
          o_RegDst => o_RegDst,
          o_Branch => o_Branch,
          o_MemRead => o_MemRead,
          o_MemtoReg => o_MemtoReg,
          o_ALUOp => o_ALUOp,
          o_MEMWrite => o_MEMWrite,
          o_ALUSrc => o_ALUSrc,
          o_RegWrite => o_RegWrite
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
	  i_opcode<="0010011";
	  wait for 100 ns;	
      i_opcode<="0110011";

      -- insert stimulus here 

      wait;
   end process;

END;
