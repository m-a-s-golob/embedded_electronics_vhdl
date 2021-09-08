library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio4 is
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
end entity exercicio4;

architecture logic of exercicio4 is
begin

	data_selected <= '0' 		when force_0 = '1' else
		'1' 			when force_1 = '1' else
		shift_register_in	when force_input = '1' else
		shift_register(0)	when direction = '0' else
		shift_register(1023);
		
	process(rst, clk)
	begin
		if rst = '1' then
			shift_register <= (others=>'0');
		elsif clk'event and clk = '1' then
			if parallel_load = '1' then
				shift_register <= parallel_data;
			elsif en = '1' then
				if direction = '0' then
					shift_register <= data_selected & shift_register(1023 downto 1);
				else
					shift_register <= shift_register(1022 downto 0) & data_selected;
				end if;
			else
				parallel_out <= shift_register;
			end if;
		end if;
	end process;
		
	shift_register_out <= shift_register(0) when direction = '0' else
		shift_register(1023);

end architecture logic;