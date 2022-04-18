----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:32:55 04/06/2022 
-- Design Name: 
-- Module Name:    ADD - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD is
	generic(N: integer := 32);
    Port ( sr1 : in  STD_LOGIC_VECTOR (N-1 downto 0);
           sr2 : in  STD_LOGIC_VECTOR (N-1  downto 0);
           sout : out  STD_LOGIC_VECTOR (N-1  downto 0);
           cout : out  STD_LOGIC);
end ADD;
architecture Behavioral of ADD is

signal sum: STD_LOGIC_VECTOR(N downto 0);
	
begin

	sum <= ('0'& sr1) + ('0'& sr2);
	sout   <= sum(N-1  downto 0);
	cout<=sum(N);
end Behavioral;

