----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2022 16:48:49
-- Design Name: 
-- Module Name: write_data_mux - Behavioral
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

entity write_data_mux is
    Port ( i_ResultSrc : in STD_LOGIC_VECTOR(1 downto 0);
           i_AluResult : in STD_LOGIC_VECTOR (31 downto 0);
           i_ReadData : in STD_LOGIC_VECTOR (31 downto 0);
		   i_PcInc : in STD_LOGIC_VECTOR (31 downto 0);
		   i_ReadBarret : in STD_LOGIC_VECTOR (31 downto 0);
           o_data: out STD_LOGIC_VECTOR (31 downto 0));
end write_data_mux;

architecture Behavioral of write_data_mux is

begin

o_data<= i_AluResult when i_ResultSrc="00" else
		 i_ReadData when i_ResultSrc="01" else
		 i_PcInc when i_ResultSrc="10" else
		 i_ReadBarret;
end Behavioral;
