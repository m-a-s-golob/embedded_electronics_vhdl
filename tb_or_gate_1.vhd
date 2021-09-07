library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

-- Testebench lógica OR

entity tb_or_gate_1 is
end entity tb_or_gate_1;

architecture logic of tb_or_gate_1 is

	component or_gate_1
		port(
			input_port	:	in	std_logic_vector(3 downto 0);
			output_port	:	out	std_logic
		);
	end component;

	signal in_sig	:	std_logic_vector(3 downto 0);
	signal out_sin	:	std_logic;

begin

	or1 : or_gate_1
		port map (
			input_port => in_sig,
			output_port => out_sin
			);

	estimulo : process
	begin
		wait for 5 ns;
		in_sig <= "0000";
		wait for 5 ns;
		in_sig <= "0100";
		wait;
	end process estimulo;

end logic;