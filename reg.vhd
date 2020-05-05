LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg IS
	PORT (
		clk : IN STD_LOGIC;
		D : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END reg;

ARCHITECTURE comportamento OF reg IS
BEGIN
	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			Q <= D;
		END IF;
	END PROCESS;
END comportamento;