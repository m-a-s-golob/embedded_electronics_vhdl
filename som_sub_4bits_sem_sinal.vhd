library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

-- Somador/Subtrator de 4 bits, sem sinal

entity som_sub_4bits_sem_sinal is
	port(
		valor_1		:	in	std_logic_vector(3 downto 0);
		valor_2		:	in	std_logic_vector(3 downto 0);
		operacao	:	in	std_logic;
		resultado	:	out	std_logic_vector(4 downto 0)
	);
end som_sub_4bits_sem_sinal;

architecture logica of som_sub_4bits_sem_sinal is
begin
	process

		variable carry_in	:	std_logic_vector(4 downto 0);
		variable carry_out	:	std_logic_vector(3 downto 0);
		variable borrow_in	:	std_logic_vector(4 downto 0);
		variable borrow_out	:	std_logic_vector(3 downto 0);
		variable n		:	integer;

	begin
		resultado	<= "00000";
		carry_in(0)	:= '0';
		borrow_in(0)	:= '0';

		-- Soma
		if operacao = '0' then
			for n in 0 to 3 loop
				resultado(n) <= valor_1(n) xor valor_2(n) xor carry_in(n);
				carry_out(n) := (valor_1(n) and carry_in(n)) or (valor_2(n) and carry_in(n)) or (valor_1(n) and valor_2(n));
				carry_in(n+1) := carry_out(n);
			end loop;
		-- Subtração
		else
			for n in 0 to 3 loop
				resultado(n) <= valor_1(n) xor valor_2(n) xor borrow_in(n);
				borrow_out(n) := (valor_2(n) and borrow_in(n)) or (not valor_1(n) and borrow_in(n)) or (not valor_1(n) and valor_2(n));
				borrow_in(n+1) := borrow_out(n);
			end loop;
		end if;
	end process;
end logica;
