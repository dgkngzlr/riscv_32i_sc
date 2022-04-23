----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2022 21:03:40
-- Design Name: 
-- Module Name: sign_extend - Behavioral
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

entity sign_extend is
    Port ( i_imm : in STD_LOGIC_VECTOR (11 downto 0);
           o_imm : out STD_LOGIC_VECTOR (31 downto 0));
end sign_extend;

architecture Behavioral of sign_extend is

signal imm_temp: STD_LOGIC_VECTOR (31 downto 0);
signal sign_temp: STD_LOGIC;

begin

sign_temp<= i_imm(11);

imm_temp(31 downto 12)<=( others =>sign_temp );

imm_temp(11 downto 0)<=i_imm;

o_imm<=imm_temp;

end Behavioral;
