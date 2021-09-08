library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio4_tb is
end exercicio4_tb;

architecture behavioral of exercicio4_tb is

	signal clock 			:	std_logic := '0';
	signal estimulo_vector		:	std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo			:	std_logic;
	
	signal reset_s			:	std_logic := '0';
	signal enable_s			:	std_logic := '1';
	signal data_selected_s		:	std_logic;
	signal force_0_s		:	std_logic;
	signal force_1_s		:	std_logic;
	signal force_input_s		:	std_logic;
	signal direction_s		:	std_logic := '0';
	signal parallel_load_s		:	std_logic := '0';
	signal parallel_data_s		:	std_logic_vector(1023 downto 0);
	signal parallel_out_s		:	std_logic_vector(1023 downto 0);
	signal shift_register_s		:	std_logic_vector(1023 downto 0);
	signal shift_register_out_s	:	std_logic;

	component shift_register
		port(
			clk			:	in	std_logic;
			rst			:	in	std_logic;
			en			:	in	std_logic;
			data_selected		:	inout	std_logic;
			force_0			:	in	std_logic;
			force_1			:	in	std_logic;
			force_input		:	in	std_logic;
			direction		:	in	std_logic;
			parallel_load		:	in	std_logic;
			parallel_data		:	in	std_logic_vector(1023 downto 0);
			parallel_out		:	out	std_logic_vector(1023 downto 0);
			shift_register_in	:	in	std_logic;
			shift_register		:	inout	std_logic_vector(1023 downto 0);
			shift_register_out	:	out	std_logic
		);
	end component;

begin

	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	exercicio4 : shift_register
		port map(
			clk => clock,
			rst => reset_s,
			en => enable_s,
			data_selected => data_selected_s,
			force_0 => force_0_s,
			force_1 => force_1_s,
			force_input => force_input_s,
			direction => direction_s,
			parallel_load => parallel_load_s,
			parallel_data => parallel_data_s,
			parallel_out => parallel_out_s,
			shift_register_in => estimulo,
			shift_register => shift_register_s,
			shift_register_out => shift_register_out_s
		);

	clock <= not clock after 10 ns;

end architecture behavioral;