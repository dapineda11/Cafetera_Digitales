--******************************************************--
						--Bloque control
--******************************************************--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--******************************************************--
-- Autor: -David Castellanos
			 --Julian Oviedo
			--Daniel Pineda
--    --
--******************************************************--

entity Control is
port(

	Reloj     : in std_logic;
	Reset     : in std_logic;
	--Tipo_Expreso_Control  : in std_logic; 
	Expreso_Disponible_Control : in std_logic;
--	Cantidad_Agua_Control : in std_logic;
--	Cantidad_Cafe_Control : in std_logic;
--	Contador_Agua_Control : in std_logic;
--	Contador_Cafe_Control : in std_logic;
	--Expreso_Listo_Control : in std_logic;
	Llenado_Cafe : in std_logic;
	Llenado_Agua : in std_logic;
	Confirmar : in std_logic;
	Boton_Vaso : in std_logic;
	Usuario : in std_logic_vector(1 downto 0); 
-------------Conteo Enables Activos---------
Conteo_E1_Control      : in std_logic;
Conteo_E2_Control      : in std_logic;
Conteo_E3_Control      : in std_logic;
Conteo_E4_Control      : in std_logic;
Conteo_1_Control      : in std_logic;
Conteo_2_Control      : in std_logic;
Conteo_3_Control      : in std_logic;
Conteo_4_Control      : in std_logic;

Control_Conteo_E1      : out std_logic;
Control_Conteo_E2      : out std_logic;
Control_Conteo_E3      : out std_logic;
Control_Conteo_E4      : out std_logic;
Control_Conteo_1      : out std_logic;
Control_Conteo_2      : out std_logic;
Control_Conteo_3      : out std_logic;
Control_Conteo_4      : out std_logic;
---------------Enables---------------------
Control_Cantidad_Cafe  : out std_logic; 
Control_Cantidad_Agua : out std_logic;

Control_Contador_Agua : out std_logic;
Control_Contador_Cafe : out std_logic;
--------------------------------------------
Decodificador_7_segmentos : out std_logic_vector(6 downto 0);
Valvula_Agua : out std_logic;--vector(5 downto 0);
Valvula_Cafe : out std_logic;--vector(3 downto 0);
Led_Expreso_Listo : out std_logic;
Led_Llenar_Almacenamiento : out std_logic;
ver_Estados : out std_logic_vector(14 downto 0)

); 
end entity Control;     

architecture ControlArch of Control is
	
component dffe is
	port(d, clk, clrn, prn, ena: in std_logic;
		q: out std_logic
			);
			end component ;
			
			
signal Q : std_logic_vector (14 downto 0);
signal D : std_logic_vector (14 downto 0);
signal E : std_logic;

