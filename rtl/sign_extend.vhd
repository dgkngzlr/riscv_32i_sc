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
    Port ( i_imm : in STD_LOGIC_VECTOR (24 downto 0);
		   i_sel: in STD_LOGIC_VECTOR (1 downto 0);
           o_imm : out STD_LOGIC_VECTOR (31 downto 0));
end sign_extend;

architecture Behavioral of sign_extend is

signal imm_temp: STD_LOGIC_VECTOR (31 downto 0);

signal reg_imm_sign_temp: STD_LOGIC;

signal reg_imm_temp: STD_LOGIC_VECTOR (11 downto 0);

signal reg_imm_extended: STD_LOGIC_VECTOR (31 downto 0);
begin



reg_imm_temp<= i_imm(24 downto 13);

reg_imm_sign_temp<= reg_imm_temp(11);

reg_imm_extended(11 downto 0) <= reg_imm_temp;

reg_imm_extended(31 downto 12)<=( others =>reg_imm_sign_temp);


with i_sel select
	imm_temp<= reg_imm_extended when "00",
				x"00000000" when others;
		   
o_imm<=imm_temp;

end Behavioral;
