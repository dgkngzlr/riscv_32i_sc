--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:01:30 03/02/2022
-- Design Name:   
-- Module Name:   C:/dev/ise/RegisterFile/register_file_tb.vhd
-- Project Name:  RegisterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file
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
use IEEE.NUMERIC_STD.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY reg_file_tb IS
END reg_file_tb;
 
ARCHITECTURE behavior OF reg_file_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_file
    PORT(i_clk : in std_logic;
		 i_wen : in std_logic;
		 i_raddr1 : in std_logic_vector(4 downto 0);
		 i_raddr2 : in std_logic_vector(4 downto 0);
		 i_waddr1 : in std_logic_vector(4 downto 0);
		 i_wdata1 : in std_logic_vector(31 downto 0);
		 o_rdata1 : out std_logic_vector(31 downto 0);
		 o_rdata2 : out std_logic_vector(31 downto 0)
		 );
    END COMPONENT;
    

   --Inputs
   signal i_clk : std_logic := '0';
   signal i_wen : std_logic := '0';
   signal i_waddr1 : std_logic_vector(4 downto 0) := (others => '0');
   signal i_wdata1 : std_logic_vector(31 downto 0) := (others => '0');
   signal i_raddr1 : std_logic_vector(4 downto 0) := (others => '0');
   signal i_raddr2 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal o_rdata1 : std_logic_vector(31 downto 0);
   signal o_rdata2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant i_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_file PORT MAP (
          i_clk => i_clk,
          i_wen => i_wen,
		  i_raddr1 => i_raddr1,
		  i_raddr2 => i_raddr2,
          i_waddr1 => i_waddr1,
          i_wdata1 => i_wdata1,
          o_rdata1 => o_rdata1,
          o_rdata2 => o_rdata2
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
    wait for 5 ns;
		
----------------------------
i_wen <= '1';
i_waddr1 <= "00000";
i_wdata1 <= x"11111111";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "00000";
i_raddr2 <= "00000";
wait for i_clk_period/2;
 assert o_rdata1 = x"11111111" report "Register(0) can not be written !" severity warning;
 assert o_rdata2 = x"11111111" report "Register(0) can not be written !" severity warning;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "00001";
i_wdata1 <= x"22222222";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "00001";
i_raddr2 <= "00001";
wait for i_clk_period/2;
 assert o_rdata1 = x"22222222" report "Register assertion error !" severity error;
 assert o_rdata2 = x"22222222" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "00010";
i_wdata1 <= x"33333333";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "00010";
i_raddr2 <= "00010";
wait for i_clk_period/2;
 assert o_rdata1 = x"33333333" report "Register assertion error !" severity error;
 assert o_rdata2 = x"33333333" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "00011";
i_wdata1 <= x"44444444";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "00011";
i_raddr2 <= "00011";
wait for i_clk_period/2;
 assert o_rdata1 = x"44444444" report "Register assertion error !" severity error;
 assert o_rdata2 = x"44444444" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "00100";
i_wdata1 <= x"55555555";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "00100";
i_raddr2 <= "00100";
wait for i_clk_period/2;
 assert o_rdata1 = x"55555555" report "Register assertion error !" severity error;
 assert o_rdata2 = x"55555555" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "00101";
i_wdata1 <= x"66666666";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "00101";
i_raddr2 <= "00101";
wait for i_clk_period/2;
 assert o_rdata1 = x"66666666" report "Register assertion error !" severity error;
 assert o_rdata2 = x"66666666" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "00110";
i_wdata1 <= x"77777777";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "00110";
i_raddr2 <= "00110";
wait for i_clk_period/2;
 assert o_rdata1 = x"77777777" report "Register assertion error !" severity error;
 assert o_rdata2 = x"77777777" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "00111";
i_wdata1 <= x"88888888";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "00111";
i_raddr2 <= "00111";
wait for i_clk_period/2;
 assert o_rdata1 = x"88888888" report "Register assertion error !" severity error;
 assert o_rdata2 = x"88888888" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "01000";
i_wdata1 <= x"99999999";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "01000";
i_raddr2 <= "01000";
wait for i_clk_period/2;
 assert o_rdata1 = x"99999999" report "Register assertion error !" severity error;
 assert o_rdata2 = x"99999999" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "01001";
i_wdata1 <= x"aaaaaaaa";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "01001";
i_raddr2 <= "01001";
wait for i_clk_period/2;
 assert o_rdata1 = x"aaaaaaaa" report "Register assertion error !" severity error;
 assert o_rdata2 = x"aaaaaaaa" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "01010";
i_wdata1 <= x"bbbbbbbb";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "01010";
i_raddr2 <= "01010";
wait for i_clk_period/2;
 assert o_rdata1 = x"bbbbbbbb" report "Register assertion error !" severity error;
 assert o_rdata2 = x"bbbbbbbb" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "01011";
i_wdata1 <= x"cccccccc";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "01011";
i_raddr2 <= "01011";
wait for i_clk_period/2;
 assert o_rdata1 = x"cccccccc" report "Register assertion error !" severity error;
 assert o_rdata2 = x"cccccccc" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "01100";
i_wdata1 <= x"dddddddd";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "01100";
i_raddr2 <= "01100";
wait for i_clk_period/2;
 assert o_rdata1 = x"dddddddd" report "Register assertion error !" severity error;
 assert o_rdata2 = x"dddddddd" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "01101";
i_wdata1 <= x"eeeeeeee";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "01101";
i_raddr2 <= "01101";
wait for i_clk_period/2;
 assert o_rdata1 = x"eeeeeeee" report "Register assertion error !" severity error;
 assert o_rdata2 = x"eeeeeeee" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "01110";
i_wdata1 <= x"ffffffff";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "01110";
i_raddr2 <= "01110";
wait for i_clk_period/2;
 assert o_rdata1 = x"ffffffff" report "Register assertion error !" severity error;
 assert o_rdata2 = x"ffffffff" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "01111";
i_wdata1 <= x"11111111";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "01111";
i_raddr2 <= "01111";
wait for i_clk_period/2;
 assert o_rdata1 = x"11111111" report "Register assertion error !" severity error;
 assert o_rdata2 = x"11111111" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "10000";
i_wdata1 <= x"22222222";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "10000";
i_raddr2 <= "10000";
wait for i_clk_period/2;
 assert o_rdata1 = x"22222222" report "Register assertion error !" severity error;
 assert o_rdata2 = x"22222222" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "10001";
i_wdata1 <= x"33333333";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "10001";
i_raddr2 <= "10001";
wait for i_clk_period/2;
 assert o_rdata1 = x"33333333" report "Register assertion error !" severity error;
 assert o_rdata2 = x"33333333" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "10010";
i_wdata1 <= x"44444444";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "10010";
i_raddr2 <= "10010";
wait for i_clk_period/2;
 assert o_rdata1 = x"44444444" report "Register assertion error !" severity error;
 assert o_rdata2 = x"44444444" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "10011";
i_wdata1 <= x"55555555";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "10011";
i_raddr2 <= "10011";
wait for i_clk_period/2;
 assert o_rdata1 = x"55555555" report "Register assertion error !" severity error;
 assert o_rdata2 = x"55555555" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "10100";
i_wdata1 <= x"66666666";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "10100";
i_raddr2 <= "10100";
wait for i_clk_period/2;
 assert o_rdata1 = x"66666666" report "Register assertion error !" severity error;
 assert o_rdata2 = x"66666666" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "10101";
i_wdata1 <= x"77777777";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "10101";
i_raddr2 <= "10101";
wait for i_clk_period/2;
 assert o_rdata1 = x"77777777" report "Register assertion error !" severity error;
 assert o_rdata2 = x"77777777" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "10110";
i_wdata1 <= x"88888888";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "10110";
i_raddr2 <= "10110";
wait for i_clk_period/2;
 assert o_rdata1 = x"88888888" report "Register assertion error !" severity error;
 assert o_rdata2 = x"88888888" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "10111";
i_wdata1 <= x"99999999";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "10111";
i_raddr2 <= "10111";
wait for i_clk_period/2;
 assert o_rdata1 = x"99999999" report "Register assertion error !" severity error;
 assert o_rdata2 = x"99999999" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "11000";
i_wdata1 <= x"aaaaaaaa";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "11000";
i_raddr2 <= "11000";
wait for i_clk_period/2;
 assert o_rdata1 = x"aaaaaaaa" report "Register assertion error !" severity error;
 assert o_rdata2 = x"aaaaaaaa" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "11001";
i_wdata1 <= x"bbbbbbbb";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "11001";
i_raddr2 <= "11001";
wait for i_clk_period/2;
 assert o_rdata1 = x"bbbbbbbb" report "Register assertion error !" severity error;
 assert o_rdata2 = x"bbbbbbbb" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "11010";
i_wdata1 <= x"cccccccc";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "11010";
i_raddr2 <= "11010";
wait for i_clk_period/2;
 assert o_rdata1 = x"cccccccc" report "Register assertion error !" severity error;
 assert o_rdata2 = x"cccccccc" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "11011";
i_wdata1 <= x"dddddddd";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "11011";
i_raddr2 <= "11011";
wait for i_clk_period/2;
 assert o_rdata1 = x"dddddddd" report "Register assertion error !" severity error;
 assert o_rdata2 = x"dddddddd" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "11100";
i_wdata1 <= x"eeeeeeee";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "11100";
i_raddr2 <= "11100";
wait for i_clk_period/2;
 assert o_rdata1 = x"eeeeeeee" report "Register assertion error !" severity error;
 assert o_rdata2 = x"eeeeeeee" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "11101";
i_wdata1 <= x"ffffffff";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "11101";
i_raddr2 <= "11101";
wait for i_clk_period/2;
 assert o_rdata1 = x"ffffffff" report "Register assertion error !" severity error;
 assert o_rdata2 = x"ffffffff" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "11110";
i_wdata1 <= x"11111111";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "11110";
i_raddr2 <= "11110";
wait for i_clk_period/2;
 assert o_rdata1 = x"11111111" report "Register assertion error !" severity error;
 assert o_rdata2 = x"11111111" report "Register assertion error !" severity error;

----------------------------
----------------------------
i_wen <= '1';
i_waddr1 <= "11111";
i_wdata1 <= x"22222222";
wait for i_clk_period/2;
 i_wen <= '0';
i_raddr1 <= "11111";
i_raddr2 <= "11111";
wait for i_clk_period/2;
 assert o_rdata1 = x"22222222" report "Register assertion error !" severity error;
 assert o_rdata2 = x"22222222" report "Register assertion error !" severity error;

----------------------------
      wait;
   end process;

END;