begin
 

	  D(0)<= ((Q(0) or Q(14)) and confirmar) or (Q(7) AND  llenado_Agua and llenado_Cafe);
	  D(1)<= (not Confirmar and  (Q(0) or Q(1)));	
     D(2)<= ((Q(1) and confirmar));
	  D(3) <= (Q(2) or (Q(3) and  Boton_Vaso));
	  D(4) <= ((Q(3) and  not Boton_Vaso));
	  D(5) <= Q(4); --or Boton_Vaso ;
	  D(6) <= ((Q(5) and not Expreso_Disponible_Control) or( Q(6) and llenado_Agua and llenado_Cafe)or(Q(6) and llenado_Agua and not llenado_Cafe)or (Q(6) and not llenado_Agua and llenado_Cafe));
	  D(7) <= ((Q(6) and not llenado_Agua and not llenado_Cafe) or (Q(7) and not llenado_Agua and not llenado_Cafe));
	  D(8) <= (Q(5) and Expreso_Disponible_Control);--Decision según el tipo_Expreso_Control
	 
	  D(9) <= (((Q(8) and not Usuario(0) and not Usuario(1))) or (Q(9) and not Conteo_E3_Control and not Conteo_4_Control));--Expreso Tipo 1 00
	  
	  D(10) <= (((Q(8) and  Usuario(0) and not Usuario(1))) or (Q(10) and not Conteo_E1_Control and not Conteo_1_Control));--Expreso Tipo 2 01
	  
	  D(11) <= (((Q(8) and not  Usuario(0) and  Usuario(1))) or (Q(11) and not Conteo_E4_Control and not Conteo_2_Control));--Expreso Tipo 3 10
	  
	  D(12) <= (((Q(8) and  Usuario(0) and Usuario(1))) or (Q(12) and not Conteo_E2_Control and not Conteo_3_Control));--Expreso Tipo 4 11
	  
	  D(13) <=  (((((Q(9) and Conteo_4_Control))) or ((Q(10) and Conteo_1_Control)) or ((Q(11) and Conteo_2_Control)) or ((Q(12) and Conteo_3_Control))) or (Q(13) and confirmar));   --((((Q(9)or Q(10) or (Q(11) or Q(12))) or ((Conteo_E1_Control and Conteo_1_Control) or (Conteo_E3_Control and Conteo_4_Control) or (Conteo_E4_Control and Conteo_2_Control) or (Conteo_E2_Control and Conteo_3_Control)))) or (Q(13) and confirmar));
	  
	  D(14) <= ((Q(13) and not confirmar) or (Q(14) and not Confirmar));
	  
	  
	 	  

FF1: dffe port map 	(D(0), Reloj, '1', Reset ,E , Q(0));
FF2: dffe port map 	(D(1), Reloj, Reset, '1', E ,Q(1));
FF3: dffe port map 	(D(2), Reloj, Reset, '1', E ,Q(2));
FF4: dffe port map 	(D(3), Reloj, Reset, '1', E ,Q(3));
FF5: dffe port map 	(D(4), Reloj, Reset, '1', E ,Q(4));
FF6: dffe port map 	(D(5), Reloj, Reset, '1', E ,Q(5));
FF7: dffe port map 	(D(6), Reloj, Reset, '1', E ,Q(6));
FF8: dffe port map 	(D(7), Reloj, Reset, '1', E ,Q(7));
FF9: dffe port map   (D(8), Reloj, Reset, '1', E ,Q(8));
FF10: dffe port map  (D(9), Reloj, Reset, '1', E ,Q(9));
FF11: dffe port map  (D(10), Reloj, Reset, '1', E ,Q(10));
FF12: dffe port map  (D(11), Reloj, Reset, '1', E ,Q(11));
FF13: dffe port map  (D(12), Reloj, Reset, '1', E ,Q(12));
FF14: dffe port map  (D(13), Reloj, Reset, '1', E ,Q(13));
FF15: dffe port map  (D(14), Reloj, Reset, '1', E ,Q(14));

E<= '1';

Ver_Estados <= Q;--toma el valor de los estados

Control_Conteo_E1<= (Q(10)) ;
Control_Conteo_E2<= (Q(12));
Control_Conteo_E3<= (Q(9));
Control_Conteo_E4<= (Q(11));

Control_Conteo_1 <= (Q(10));  
Control_Conteo_2 <= (Q(11)); 
Control_Conteo_3 <= (Q(12)); 
Control_Conteo_4 <= (Q(9)); 
---------------Enables---------------------
--Control_Cantidad_Cafe <= ; 
--Control_Cantidad_Agua <= ;
--
--Control_Contador_Agua <=;
--Control_Contador_Cafe <=;
--------------------------------------------

Valvula_Cafe <= (((Q(9) or Q(10)) or (Q(11) or Q(12))));
Valvula_Agua <= (((Q(9) or Q(10)) or (Q(11) or Q(12))));
Led_Expreso_Listo <= Q(13) ;
Led_Llenar_Almacenamiento  <= Q(6);

End ControlArch;
