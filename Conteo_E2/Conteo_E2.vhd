--******************************************************--
--Bloque contador : contador de 4 bits Bandera en 40
--******************************************************--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--******************************************************--
-- Autor: --
--    --
--******************************************************--

------------Este bloque se compone de 4 Flip Flops tipo D--------------------
entity Conteo_E2 is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Conteo_E2  : in std_logic; 
Conteo_E2_Control  : out std_logic ; 
Ver_Conteo        : out std_logic_vector(5 downto 0)
); 
end entity Conteo_E2;     

architecture Conteo_E2Arch of Conteo_E2 is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (5 downto 0);
signal D : std_logic_vector (5 downto 0);
signal F1 : std_logic;
signal E : std_logic;

begin 


D(0)<= (not Q(0)) ;
D(1)<=(Q(0) xor Q(1)) ;
D(2)<=((Q(0) and Q(1)) xor Q(2)) ;
D(3)<=((Q(0) and Q(1) and Q(2)) xor Q(3)) ;
D(4)<=((Q(0) and Q(1) and Q(2) and Q(3)) xor Q(4)) ;
D(5)<=((Q(0) and Q(1) and Q(2) and Q(3) and Q(4)) xor Q(5)) ;




FF1: dffe port map (D(0), Reloj, Reset, '1' , E , Q(0));
FF2: dffe port map (D(1), Reloj, Reset, '1', E  ,Q(1));
FF3: dffe port map (D(2), Reloj, Reset, '1', E ,Q(2));
FF4: dffe port map (D(3), Reloj, Reset, '1', E ,Q(3));
FF5: dffe port map (D(4), Reloj, Reset, '1', E ,Q(4));
FF6: dffe port map (D(5), Reloj, Reset, '1', E ,Q(5));



Ver_Conteo<=Q;
E<=Control_Conteo_E2;
Conteo_E2_Control <= (not Q(0)and not Q(1)and not Q(2)and Q(3) and not Q(4) and Q(5));-- 101000


End Conteo_E2Arch;
