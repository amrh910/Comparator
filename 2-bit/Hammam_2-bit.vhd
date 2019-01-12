library ieee;
use ieee.std_logic_1164.all;

entity equal is --AMR HAMMAM
	port
	(
		i1, i2 : in std_logic_vector(1 downto 0);
		eq : out std_logic
	);
end equal;

architecture arch of equal is
	signal p0, p1, p2, p3 : std_logic;
	begin
		eq <= p0 or p1 or p2 or p3;
		p0 <= (not i1(1)) and (not i2(1)) and (not i1(0)) and (not i2(0));
		p1 <= (not i1(1)) and (not i2(1)) and i1(0) and I2(0);
		p2 <= i1(1) and i2(1) and (not i1(0)) and (not i2(0));
		p3 <= i1(1) and i2(1) and i1(0) and i2(0);
	end arch;