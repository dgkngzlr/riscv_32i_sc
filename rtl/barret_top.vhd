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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity barret_top is
	Port ( i_clk : in std_logic;
		  i_start: in std_logic;
		  i_n    :in std_logic_vector(31 downto 0);
		  i_x    :in std_logic_vector(31 downto 0);
		  o_r    :out std_logic_vector(31 downto 0);
		  o_done   :out std_logic
		  );
end barret_top;

architecture Behavioral of barret_top is

type FSM is (Idle, MemCheck,FindK_Step_1, FindK_Step_2, shift_left_1, Exponentiation, division_1,multiplication_1, shift_right_1,multiplication_2,subtract,decision,final);
signal current_state, next_state: FSM;

signal r_value, prio_result, div_result , mul_result: std_logic_vector(31 downto 0):=x"00000000";
signal temp_div_a, temp_div_b, temp_mul_a , temp_mul_b: std_logic_vector(31 downto 0):=x"00000000";
signal temp_exp : std_logic_vector(31 downto 0):=x"00000000";
signal mem_key :  std_logic_vector(31 downto 0):=x"00000000";
signal mem_ovalue,mem_ivalue:  std_logic_vector(31 downto 0):=x"00000000";
signal mem_ivalid, mem_wen,mem_ovalid: std_logic:='0';
signal k_value: unsigned (31 downto 0):=x"00000000";
signal priority_1_en, mul_1_en,div_1_en:std_logic:='0';
signal temp_sub_r1, temp_shift_r1: std_logic_vector(31 downto 0):=x"00000000";

signal final_result_temp : std_logic_vector(31 downto	 0):=x"00000000";

signal mem_hit_flag : std_logic:='0';

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

component dict is
	port(
		i_clk : in std_logic;
		i_wen : in std_logic; -- write/read
		i_valid : in std_logic; -- master assert if given key is valid
		i_key : in std_logic_vector(31 downto 0); -- key pair
		i_value : in std_logic_vector(31 downto 0); -- value pair
		o_value : out std_logic_vector(31 downto 0); -- value data of given key for read
		o_valid : out std_logic -- assert if given value data is valid
	);
end component;

begin

priority_1: enchanced_priority port map( i_clk => i_clk,
										 i_en=>priority_1_en,
									     i_n=>i_n,
										 o_r=>prio_result);

div_1: div port map					   ( i_en=>div_1_en,
									     i_a=>temp_div_a,
										 i_b=>temp_div_b,
										 o_r=>div_result);
										 
mul_1: mult port map				   ( i_en=>mul_1_en,
									     i_a=>temp_mul_a,
										 i_b=>temp_mul_b,
										 o_r=>mul_result);
								
mem_1: dict port map				   (i_clk=> i_clk,
										i_wen=> mem_wen,
										i_valid=> mem_ivalid,
										i_key=>mem_key,
										i_value=>mem_ivalue,
										o_value=>mem_ovalue,
										o_valid=>mem_ovalid);
										 
process(i_clk)
begin 
	if(rising_edge(i_clk)) then
		current_state <= next_state;
	else
	current_state<=current_state;
 end if;
end process;


process(current_state,i_n,i_x,i_start)
begin
	o_done<='0';
	o_r<=x"00000000";
	case(current_state) is
	
		when Idle =>
			if(i_start = '1') then
				next_state <= MemCheck; 
			else
				next_state <= Idle;
			end if;
	
		when MemCheck =>
			mem_wen<='0';
			mem_ivalid<='1';
			mem_key<=i_n;
			next_state <= FindK_Step_1;

		when FindK_Step_1 =>     --FIRST STEP OF PRECOMPUTATION
		
			if(mem_ovalid='1') then   --MEMORY READ CHECK 
				r_value<=mem_ovalue;
				mem_hit_flag<='1';
				next_state <= multiplication_1;
			else
				mem_hit_flag<='0';
				mem_ivalid<='0';
				priority_1_en<='1';
				next_state <= FindK_Step_2;
			end if;
			
		when FindK_Step_2 =>
			k_value <= unsigned(prio_result);
			next_state <= shift_left_1;
			
		when shift_left_1 =>
			priority_1_en<='0';
			k_value <= k_value SLL 1;
			next_state <= Exponentiation;
			
		when Exponentiation => 
			temp_exp <= std_logic_vector (to_unsigned((2 ** to_integer(k_value)),32));
			next_state <= division_1;


		when division_1 =>  	--LAST STEP OF PRECOMPUTATION
		
			mem_wen<='1';
			mem_ivalid<='1';
			
			div_1_en<='1';
			temp_div_a<=temp_exp;
			temp_div_b<=i_n;

			next_state <= multiplication_1;
			
		when multiplication_1 =>     --REDUCTION PART
		
			
			mem_wen<='0';
			mem_ivalid<='0';
			mul_1_en<='1';
			div_1_en<='0';

			temp_mul_a<=i_x;
			if(mem_hit_flag='1') then
				temp_mul_b<=r_value;
				mem_hit_flag<='0';
			else
				temp_mul_b<=div_result;
			end if;
			next_state <= shift_right_1;
			
		when shift_right_1 =>  	

			mul_1_en<='0';
			
			temp_shift_r1 <= std_logic_vector(unsigned(mul_result) srl to_integer(unsigned(k_value)));--7
			next_state <= multiplication_2;
			
		when multiplication_2 =>     
			mul_1_en<='1';
			
			temp_mul_a<=temp_shift_r1;
			temp_mul_b<=i_n;
	
			next_state <= subtract;
		
		when subtract =>     
			mul_1_en<='0';
			
			temp_sub_r1<= std_logic_vector(unsigned(i_x) - unsigned(mul_result));
			
			next_state <= decision;
	
		when decision =>     
			
			if (unsigned(temp_sub_r1) < unsigned(i_n)) then
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
mem_ivalue<= div_result; -- MEM WRITE 
end Behavioral;
