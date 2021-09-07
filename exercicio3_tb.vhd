library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio3_tb is
end exercicio3_tb;

architecture behavioral of exercicio3_tb is

	signal clock 		:	std_logic := '0';
	signal estimulo_vector	:	std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo		:	std_logic;
	
	signal reset_s		:	std_logic := '0';
	signal enable_s		:	std_logic := '1';
	signal data_out_s	:	std_logic_vector(7 downto 0);

	component shift_register
		port(
			clk	:	in	std_logic;
			rst	:	in	std_logic;
			en	:	in	std_logic;
			input	:	in	std_logic;
			output	:	inout	std_logic_vector(7 downto 0)
		);
	end component;

begin

	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	exercicio3 : shift_register
		port map(
			clk => clock,
			rst => reset_s,
			en => enable_s,
			input => estimulo,
			output => data_out_s
		);

	clock <= not clock after 10 ns;

end architecture behavioral;