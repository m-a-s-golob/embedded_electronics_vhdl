library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

-- Decodificador 3x8

entity decod_3x8_3 is
	port(
		input	:	in	std_logic_vector(2 downto 0);
		output	:	out	std_logic_vector(7 downto 0)
	);
end decod_3x8_3;

architecture logic of decod_3x8_3 is
begin
	process
	begin
		if input = "000" then
			output <= "00000001";
		else if input = "001" then
			output <= "00000010";
		else if input = "010" then
			output <= "00000100";
		else if input = "011" then
			output <= "00001000";
		else if input = "100" then
			output <= "00010000";
		else if input = "101" then
			output <= "00100000";
		else if input = "110" then
			output <= "01000000";
		else if input = "111" then
			output <= "10000000";
		else output <= "00000000";
		end if;
	end process;
end logic;