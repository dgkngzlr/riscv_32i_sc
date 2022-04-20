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

      i_addr <= x"00400000";
	  wait for 20 ns;
	  i_addr <= x"00400004";
	  wait for 20 ns;
	  i_addr <= x"00400008";
	  wait for 20 ns;
	  i_addr <= x"0040000c";
	  wait for 20 ns;
	  i_addr <= x"00400010";
	  wait for 20 ns;
	  i_addr <= x"00400014";
	  wait for 20 ns;
	  i_addr <= x"00400018";
	  wait for 20 ns;
	  i_addr <= x"0040001c";
	  wait for 20 ns;
	  i_addr <= x"00400020";
	  wait for 20 ns;
	  i_addr <= x"00400024";
	  wait for 20 ns;
	  i_addr <= x"00400028";
	  wait for 20 ns;
	  i_addr <= x"0040002c";
	  wait for 20 ns;
	  i_addr <= x"00400030";
	  wait for 20 ns;
	  i_addr <= x"00400034";
	  wait for 20 ns;
	  i_addr <= x"00400038";
	  wait for 20 ns;
	  i_addr <= x"0040003c";
	  wait for 20 ns;
	  i_addr <= x"00400040";
	  wait for 20 ns;
	  i_addr <= x"00400044";
	  wait for 20 ns;
	  i_addr <= x"00400048";
	  wait for 20 ns;
	  i_addr <= x"0040004c";
	  wait for 20 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
