
--******************************************************--
--Bloque contador : contador de 4 bits Bandera en 6
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
entity Conteo_3 is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Conteo_3  : in std_logic; 
Conteo_3_Control  : out std_logic ; 
Ver_Conteo        : out std_logic_vector(3 downto 0)
); 
end entity Conteo_3;     

architecture Conteo_3Arch of Conteo_3 is
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
end component;
signal Q : std_logic_vector (3 downto 0);
signal D : std_logic_vector (3 downto 0);
signal F1 : std_logic;
signal E : std_logic;

begin 


D(0)<= (not Q(0)) ;
D(1)<=(Q(1) xor Q(0)) ;
D(2)<=((Q(0) and Q(1)) xor Q(2)) ;
D(3)<=((Q(0) and Q(1) and Q(2)) xor Q(3)) ;



FF1: dffe port map (D(0), Reloj, Reset, '1' ,E , Q(0));
FF2: dffe port map (D(1), Reloj, Reset, '1', E ,Q(1));
FF3: dffe port map (D(2), Reloj, Reset, '1', E ,Q(2));
FF4: dffe port map (D(3), Reloj, Reset, '1', E ,Q(3));


Ver_Conteo<=Q;
E <=Control_Conteo_3;
Conteo_3_Control<= ( not Q(0)and Q(1)and Q(2)and not Q(3));--6 0110


End Conteo_3Arch;
