--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:20:41 04/18/2022
-- Design Name:   
-- Module Name:   G:/xlinx_projects/computer_arch/DecoderRISCV/tb_decoder_test.vhd
-- Project Name:  DecoderRISCV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder
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
 
ENTITY tb_decoder_test IS
END tb_decoder_test;
 
ARCHITECTURE behavior OF tb_decoder_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         i_instr : IN  std_logic_vector(31 downto 0);
         o_r_reg1 : OUT  std_logic_vector(4 downto 0);
         o_r_reg2 : OUT  std_logic_vector(4 downto 0);
         o_wreg : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i_instr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal o_r_reg1 : std_logic_vector(4 downto 0);
   signal o_r_reg2 : std_logic_vector(4 downto 0);
   signal o_wreg : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          i_instr => i_instr,
          o_r_reg1 => o_r_reg1,
          o_r_reg2 => o_r_reg2,
          o_wreg => o_wreg
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
	  i_instr<="00000000000000101000010101100110";
	  wait for 10 ns;	
      i_instr<="00000001010000110001000110110010";
	  wait for 10 ns;	
	  i_instr<="00000001011011001011011100110011";
	  wait for 10 ns;	
	  i_instr<="00000001001100101111111110110011";
	  wait for 10 ns;	
	  i_instr<="01000000110110111000110100110011";
	  wait for 10 ns;	
	  i_instr<="01000001010100110101000101010101";

      -- insert stimulus here 

      wait;
   end process;

END;
