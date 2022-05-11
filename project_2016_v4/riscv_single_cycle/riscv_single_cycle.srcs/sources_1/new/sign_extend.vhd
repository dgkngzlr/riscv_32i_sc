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

--I type instructions  00
signal reg_imm_sign_temp: STD_LOGIC;
signal reg_imm_temp: STD_LOGIC_VECTOR (11 downto 0);
signal reg_imm_extended: STD_LOGIC_VECTOR (31 downto 0);

--S type instructions 01
signal s_imm_sign_temp: STD_LOGIC;
signal s_imm_temp: STD_LOGIC_VECTOR (11 downto 0);
signal s_imm_extended: STD_LOGIC_VECTOR (31 downto 0);

--B type instructions 10
signal b_imm_sign_temp: STD_LOGIC;
signal b_imm_temp: STD_LOGIC_VECTOR (12 downto 0);
signal b_imm_extended: STD_LOGIC_VECTOR (31 downto 0);

--J type instructions 11
signal j_imm_sign_temp: STD_LOGIC;
signal j_imm_temp: STD_LOGIC_VECTOR (19 downto 0);
signal j_imm_extended: STD_LOGIC_VECTOR (31 downto 0);

begin


--I type instructions  00
reg_imm_temp<= i_imm(24 downto 13);
reg_imm_sign_temp<= i_imm(24);
reg_imm_extended(11 downto 0) <= reg_imm_temp;
reg_imm_extended(31 downto 12)<=( others =>reg_imm_sign_temp);

--S type instructions 01
s_imm_temp<= i_imm(24 downto 18) & i_imm( 4 downto 0);
s_imm_sign_temp<=i_imm(24);
s_imm_extended(11 downto 0) <= s_imm_temp;
s_imm_extended(31 downto 12)<=( others =>s_imm_sign_temp);

--B type instructions 10
b_imm_temp<= i_imm(0) & i_imm(23 downto 17) & i_imm(4 downto 1) & '0';
b_imm_sign_temp<=i_imm(24);
b_imm_extended(12 downto 0) <= b_imm_temp;
b_imm_extended(31 downto 13)<=( others =>b_imm_sign_temp);

--J type instructions 11
j_imm_temp<= i_imm(12 downto 5)& i_imm(13)& i_imm(23 downto 14) &'0';

j_imm_sign_temp<=i_imm(24);
j_imm_extended(19 downto 0) <= j_imm_temp;
j_imm_extended(31 downto 20)<=( others =>j_imm_sign_temp);

with i_sel select
	imm_temp<= reg_imm_extended when "00",
			   s_imm_extended when "01",
			   b_imm_extended when "10",
			   j_imm_extended when others;
			   
o_imm<=imm_temp;

end Behavioral;
