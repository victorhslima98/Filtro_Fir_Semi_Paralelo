LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY mult8bits IS
	PORT (
		a, b : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		s : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END mult8bits;

ARCHITECTURE dataflow1 OF mult8bits IS

BEGIN
	s <= a * b;

END dataflow1;