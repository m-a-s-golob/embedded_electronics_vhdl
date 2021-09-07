library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio2_tb is
end exercicio2_tb;

architecture behavioral of exercicio2_tb is

	signal clock 		:	std_logic := '0';
	signal estimulo_vector	:	std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo		:	std_logic;
	
	signal reset_s		:	std_logic := '0';
	signal enable_s		:	std_logic := '1';
	signal data_out_s	:	std_logic_vector(7 downto 0);

	component shift_register
		port(
			clk	:	in	std_logic;
			rst	:	out	std_logic;
			d	:	in	std_logic;
			en	:	in	std_logic;
			q_a	:	inout	std_logic_vector(7 downto 0);
			q_b	:	inout	std_logic_vector(7 downto 0);
			q_c	:	inout	std_logic_vector(7 downto 0)
		);
	end component;

begin

	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	exercicio2 : shift_register
		port map(
			clk => clock,
			rst => reset_s,
			d => estimulo,
			en => enable_s,
			q_a => data_out_s
		);

	clock <= not clock after 10 ns;

end architecture behavioral;