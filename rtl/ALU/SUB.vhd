----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:31:52 04/06/2022 
-- Design Name: 
-- Module Name:    SUB - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SUB is
	generic(N: integer := 32);
    Port ( sr1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           sr2 : in  STD_LOGIC_VECTOR (N-1  downto 0);
           sout : out  STD_LOGIC_VECTOR (N-1  downto 0);
           cout : out  STD_LOGIC);
end SUB;
architecture Behavioral of SUB is

signal result: STD_LOGIC_VECTOR(N downto 0);
signal not_SR2: STD_LOGIC_VECTOR(N-1 downto 0);
signal SR2_temp: STD_LOGIC_VECTOR(N-1 downto 0);
begin
	not_SR2<= not(sr2);
	SR2_temp<= STD_LOGIC_VECTOR(unsigned(not_SR2) +1);
	result <= ('0'& sr1) + ('0'& SR2_temp);
	sout   <= result(N-1  downto 0);
	cout<=result(N);

end Behavioral;

