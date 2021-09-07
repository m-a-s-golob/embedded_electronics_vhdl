library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

-- Lógica OR

entity or_gate_2 is
	port(
		input_port	:	in	std_logic_vector(3 downto 0);
		output_port	:	out	std_logic	
	);
end or_gate_2;

architecture logic of or_gate_2 is
begin
	process
	begin
		case input_port is
			when "0000" => output_port <= '0';
			when "0001" => output_port <= '1';
			when "0010" => output_port <= '1';
			when "0011" => output_port <= '1';
			when "0100" => output_port <= '1';
			when "0101" => output_port <= '1';
			when "0110" => output_port <= '1';
			when "0111" => output_port <= '1';
			when "1000" => output_port <= '1';
			when "1001" => output_port <= '1';
			when "1010" => output_port <= '1';
			when "1011" => output_port <= '1';
			when "1100" => output_port <= '1';
			when "1101" => output_port <= '1';
			when "1110" => output_port <= '1';
			when "1111" => output_port <= '1';
			when others => output_port <= 'Z';
		end case;
	end process;
end logic;