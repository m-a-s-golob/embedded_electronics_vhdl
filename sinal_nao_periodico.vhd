library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

-- Sinal não periódico

entity sinal_nao_periodico is
	port(
		sinal	:	out	std_logic_vector(7 downto 0)
	);
end entity sinal_nao_periodico;

architecture logic of sinal_nao_periodico is
begin
	process
	begin
		wait for 10 ns;
		sinal <= "ZZZZZZZZ";
		wait for 10 ns;
		sinal <= "00000000";
		wait for 10 ns;
		sinal <= "10100100";
		wait for 10 ns;
		sinal <= "ZZZZZZZZ";
	end process;
end architecture logic;