LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.my_components.all;


ENTITY filtro_FIR IS
	PORT (clk, limpa: IN STD_LOGIC;
	      X: IN STD_LOGIC_VECTOR (7 downto 0);
	      S: OUT STD_LOGIC_VECTOR (15 downto 0);
	      S1: OUT STD_LOGIC 
	);
END filtro_FIR;

ARCHITECTURE comportamento OF filtro_FIR IS
	SIGNAL s_mult_0, s_reg, s_sum_1, s_mult_1, s_sum_0 : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL s_rom_0, s_mux_0, s_rom_1, s_mux_1, A, B, C, D, E, F, G, H  : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL apontador0 : INTEGER RANGE 0 TO 3;
	SIGNAL apontador1 : INTEGER RANGE 4 TO 7;
	SIGNAL selecao : STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL carga : STD_LOGIC;
	
BEGIN
	stage_0 : registradordeslocamento PORT MAP(clk, carga, X, A, B, C, D, E, F, G, H);
	
	stage_1_0 : mux4para2 PORT MAP(selecao, A, B, C, D, s_mux_0);
	stage_1_1 : mux4para2 PORT MAP(selecao, E, F, G, H, s_mux_1);
	
	stage_2_0 : rom PORT MAP(apontador0, s_rom_0);
	stage_2_1 : rom PORT MAP(apontador1, s_rom_1);
	
	stage_3_0 : mult8bits PORT MAP(s_mux_0, s_rom_0, s_mult_0);
	stage_3_1 : mult8bits PORT MAP(s_mux_1, s_rom_1, s_mult_1);
	
	stage_4 : somador16bits PORT MAP(s_mult_0, s_mult_1, s_sum_0);
	
	stage_5 : somador16bits PORT MAP(s_sum_0, s_reg, s_sum_1);
	stage_6 : reg PORT MAP(clk, s_sum_1, s_reg);
	
	stage_7 : state_machine PORT MAP(clk, limpa, carga, selecao, apontador0, apontador1);
	
	S <= s_reg;
	S1 <= carga;
END comportamento;