library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio1 is
	port(
		clk	:	in	std_logic;
		rst	:	in	std_logic;
		d	:	in	std_logic;
		q	:	inout	std_logic_vector(3 downto 0)
	);
end exercicio1;

architecture behavioral of exercicio1 is
begin
	process(clk, rst)
	begin
		if rst = '1' then
			q <= "0000";
		else
			if clk'event and clk = '1' then
				q(0) <= d;
				q(1) <= q(0);
				q(2) <= q(1);
				q(3) <= q(2);
			end if;
		end if;
	end process;
end architecture behavioral;