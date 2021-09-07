library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

-- Testebench lógica OR

entity tb_dec_3x8_3 is
end entity tb_dec_3x8_3;

architecture logic of tb_dec_3x8_3 is

	component dec_3x8_3
		port(
			input	:	in	std_logic_vector(2 downto 0);
			output	:	out	std_logic_vector(7 downto 0)
		);
	end component;

	signal in_sig	:	std_logic_vector(2 downto 0);
	signal out_sin	:	std_logic_vector(7 downto 0);

begin

	decod_3x8 : dec_3x8_3
		port map (
			input => in_sig,
			output => out_sin
			);

	estimulo : process
	begin
		wait for 5 ns;
		in_sig <= "000";
		wait for 5 ns;
		in_sig <= "001";
		wait for 5 ns;
		in_sig <= "010";
		wait for 5 ns;
		in_sig <= "011";
		wait for 5 ns;
		in_sig <= "100";
		wait for 5 ns;
		in_sig <= "101";
		wait for 5 ns;
		in_sig <= "110";
		wait for 5 ns;
		in_sig <= "111";
	end process estimulo;

end architecture logic;