--******************************************************--
--Bloque contador : contador descendente de 11 bits
--******************************************************--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--******************************************************--
-- Autor: -David castellanos
				--julian oviedo
				--Daniel Pineda-
--    --
--******************************************************--

------------Este bloque se compone de 10 Flip Flops tipo D--------------------
entity Contador_Cafe is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Contador_Cafe  : in std_logic;--_vector(1 downto 0); 
 
Contador_Cafe_Expreso_Disponible : out std_logic_vector(11 downto 0) ; 
Contador_Cafe_Expreso_DisponibleB : out std_logic;
Ver_Conteo        : out std_logic_vector(11 downto 0)
); 

end entity Contador_Cafe;     

architecture Contador_CafeArch of Contador_Cafe is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
		
end component;
signal Q : std_logic_vector(11 downto 0);
signal D : std_logic_vector(11 downto 0);
signal P : std_logic;
signal E : std_logic;

begin 


D(0)<= not Q(0) ;
D(1)<=(Q(1) xnor Q(0)) ;
D(2)<=((Q(0) or Q(1)) xnor Q(2)) ;
D(3)<=((Q(0) or Q(1) or Q(2)) xnor Q(3)) ;
D(4)<=((Q(0) or Q(1) or Q(2) or Q(3)) xnor Q(4)) ;
D(5)<=((Q(0) or Q(1) or Q(2) or Q(3) or Q(4)) xnor Q(5)) ;
D(6)<=((Q(0) or Q(1) or Q(2) or Q(3) or Q(4) or Q(5)) xnor Q(6)) ;
D(7)<=((Q(0) or Q(1) or Q(2) or Q(3) or Q(4) or Q(5) or Q(6)) xnor Q(7)) ;
D(8)<=((Q(0) or Q(1) or Q(2) or Q(3) or Q(4) or Q(5) or Q(6) or Q(7)) xnor Q(8)) ;
D(9)<=((Q(0) or Q(1) or Q(2) or Q(3) or Q(4) or Q(5) or Q(6) or Q(7) or Q(8)) xnor Q(9)) ;
D(10)<=((Q(0) or Q(1) or Q(2) or Q(3) or Q(4) or Q(5) or Q(6) or Q(7) or Q(8) or Q(9))  xnor Q(10)) ;




FF1: dffe port map (D(0), Reloj, Reset, P ,E , Q(0));
FF2: dffe port map (D(1), Reloj, Reset, P, E ,Q(1));
FF3: dffe port map (D(2), Reloj, Reset, P, E ,Q(2));
FF4: dffe port map (D(3), Reloj, Reset,P, E ,Q(3));
FF5: dffe port map (D(4), Reloj, Reset,P, E ,Q(4));
FF6: dffe port map (D(5), Reloj, Reset,P, E ,Q(5));
FF7: dffe port map (D(6), Reloj, Reset,P, E ,Q(6));
FF8: dffe port map (D(7), Reloj, Reset,P, E ,Q(7));
FF9: dffe port map (D(8), Reloj, Reset,P, E ,Q(8));
FF10: dffe port map (D(9), Reloj, Reset,P, E ,Q(9));
FF11: dffe port map (D(10), Reloj, Reset,P, E ,Q(10));


Ver_Conteo<=Q;
E<= not Control_Contador_Cafe;--(0);
P<= ( '1' and not Control_Contador_Cafe);--(1) );
Contador_Cafe_Expreso_Disponible <= Q ;
Contador_Cafe_Expreso_DisponibleB <= (Q(0)and not Q(1)and Q(2)and Q(3) and not Q(4) and not Q(5) and not Q(6) and not Q(7) and not Q(8) and not Q(9) and not Q(10));


End Contador_CafeArch;