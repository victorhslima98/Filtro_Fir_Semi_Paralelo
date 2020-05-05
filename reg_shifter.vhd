LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regdesl8b IS
	PORT (
		clk, ld : IN STD_LOGIC;
		D : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		Q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END regdesl8b;

ARCHITECTURE comportamento OF regdesl8b IS
BEGIN
	PROCESS (ld, clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN

			IF ld = '1' THEN

				Q <= D;

			END IF;

		END IF;

	END PROCESS;

END comportamento;