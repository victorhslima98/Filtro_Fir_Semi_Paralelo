----- File my_components.vhd: ---------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE my_components IS

	COMPONENT somador16bits IS
		PORT (
			a, b : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			s : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mult8bits IS
		PORT (
			a, b : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			s : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT reg IS
		PORT (
			clk : IN STD_LOGIC;
			D : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux4para2 IS
		PORT (
			sel : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			a, b, c, d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT regdesl8b IS
		PORT (
			clk, ld : IN STD_LOGIC;
			D : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			Q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT state_machine IS
		PORT (
			clk, clr : IN STD_LOGIC;
			ld : OUT STD_LOGIC;
			C : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			app : OUT INTEGER RANGE 0 TO 3;
			app1: OUT INTEGER RANGE 4 TO 7
		);
	END COMPONENT;

	COMPONENT rom IS
		GENERIC (
			bits : INTEGER := 8; -- # of bits per word
		words : INTEGER := 8); -- # of words in the memory
		PORT (
			addr : IN INTEGER RANGE 0 TO words - 1;
			data : OUT STD_LOGIC_VECTOR (bits - 1 DOWNTO 0)
		);
	END COMPONENT;

COMPONENT registradordeslocamento IS
	PORT (
	clk, load : IN STD_LOGIC;
	X : STD_LOGIC_VECTOR (7 DOWNTO 0);
	Sa, Sb, Sc, Sd, Se, Sf, Sg, Sh : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END COMPONENT;

END my_components;