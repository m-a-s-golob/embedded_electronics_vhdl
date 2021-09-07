library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity tb_ram_1 is
end tb_ram_1;

architecture behavioral of tb_ram_1 is

	component ram_1
		port(
			rst : in std_logic;
			clk : in std_logic;
			add_data_io : inout std_logic_vector(7 downto 0);
			oe_i  : in std_logic;
			we_i  : in std_logic;
			ale_i : in std_logic
		);
	end component;

	signal rst : std_logic;
	signal clk : std_logic := '0';
	signal add_data_io : std_logic_vector(7 downto 0);
	signal oe_i  : std_logic;
	signal we_i  : std_logic;
	signal ale_i : std_logic;

begin

	clk  <= not clk after 10 ns;
	rst <= '1', '0' after 40 ns;
	
	process
	begin
		--inicio do reset
		add_data_io <= (others=>(others=>'Z'));
		oe_i  <= '0';
		we_i  <= '0';
		ale_i <= '0';
		wait until rst = '0';
		
		--espera uma borda para alinhar com o clock e ficar bonito.
		wait until rising_edge(clk);
		
		--escreve no endereço 3, data = A4 (10100100)
		ale_i <= '1';
		add_data_io <= (2 downto 0 => "011", others=>'0');
		wait until rising_edge(clk);
		ale_i <= '0';
		we_i  <= '1';
		add_data_io <= x"A4";
		wait until rising_edge(clk);
		
		--escreve no endereço 4, data = A5 (10100100)
		ale_i <= '1';
		add_data_io <= (2 downto 0 => "100", others=>'0');
		wait until rising_edge(clk);
		ale_i <= '0';
		we_i  <= '1';
		add_data_io <= x"A5";
		wait until rising_edge(clk);
		
		--para garantir, vou zerar todos os controles.
		oe_i  <= '0';
		we_i  <= '0';
		ale_i <= '0';
		add_data_io <= (others=>others=>'Z');
		wait until rising_edge(clk);
		
		--leitura addr 3
		ale_i <= '1';
		add_data_io <= (2 downto 0 => "011", others=>'0');
		wait until rising_edge(clk);
		oe_i  <= '1';
		add_data_io <= (others=>others=>'Z');
		wait until rising_edge(clk);
		
		--leitura addr 4
		ale_i <= '1';
		add_data_io <= (2 downto 0 => "100", others=>'0');
		wait until rising_edge(clk);
		oe_i  <= '1';
		add_data_io <= (others=>others=>'Z');
		wait until rising_edge(clk);
		
		wait;
	end process;

	ram_u : ram_1
		port map (
			rst => rst,
			clk => clk,
			add_data_io => add_data_io,
			oe_i  => oe_i,
			we_i  => we_i,
			ale_i => ale_i,
		);
end behavioral;