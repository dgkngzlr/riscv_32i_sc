----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.04.2022 22:04:34
-- Design Name: 
-- Module Name: alu_src_mux - Behavioral
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

entity alu_src_mux is
    Port ( i_AluSrc : in STD_LOGIC;
           i_rs2 : in STD_LOGIC_VECTOR (31 downto 0);
           i_imm : in STD_LOGIC_VECTOR (31 downto 0);
           o_reg : out STD_LOGIC_VECTOR (31 downto 0));
end alu_src_mux;

architecture Behavioral of alu_src_mux is

begin

o_reg<= i_rs2 when i_AluSrc='0' else
		i_imm;	
end Behavioral;
