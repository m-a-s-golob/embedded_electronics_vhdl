library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

-- Lógica OR

entity or_gate_1 is
	port(
		input_port	:	in	std_logic_vector(3 downto 0);
		output_port	:	out	std_logic	
	);
end or_gate_1;

architecture logic of or_gate_1 is
begin
	output_port <= '0' when input_port = "0000" else '1';
end logic;