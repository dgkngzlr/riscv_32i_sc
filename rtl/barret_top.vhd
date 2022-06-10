----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2022 17:17:38
-- Design Name: 
-- Module Name: barret_top - Behavioral
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

entity barret_top is
	Port ( 
		  i_clk : in std_logic;
		  i_start: in std_logic;
		  i_n    :in std_logic_vector(31 downto 0);
		  i_x    :in std_logic_vector(31 downto 0);
		  o_r    :out std_logic_vector(31 downto 0);
		  o_done   :out std_logic
		  );
end barret_top;

architecture Behavioral of barret_top is

type FSM is (Idle, MemCheck,FindK_Step_1, FindK_Step_2, shift_left_1, Exponentiation, division_1,multiplication_1, shift_right_1,multiplication_2,subtract,decision,final;
signal current_state, next_state: FSM;

signal k_value, r_value, prio_result, div_result , mul_result: std_logic_vector(31 downto 0);
signal temp_div_a, temp_div_b, temp_mul_a , temp_mul_b: std_logic_vector(31 downto 0);
signal temp_exp : std_logic_vector(31 downto 0);
signal mem_key :  std_logic_vector(31 downto 0):=x"00000000";
signal mem_result:  std_logic_vector(31 downto 0):=x"00000000";
signal mem_flag: std_logic;

signal temp_mul_r1, temp_sub_r1, temp_mul_r2, temp_shift_r1: std_logic_vector(31 downto 0);

signal final_result_temp : std_logic_vector(31 downto 0):=x"00000000";

component enchanced_priority is
	port(
		i_clk : in std_logic;
		i_en:	in std_logic;
		i_n : in std_logic_vector(31 downto 0);
		o_r : out std_logic_vector(31 downto 0)
	);
end component;

component mult is
	port(
		i_en: in std_logic;
		i_a : in std_logic_vector(31 downto 0);
		i_b : in std_logic_vector(31 downto 0);
		o_r : out std_logic_vector(31 downto 0)
	);
end component;

component div is
	port(
		i_en: in std_logic;
		i_a : in std_logic_vector(31 downto 0);
		i_b : in std_logic_vector(31 downto 0);
		o_r : out std_logic_vector(31 downto 0)
	);
end component;

begin

priority_1: enchanced_priority port map( i_clk => i_clk,
										 i_en=>i=>priority_1_en,
									     i_n=>i_n,
										 o_r=>prio_result);

div_1: div port map					   ( i_en=>i=>div_1_en,
									     i_a=>temp_div_a,
										 i_b=>temp_div_b,
										 o_r=>div_result);
										 
mul_1: mult port map				   ( i_en=>i=>mul_1_en,
									     i_a=>temp_mul_a,
										 i_b=>temp_mul_b,
										 o_r=>mul_result);
								
mem_1: memxxxx port map				   ( i_a=>mem_key,
										 o_flag=>mem_flag,
										 o_r=>mem_result);
										 
process(i_clk,i_en)
begin 
	if(rising_edge(i_clk)) then
		current_state <= next_state;
	else
	current_state<=current_state;
 end if;
end process;


process(current_state,i_k)
begin
	mem_key<= i_n;
	o_done<='0';
	case(current_state) is
	
		when Idle =>
			if(i_start = '1') then
				next_state <= MemCheck; 
			else
				next_state <= Idle;
			end if;
	
		when MemCheck =>
			if(mem_flag='1') then   --MEMORY CHECK WILL BE IMPLEMENTED
				r_value<=mem_result;
				next_state <= SKIP; -- NOT IMPLEMENTED
			else
				next_state <= FindK_Step_1;
			end if;
			
		when FindK_Step_1 =>     --FIRST STEP OF PRECOMPUTATION
			priority_1_en<='1';
			next_state <= FindK_Step_2;
			
		when FindK_Step_2 =>
			k_value <= prio_result
			next_state <= shift_left_1;
			
		when shift_left_1 =>
			priority_1_en<='0';
			k_value <= k_value sll 1;
			next_state <= Exponentiation;
			
		when Exponentiation => 
			temp_exp <= 2 ** k_value;
			next_state <= division_1;
			
		when division_1 =>  	--LAST STEP OF PRECOMPUTATION
			div_1_en<='1';
			temp_div_a<=temp_exp;
			temp_div_b<=i_n;
			
			r_value<=div_result;
			next_state <= Zero;
			
		when multiplication_1 =>     --REDUCTION PART
			mul_1_en<='1';
			div_1_en<='0';
			
			temp_mul_a<=i_x;
			temp_mul_b<=r_value;
	
			temp_mul_r1<=mul_result;
			next_state <= shift_right_1;
			
		when shift_right_1 =>  	
			mul_1_en<='0';
			
			temp_shift_r1 <= mul_result sll to_integer(unsigned(temp_exp));
			next_state <= multiplication_2;
			
		when multiplication_2 =>     
			mul_1_en<='1';
			
			temp_mul_a<=temp_shift_r1;
			temp_mul_b<=i_n;
	
			temp_mul_r2<=mul_result;
			next_state <= subtract;
		
		when subtract =>     
			mul_1_en<='0';
			
			temp_sub_r1<= std_logic_vector(unsigned(i_x) - unsigned(temp_mul_r2));
			
			next_state <= decision;
	
		when decision =>     
			mul_1_en<='0';
			
			if(unsigned(temp_sub_r1) < unsigned(i_n)) = '1' then
				final_result_temp<=temp_sub_r1;
			else
				final_result_temp<=std_logic_vector(unsigned(temp_sub_r1) - unsigned(i_n)) ;
			end if;
			next_state <= final;
		when final =>
			o_r<=final_result_temp;
			o_done<='1';
			next_state <= Idle;
	end case;
end process;
end Behavioral;
