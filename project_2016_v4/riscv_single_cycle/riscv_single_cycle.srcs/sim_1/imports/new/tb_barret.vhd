--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:35:05 06/11/2022
-- Design Name:   
-- Module Name:   G:/xlinx_projects/computer_arch/priorityencoder/tb_barret.vhd
-- Project Name:  priorityencoder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: barret_top
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
 
ENTITY tb_barret IS
END tb_barret;
 
ARCHITECTURE behavior OF tb_barret IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT barret_top
    PORT(
         i_clk : IN  std_logic;
         i_start : IN  std_logic;
         i_n : IN  std_logic_vector(31 downto 0);
         i_x : IN  std_logic_vector(31 downto 0);
         o_r : OUT  std_logic_vector(31 downto 0);
         o_done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i_clk : std_logic := '0';
   signal i_start : std_logic := '0';
   signal i_n : std_logic_vector(31 downto 0) := (others => '0');
   signal i_x : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal o_r : std_logic_vector(31 downto 0);
   signal o_done : std_logic;

   -- Clock period definitions
   constant i_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: barret_top PORT MAP (
          i_clk => i_clk,
          i_start => i_start,
          i_n => i_n,
          i_x => i_x,
          o_r => o_r,
          o_done => o_done
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
      
	  i_start<='1';
	  i_n<=x"0000001F";
	  i_x<=x"000003C1";
      wait for i_clk_period*12;
	  wait for 5 ns;
	  i_n<=x"0000001F";
	  i_x<=x"000003A1";
      wait for i_clk_period*9;
	  i_n<=x"00000100";
	  i_x<=x"000002D3";
      wait for i_clk_period*12;

      -- insert stimulus here 

      wait;
   end process;

END;
