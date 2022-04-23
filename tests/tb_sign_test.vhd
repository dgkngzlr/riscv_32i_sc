--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:11:35 04/23/2022
-- Design Name:   
-- Module Name:   G:/xlinx_projects/computer_arch/ssas/tb_sign_test.vhd
-- Project Name:  ssas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sign_extend
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
 
ENTITY tb_sign_test IS
END tb_sign_test;
 
ARCHITECTURE behavior OF tb_sign_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sign_extend
    PORT(
         i_imm : IN  std_logic_vector(11 downto 0);
         o_imm : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i_imm : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal o_imm : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sign_extend PORT MAP (
          i_imm => i_imm,
          o_imm => o_imm
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
	  i_imm<="000000001111";
	  wait for 10 ns;	
      i_imm<="110000001111";
	  wait for 10 ns;	
	  i_imm<="100000001111";
	  wait for 10 ns;	
	  i_imm<="111100001111";
	  wait for 10 ns;	
	  i_imm<="000111001111";

      -- insert stimulus here 

      wait;
   end process;

END;
