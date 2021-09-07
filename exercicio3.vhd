library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio3 is
	port(
		clk	:	in	std_logic;
		rst	:	in	std_logic;
		en	:	in	std_logic;
		input	:	in	std_logic;
		output	:	inout	std_logic_vector(7 downto 0)
	);
end entity exercicio3;

architecture logic of exercicio3 is
begin

	process(clk, rst)
	
		variable n	:	integer;

	begin

		if rst = '1' then
			output <= x"00";
		else
			if clk'event and clk = '1' and en = '1' then
				output(0) <= input;

				for n in 7 downto 1 loop
					output(n) <= output(n-1);
				end loop;
			end if;
		end if;
	end process;

end architecture logic;