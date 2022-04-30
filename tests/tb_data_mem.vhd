--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:49:12 04/30/2022
-- Design Name:   
-- Module Name:   C:/dev/ISE-workspace/data_memory/tb_data_mem.vhd
-- Project Name:  data_memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: data_mem
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
 
ENTITY tb_data_mem IS
END tb_data_mem;
 
ARCHITECTURE behavior OF tb_data_mem IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT data_mem
    PORT(
         i_clk : IN  std_logic;
         i_wen : IN  std_logic;
         i_addr : IN  std_logic_vector(31 downto 0);
         i_wdata : IN  std_logic_vector(31 downto 0);
         o_rdata : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i_clk : std_logic := '0';
   signal i_wen : std_logic := '0';
   signal i_addr : std_logic_vector(31 downto 0) := (others => '0');
   signal i_wdata : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal o_rdata : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant i_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: data_mem PORT MAP (
          i_clk => i_clk,
          i_wen => i_wen,
          i_addr => i_addr,
          i_wdata => i_wdata,
          o_rdata => o_rdata
        );

   -- Clock process definitions
   i_clk_process :process
   begin
		i_clk <= '0';
		wait for i_clk_period/2;
		i_clk <= '1';
		wait for i_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      i_wen <= '1';
	  --wait for i_clk_period/2;
	  
	  i_addr <= x"FFFFFFFC";
	  i_wdata <= x"FFFFFFFF";
      
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFF8";
	  i_wdata <= x"EEEEEEEE";
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFF4";
	  i_wdata <= x"DDDDDDDD";
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFF0";
	  i_wdata <= x"CCCCCCCC";
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFEC";
	  i_wdata <= x"BBBBBBBB";
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFE8";
	  i_wdata <= x"AAAAAAAA";
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFE4";
	  i_wdata <= x"99999999";
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFE0";
	  i_wdata <= x"88888888";

      -- insert stimulus here 
	  wait for i_clk_period;
	  i_wen <= '0';
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFFC";
	  wait for i_clk_period;
	  assert o_rdata = x"FFFFFFFF" report "Memory read error !" severity error;
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFF8";
	  wait for i_clk_period;
	  assert o_rdata = x"EEEEEEEE" report "Memory read error !" severity error;
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFF4";
	  wait for i_clk_period;
	  assert o_rdata = x"DDDDDDDD" report "Memory read error !" severity error;
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFF0";
	  wait for i_clk_period;
	  assert o_rdata = x"CCCCCCCC" report "Memory read error !" severity error;
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFEC";
	  wait for i_clk_period;
	  assert o_rdata = x"BBBBBBBB" report "Memory read error !" severity error;
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFE8";
	  wait for i_clk_period;
	  assert o_rdata = x"AAAAAAAA" report "Memory read error !" severity error;
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFE4";
	  wait for i_clk_period;
	  assert o_rdata = x"99999999" report "Memory read error !" severity error;
	  
	  wait for i_clk_period;
	  i_addr <= x"FFFFFFE0";
	  wait for i_clk_period;
	  assert o_rdata = x"88888888" report "Memory read error !" severity error;

      wait;
   end process;

END;
