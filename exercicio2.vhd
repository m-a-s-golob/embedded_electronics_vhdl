library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio1 is
	port(
		clk	:	in	std_logic;
		rst	:	in	std_logic;
		d	:	in	std_logic;
		en	:	in	std_logic;
		q_a	:	inout	std_logic_vector(7 downto 0);
		q_b	:	inout	std_logic_vector(7 downto 0);
		q_c	:	inout	std_logic_vector(7 downto 0)
	);
end exercicio1;

architecture behavioral of exercicio1 is
begin
	process(clk, rst)
	begin
		if rst = '1' then
			q_a <= x"00";
			q_b <= (others=>'0');
			q_c <= (others=>'0');
		elsif clk'event and clk = '1' then
			if en = '1' then
				q_a(0) <= d;
				q_a(7 downto 1) <= q_a(6 downto 0);
			end if;
		end if;
	end process;
end architecture behavioral;