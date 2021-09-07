library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

-- Decodificador 3x8

entity decod_3x8_2 is
	port(
		input	:	in	std_logic_vector(2 downto 0);
		output	:	out	std_logic_vector(7 downto 0)
	);
end decod_3x8_2;

architecture logic of decod_3x8_2 is
begin
	output <= "00000001" when input = "000";
	output <= "00000010" when input = "001";
	output <= "00000100" when input = "010";
	output <= "00001000" when input = "011";
	output <= "00010000" when input = "100";
	output <= "00100000" when input = "101";
	output <= "01000000" when input = "110";
	output <= "10000000" when input = "111";
end logic;
