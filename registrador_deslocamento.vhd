LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.my_components.ALL;

ENTITY registradordeslocamento IS
	PORT (
		clk, load : IN STD_LOGIC;
		X : STD_LOGIC_VECTOR (7 DOWNTO 0);
		Sa, Sb, Sc, Sd, Se, Sf, Sg, Sh : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END registradordeslocamento;

ARCHITECTURE comportamento OF registradordeslocamento IS
	SIGNAL Ta, Tb, Tc, Td, Te, Tf, Tg : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
	stage_0 : regdesl8b
	PORT MAP(clk, load, X, Ta);
	stage_1 : regdesl8b
	PORT MAP(clk, load, Ta, Tb);
	stage_2 : regdesl8b
	PORT MAP(clk, load, Tb, Tc);
	stage_3 : regdesl8b
	PORT MAP(clk, load, Tc, Td);
	stage_4 : regdesl8b
	PORT MAP(clk, load, Td, Te);
	stage_5 : regdesl8b
	PORT MAP(clk, load, Te, Tf);
	stage_6 : regdesl8b
	PORT MAP(clk, load, Tf, Tg);
	stage_7 : regdesl8b
	PORT MAP(clk, load, Tg, Sh);

	Sa <= Ta;
	Sb <= Tb;
	Sc <= Tc;
	Sd <= Td;
	Se <= Te;
	Sf <= Tf;
	Sg <= Tg;

	END comportamento;

