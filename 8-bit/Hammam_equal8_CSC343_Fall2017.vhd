
library ieee;
use ieee.std_logic_1164.all;

entity equal is --AMR HAMMAM
	port (
		i0, i1 : in std_logic_vector(7 downto 0);
		eq : out std_logic
	);
end equal;

architecture arch of equal is
	signal p0, p1, p2, p3, p4, p5, p6, p7 : std_logic;

		begin
		eq <= '1' when (i0 = i1) else '0';
	end arch;