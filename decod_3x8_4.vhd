library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

-- Decodificador 3x8

entity decod_3x8_4 is
	port(
		input	:	in	std_logic_vector(2 downto 0);
		output	:	out	std_logic_vector(7 downto 0)
	);
end decod_3x8_4;

architecture logic of decod_3x8_4 is
begin
	process
	begin
		case input is
			when "000" =>
				output <= "00000001";
			when "001" =>
				output <= "00000010";
			when "010" =>
				output <= "00000100";
			when "011" =>
				output <= "00001000";
			when "100" =>
				output <= "00010000";
			when "101" =>
				output <= "00100000";
			when "110" =>
				output <= "01000000";
			when "111" =>
				output <= "10000000";
			when others =>
				output <= "00000000";
		end case;
	end process;
end logic;