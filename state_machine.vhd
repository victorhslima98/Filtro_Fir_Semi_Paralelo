LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY state_machine IS
	PORT (
		clk, clr : IN STD_LOGIC;
		ld : OUT STD_LOGIC;
		C : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		app : OUT INTEGER RANGE 0 TO 3;
		app1 : OUT INTEGER RANGE 4 TO 7 
	);
END state_machine;

ARCHITECTURE state_machine OF state_machine IS
	TYPE estados IS (n0, n1, n2, n3);
	SIGNAL estado : estados;

BEGIN
	PROCESS (clk, clr)
	BEGIN
		IF clr = '0' THEN
			estado <= n0;

		ELSE
			IF (clk 'EVENT AND clk = '1') THEN

				CASE estado IS
					WHEN n0 => 
						estado <= n1;
						ld <= '1';
						C <= ("00");
						app <= 0;
						app1 <= 4;
					WHEN n1 => 
						estado <= n2;
						ld <= '0';
						C <= ("01");
						app <= 1;
						app1 <= 5;
					WHEN n2 => 
						estado <= n3;
						ld <= '0';
						C <= ("10");
						app <= 2;
						app1 <= 6;
					WHEN n3 => 
						estado<=n0;
						ld <= '0';
						C<= ("11");
						app <= 3;
						app1 <= 7;
				END CASE;
			END IF;
		END IF;
	END PROCESS;
END state_machine;