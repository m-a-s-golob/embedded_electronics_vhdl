library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity contador is
	port(
		rst	:	in	std_logic;
		clk	:	in	std_logic
	);
end contador;

architecture behavioral of contador is
	
	signal contador1	:	signed(7 downto 0);
	signal contador2	:	unsigned(7 downto 0);
	signal contador3	:	integer range 0 to 255;
	signal contador4	:	signed(7 downto 0);
	signal contador5	:	unsigned(7 downto 0);

begin

	process(rst, clk)
	begin
		if rst = '1' then

			contador1 <= (others=>'0');
			contador2 <= (others=>'0');
			contador3 <= 0;
			contador4 <= to_signed(0, contador4'length);
			contador5 <= to_unsigned(0, contador5'length);

		else
			if clk'event and clk = '1' then

				contador1 <= contador1 + 1;
				contador2 <= contador2 + 1;

				if contador3 < 255 then
					contador3 <= contador3 + 1;
				else
					contador3 <= 0;
				end if;
			
				contador4 <= contador4 - 1;
				contador5 <= contador5 - 1;
			
			end if;
		end if;
	end process;
end behavioral;