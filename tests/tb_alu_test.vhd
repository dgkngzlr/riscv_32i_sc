--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:59:05 04/07/2022
-- Design Name:   
-- Module Name:   G:/xlinx_projects/computer_arch/ALU32RiscV/alu_test.vhd
-- Project Name:  ALU32RiscV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY tb_alu_test IS
END tb_alu_test;
 
ARCHITECTURE behavior OF tb_alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         i_func3 : IN  std_logic_vector(2 downto 0);
         i_func7 : IN  std_logic_vector(6 downto 0);
         i_sr1 : IN  std_logic_vector(31 downto 0);
         i_sr2 : IN  std_logic_vector(31 downto 0);
         o_V : OUT  std_logic;
         o_N : OUT  std_logic;
         o_Z : OUT  std_logic;
         o_C : OUT  std_logic;
         o_Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i_func3 : std_logic_vector(2 downto 0) := (others => '0');
   signal i_func7 : std_logic_vector(6 downto 0) := (others => '0');
   signal i_sr1 : std_logic_vector(31 downto 0) := (others => '0');
   signal i_sr2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal o_V : std_logic;
   signal o_N : std_logic;
   signal o_Z : std_logic;
   signal o_C : std_logic;
   signal o_Result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          i_func3 => i_func3,
          i_func7 => i_func7,
          i_sr1 => i_sr1,
          i_sr2 => i_sr2,
          o_V => o_V,
          o_N => o_N,
          o_Z => o_Z,
          o_C => o_C,
          o_Result => o_Result
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
	  i_func3<="000";
	  i_func7<="0000000";
	  i_sr1<=x"00110011";
	  i_sr2<=x"00110011";
      wait for 10 ns;
	  i_func3<="000";
	  i_func7<="0100000";
	  i_sr1<=x"00110011";
	  i_sr2<=x"00110011";
      wait for 10 ns;
	  i_func3<="001";
	  i_func7<="0000000";
	  i_sr1<=x"FFF10011";
	  i_sr2<=x"00000011";
      wait for 10 ns;
	  i_func3<="010";
	  i_func7<="0000000";
	  i_sr1<=x"FFFF0011";
	  i_sr2<=x"FFFF0011";
      wait for 10 ns;
	  i_func3<="000";
	  i_func7<="0000000";
	  i_sr1<=x"80110011";
	  i_sr2<=x"FF110011";
      wait for 10 ns;
	  i_func3<="100";
	  i_func7<="0000000";
	  i_sr1<=x"0FFFFFF1";
	  i_sr2<=x"00100011";
      wait for 10 ns;
	  i_func3<="101";
	  i_func7<="0000000";
	  i_sr1<=x"7FFFFFFF";
	  i_sr2<=x"7FFFFFFF";
      wait for 10 ns;
	  i_func3<="110";
	  i_func7<="0000000";
	  i_sr1<=x"80000000";
	  i_sr2<=x"00110011";
      wait for 10 ns;
	  i_func3<="111";
	  i_func7<="0000000";
	  i_sr1<=x"7FFFFFFF";
	  i_sr2<=x"80000000";
      wait for 10 ns;
	  i_func3<="000";
	  i_func7<="0100000";
	  i_sr1<=x"80000000";
	  i_sr2<=x"7FFFFFFF";

      -- insert stimulus here 

      wait;
   end process;

END;
