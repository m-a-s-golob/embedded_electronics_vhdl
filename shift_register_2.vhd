library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

-- Shift Register usando While Loop

entity shift_register_2 is
	port(
		clk	:	in	std_logic;
		rst	:	in	std_logic;
		en	:	in	std_logic;
		input	:	in	std_logic;
		output	:	inout	std_logic_vector(7 downto 0)
	);
end entity shift_register_2;

architecture logic of shift_register_2 is
begin

	process(clk, rst)
	
		variable n	:	integer;

	begin

		if rst = '1' then
			output <= x"00";
		else
			if clk'event and clk = '1' and en = '1' then
				output(0) <= input;

				n := 7;
				while n > 0 loop
					output(n) <= output(n-1);
					n := n-1;
				end loop;
			end if;
		end if;
	end process;

end architecture logic;