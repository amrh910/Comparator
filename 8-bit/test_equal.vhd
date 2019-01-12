library ieee;
use ieee.std_logic_1164.all;

entity test_equal is
end test_equal;

architecture arch_test of test_equal is
	component equal
	port(
		i0 , i1 : in std_logic_vector(7 downto 0);
			eq : out std_logic
		);
	end component;

	signal p1, p0 : std_logic_vector(7 downto 0);
	signal pout : std_logic;
	signal error : std_logic := '0';

begin

x: equal port map(i0 => p0, i1 => p1, eq => pout);

process
begin

p0 <= "00000000";
p1 <= "00000000";
wait for 1 ns;
if (pout = '0') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "01010101";
p1 <= "11010101";
wait for 1 ns;
if (pout = '1') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "01100101";
p1 <= "10111001";
wait for 1 ns;
if (pout = '1') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "11110011";
p1 <= "01010100";
wait for 1 ns;
if (pout = '1') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "11000100";
p1 <= "01001101";
wait for 1 ns;
if (pout = '0') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "11011001";
p1 <= "10100111";
wait for 1 ns;
if (pout = '1') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "11101101";
p1 <= "11101101";
wait for 1 ns;
if (pout = '0') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "10010001";
p1 <= "01101111";
wait for 1 ns;
if (pout = '1') then
	error <= '1';
end if;

wait for 200 ns;

if (error = '0') then
	report "No errors detected. Simulation successful" severity failure;
else
	report "Error detected" severity failure;
end if;

end process;
end arch_test;
