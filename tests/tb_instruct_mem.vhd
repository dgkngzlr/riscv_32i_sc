--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:39:32 04/18/2022
-- Design Name:   
-- Module Name:   C:/dev/ISE-workspace/instruction_memory/tb_instruct_mem.vhd
-- Project Name:  instruction_memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instruct_mem
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
 
ENTITY tb_instruct_mem IS
END tb_instruct_mem;
 
ARCHITECTURE behavior OF tb_instruct_mem IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instruct_mem
    PORT(
         i_addr : IN  std_logic_vector(31 downto 0);
         o_data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i_addr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal o_data : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instruct_mem PORT MAP (
          i_addr => i_addr,
          o_data => o_data
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      i_addr <= x"00000000";
	  wait for 20 ns;
	  i_addr <= x"00000004";
	  wait for 20 ns;
	  i_addr <= x"00000008";
	  wait for 20 ns;
	  i_addr <= x"0000000c";
	  wait for 20 ns;
	  i_addr <= x"00000010";
	  wait for 20 ns;
	  i_addr <= x"00000014";
	  wait for 20 ns;
	  i_addr <= x"00000018";
	  wait for 20 ns;
	  i_addr <= x"0000001c";
	  wait for 20 ns;
	  i_addr <= x"00000020";
	  wait for 20 ns;
	  i_addr <= x"00000024";
	  wait for 20 ns;
	  i_addr <= x"00000028";
	  wait for 20 ns;
	  i_addr <= x"0000002c";
	  wait for 20 ns;
	  i_addr <= x"00000030";
	  wait for 20 ns;
	  i_addr <= x"00000034";
	  wait for 20 ns;
	  i_addr <= x"00000038";
	  wait for 20 ns;
	  i_addr <= x"0000003c";
	  wait for 20 ns;
	  i_addr <= x"00000040";
	  wait for 20 ns;
	  i_addr <= x"00000044";
	  wait for 20 ns;
	  i_addr <= x"00000048";
	  wait for 20 ns;
	  i_addr <= x"0000004c";
	  wait for 20 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
