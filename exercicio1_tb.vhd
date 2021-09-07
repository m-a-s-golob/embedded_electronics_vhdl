library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio1_tb is
end exercicio1_tb;

architecture behavioral of exercicio1_tb is

	signal clock 		:	std_logic := '0';
	signal estimulo_vector	:	std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo		:	std_logic;
	
	signal reset_s		:	std_logic := '0';
	signal data_out_s	:	std_logic_vector(3 downto 0);

	component shift_register
		port(
			clk	:	in	std_logic;
			rst	:	out	std_logic;
			d	:	in	std_logic;
			q	:	inout	std_logic_vector(3 downto 0)
		);
	end component;

begin

	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	exercicio1 : shift_register
		port map(
			clk => clock,
			rst => reset_s,
			d => estimulo,
			q => data_out_s
		);

	clock <= not clock after 10 ns;

end architecture behavioral;