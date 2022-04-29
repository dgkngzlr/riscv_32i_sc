----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2022 12:09:05
-- Design Name: 
-- Module Name: PC_src_mux - Behavioral
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

entity PC_src_mux is
    Port ( i_pc_src: in STD_LOGIC;
		   i_in1 : in STD_LOGIC_VECTOR (31 downto 0);
           i_in2 : in STD_LOGIC_VECTOR (31 downto 0);
           o_muxout : out STD_LOGIC_VECTOR (31 downto 0));
end PC_src_mux;

architecture Behavioral of PC_src_mux is

begin

o_muxout<= i_in1 when i_pc_src='0' else
		   i_in2;	
		   
end Behavioral;
