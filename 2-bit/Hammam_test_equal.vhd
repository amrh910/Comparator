library ieee;
use ieee.std_logic_1164.all;

entity test_equal is
end test_equal;

architecture arch_test of test_equal is
component equal
port (i1, i2 : in std_logic_vector(1 downto 0);
	eq: out std_logic);
end component;

signal p1, p0 : std_logic_vector(1 downto 0);
signal pout : std_logic;
signal error : std_logic := '0';

begin
uut: equal port map (i1 => p0, i2 => p1, eq => pout);

process
begin
p0 <= "00";
p1 <= "00";
wait for 1 ns;
if (pout = '0') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "01";
p1 <= "00";
wait for 1 ns;
if (pout = '1') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "11";
p1 <= "00";
wait for 1 ns;
if (pout = '1') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "01";
p1 <= "11";
wait for 1 ns;
if (pout = '1') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "11";
p1 <= "11";
wait for 1 ns;
if (pout = '0') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "10";
p1 <= "11";
wait for 1 ns;
if (pout = '1') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "10";
p1 <= "10";
wait for 1 ns;
if (pout = '0') then
	error <= '1';
end if;

wait for 200 ns;
p0 <= "11";
p1 <= "01";
wait for 1 ns;
if (pout = '1') then
	error <= '1';
end if;

wait for 200 ns;

if (error = '0') then
	report "No errors detected. Simulation successful" severity
failure;
	else
		report "Error detected" severity failure;
end if;
end process;
end arch_test;