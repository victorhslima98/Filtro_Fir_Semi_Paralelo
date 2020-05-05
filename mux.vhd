LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4para2 IS
	PORT (
		sel : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		a, b, c, d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END mux4para2;

ARCHITECTURE comportamento OF mux4para2 IS
BEGIN
	PROCESS (sel) -- lista de sensibilização
	BEGIN
		CASE sel IS
			WHEN "00" => Y <= a;
			WHEN "01" => Y <= b;
			WHEN "10" => Y <= c;
			WHEN OTHERS => Y <= d;
			END CASE;
	END PROCESS;
END comportamento;