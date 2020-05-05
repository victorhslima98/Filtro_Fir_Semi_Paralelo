LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rom IS
	GENERIC (
		bits : INTEGER := 8; -- # of bits per word
	words : INTEGER := 8); -- # of words in the memory
	PORT (
		addr : IN INTEGER RANGE 0 TO words - 1;
		data : OUT STD_LOGIC_VECTOR (bits - 1 DOWNTO 0)
	);
END rom;

ARCHITECTURE rom OF rom IS
	TYPE vector_array IS ARRAY (0 TO words - 1) OF
	STD_LOGIC_VECTOR (bits - 1 DOWNTO 0);
	CONSTANT memory : vector_array := ("00000001", 
		"00000010", 
		"00000100", 
		"00001000", 
		"00010000", 
		"00100000", 
		"01000000", 
		"10000000"
	);
BEGIN
	data <= memory(addr);

END rom;