
--*******************Bloque General****************************************--
--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;

--***********************************************************--
--               DEFINICIÓN DE ENTIDAD                       --
--***********************************************************--

entity Expreso is

port(
		--entradas y salidas del sistema
		
		Reloj			  : in std_logic; --Reloj por defecto
		Reset			  : in std_logic; --Reset por defecto
		Usuario   		  : in std_logic_vector(1 downto 0); --Datos ingresados por el usuario
		Llenado_Cafe      : in std_logic;
		LLenado_Agua      : in std_logic;
		Confirmar         : in std_logic;
		Boton_Vaso        : in std_logic;
		
		

		relojito          : out std_logic;		--Señal para visualizar el reloj
		Expreso_Tipo	  : out std_logic_vector (6 downto 0); --El siete segementos donde se mostrará el dígito.
		look_state        : out std_logic_vector (14 downto 0); -- Mirar el estado en el que va
		ver_conteo			 : out std_logic; 
		ver_acabadot		 : out std_logic; 
		Valvula_Agua 		: out std_logic; 
      Valvula_Cafe : out std_logic;
		Led_Expreso_Listo : out std_logic;
		Led_Llenar_Almacenamiento : out std_logic
		);
end entity Expreso;   
           
--******************************************************--
		------DEFinICIÓN DE ARQUITECTURA -----
--******************************************************--

--Definimos la arquitectura
--Y  procedemos a poner los bloques con sus respectivas entradas y salidas

architecture ExpresoArch of Expreso is

		component Control 
		port(
Reloj     : in std_logic;
Reset     : in std_logic;
Usuario : in std_logic_vector(1 downto 0); 
Boton_Vaso : in std_logic;
Confirmar : in std_logic;

Expreso_Disponible_Control : in std_logic;--Hay Agua-- mayor que el umbral
Llenado_Cafe : in std_logic;
Llenado_Agua : in std_logic;

---------------------------------------
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

Valvula_Agua : out std_logic; 
Valvula_Cafe : out std_logic;
Led_Expreso_Listo : out std_logic;
Led_Llenar_Almacenamiento : out std_logic;

ver_Estados : out std_logic_vector(14 downto 0)

	); 
end component Control;		

--************Tipo_Expreso****************----
------------------------------------------------------------
		component Tipo_Expreso 
		port(

			Usuario										: in std_logic_vector (1 downto 0) ; -- a b
			Tipo_Expreso_Deco_7_Seg  				: out std_logic_vector(0 to 3);
			Tipo_Expreso_Expreso_Disponible_A	: out std_logic_vector (11 downto 0);-- a b c d
			Tipo_Expreso_Expreso_Disponible_C	: out std_logic_vector (11 downto 0)
 
		);
		end component Tipo_Expreso;
-------------------------------------------------------------
--***************Expreso_Disponible*************------
-----------------------------------------------------------
		component Comp_C-- Comparador 11 bits
		port(    
		
				Tipo_Expreso_Expreso_Disponible: in std_logic_vector(11 downto 0);
				Contador_Cafe_Expreso_Disponible: in std_logic_vector(11 downto 0);
				
				MayorC			: out std_logic;
				MenorC         : out std_logic;
          	IgualC			: out std_logic
							
				--a :   in std_logic_vector(10 downto 0);
				--b :   in std_logic_vector(10 downto 0)
			
		);
		end component Comp_C;
-------------------------------------------------------------
------------------------------------------------------------
		component Comp_A-- Comparador de 12 bits 
		port(    
				
				Tipo_Expreso_Expreso_Disponible :   in std_logic_vector(11 downto 0);
				Contador_Agua_Expreso_Disponible:   in std_logic_vector(11 downto 0);

				MayorA			: out std_logic;
				MenorA       : out std_logic;
          	IgualA			: out std_logic
		
				--a :   in std_logic_vector(11 downto 0);
				--b :   in std_logic_vector(11 downto 0)
			
		);
		end component Comp_A;
-------------------------------------------------------------
-----------------------------------------------------------
		component Expreso_Dispo is 
		port(
				
				MayorA			: in std_logic;
				MenorA        : in std_logic;
          	IgualA		 : in std_logic;
				
				MayorC			: in std_logic;
				MenorC        : in std_logic;
          	IgualC		 : in std_logic;
				
--			
			--Contador_Cafe_Expreso_Disponible			: in std_logic;
			--Contador_Agua_Expreso_Disponible   		: in std_logic;
			Expreso_Disponible_Control					:   out std_logic
						
);
		end component Expreso_Dispo;
-------------------------------------------------------------
	--******************************************************--
component Conteo_1 is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Conteo_1  : in std_logic; 
Conteo_1_Control  : out std_logic ; 
Ver_Conteo        : out std_logic_vector(3 downto 0)
); 
end component Conteo_1;    
------------------------------------------------------------
component Conteo_2 is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Conteo_2  : in std_logic; 
Conteo_2_Control  : out std_logic ; 
Ver_Conteo        : out std_logic_vector(3 downto 0)
); 
end component Conteo_2;    
	
------------------------------------------------------------
------------------------------------------------------------
component Conteo_3 is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Conteo_3  : in std_logic; 
Conteo_3_Control  : out std_logic ; 
Ver_Conteo        : out std_logic_vector(3 downto 0)
); 
end component Conteo_3;     
	
------------------------------------------------------------
------------------------------------------------------------
component Conteo_4 is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Conteo_4  : in std_logic; 

Conteo_4_Control  : out std_logic ; 
Ver_Conteo        : out std_logic_vector(3 downto 0)
); 
end component Conteo_4;     	
------------------------------------------------------------
------------------------------------------------------------
component Conteo_E1 is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Conteo_E1  : in std_logic; 
Conteo_E1_Control  : out std_logic ; 
Ver_Conteo        : out std_logic_vector(5 downto 0)
); 
end component Conteo_E1;     
	
------------------------------------------------------------
------------------------------------------------------------
component Conteo_E2 is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Conteo_E2  : in std_logic; 
Conteo_E2_Control  : out std_logic ; 
Ver_Conteo        : out std_logic_vector(5 downto 0)
); 
end component Conteo_E2;     
------------------------------------------------------------
------------------------------------------------------------
component Conteo_E3 is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Conteo_E3  : in std_logic; 
Conteo_E3_Control  : out std_logic ; 
Ver_Conteo        : out std_logic_vector(5 downto 0)
); 
end component Conteo_E3;     
------------------------------------------------------------
------------------------------------------------------------
	component Conteo_E4 is
port(
Reloj     : in std_logic;
Reset     : in std_logic;
Control_Conteo_E4  : in std_logic; 
Conteo_E4_Control  : out std_logic ; 
Ver_Conteo        : out std_logic_vector(5 downto 0)
); 
end component Conteo_E4;   
------------------------------------------------------------

		component Cantidad_Agua
		port(
			Reloj     : in std_logic;
			Reset     : in std_logic;
			Control_Cantidad_Agua  : in std_logic; 
			Cantidad_Agua_Control  : out std_logic ; 
			Ver_Conteo        : out std_logic_vector(5 downto 0)
		); 
		end component Cantidad_Agua;
-------------------------------------------------------------
-----------------------------------------------------------
		component Cantidad_Cafe
		port(
				Reloj     : in std_logic;
				Reset     : in std_logic;
				Control_Cantidad_Cafe  : in std_logic; 
				Cantidad_Cafe_Control  : out std_logic ; 
				Ver_Conteo        : out std_logic_vector(3 downto 0)
		); 
		end component Cantidad_Cafe;
-------------------------------------------------------------
-----------------------------------------------------------
		component Contador_Agua is 
		port(
			Reloj     : in std_logic;
			Reset     : in std_logic;
			Control_Contador_Agua  : in std_logic;--_vector(1 downto 0); 
			
			Contador_Agua_Expreso_Disponible : out std_logic_vector(11 downto 0);  
			Ver_Conteo : out std_logic_vector(11 downto 0)
		); 
		end component Contador_Agua;
-------------------------------------------------------------
-----------------------------------------------------------
		component Contador_Cafe is 
		port(
			Reloj     : in std_logic;
			Reset     : in std_logic;
			Control_Contador_Cafe  : in std_logic;--_vector(1 downto 0); 

			--Contador_Cafe_Control  : out std_logic ; 
			Contador_Cafe_Expreso_Disponible : out std_logic_vector(11 downto 0) ; 
			Ver_Conteo        : out std_logic_vector(11 downto 0)
		); 
		end component Contador_Cafe;
-------------------------------------------------------------
-----------------------------------------------------------
		component Deco_7_Seg is 
		port(

				Tipo_Expreso_Deco_7_Seg: in std_logic_vector (0 to 3) ; -- x y z w
				Expreso_Tipo : out std_logic_vector (0 to 6)-- a b c d e f g 
				
);
		end component Deco_7_Seg;
-------------------------------------------------------------
-----------------------------------------------------------
--		component Expreso_Listo is 
--		port(
--
--				Usuario: in std_logic_vector (3 downto 0 ) ; -- x y z w
--				Expreso_Tipo : out std_logic_vector (6 downto 0)-- a b c d e f g 
-- 
--);
--		end component Expreso_Listo;
-------------------------------------------------------------

--******************************************************--
--DEFINICIÓN DE SEÑALES DE CONEXIÓN                                        
--******************************************************--
----------------------------Señales de unión entre bloques--------------

--Inputs Control
		
		signal Tipo_Expreso_Control1    	   	: std_logic;
		signal Expreso_Disponible_Control1      : std_logic;
		Signal Conteo_E1_Control1      : std_logic;
		Signal Conteo_E2_Control1      : std_logic;
		Signal Conteo_E3_Control1      : std_logic;
		Signal Conteo_E4_Control1      : std_logic;
		Signal Conteo_1_Control1       : std_logic;
		Signal Conteo_2_Control1       : std_logic;
		Signal Conteo_3_Control1       : std_logic;
		Signal Conteo_4_Control1       : std_logic;

--Outputs Control	
		
		signal Control_Conteo_E11      :  std_logic;
		signal Control_Conteo_E21      :  std_logic;
		signal Control_Conteo_E31      :  std_logic;
		signal Control_Conteo_E41      :  std_logic;
		signal Control_Conteo_11      :  std_logic;
		signal Control_Conteo_21      :  std_logic;
		signal Control_Conteo_31      :  std_logic;
		signal Control_Conteo_41      :  std_logic;


		signal Control_Cantidad_Agua1      : std_logic;
		signal Control_Cantidad_Cafe1      : std_logic;
		signal Control_Contador_Agua1      : std_logic;
		signal Control_Contador_Cafe1      : std_logic;--_vector(1 downto 0);

		
         
			signal Tipo_Expreso_Expreso_Disponible1   : std_logic_vector(11 downto 0);
        signal Tipo_Expreso_Expreso_Disponible   : std_logic_vector(11 downto 0);
			signal Tipo_Expreso_Expreso_Disponible_A1 : std_logic_vector(11 downto 0);
			signal Tipo_Expreso_Expreso_Disponible_C1 : std_logic_vector(11 downto 0);
			signal Tipo_Expreso_Deco_7_Seg1       		: std_logic_vector(3 downto 0);
         
		 --signal contador_Agua_Expreso_Disponible        : std_logic;	
		 signal Contador_Agua_Expreso_Disponible1 	: std_logic_vector(11 downto 0); 
		 signal Contador_Cafe_Expreso_Disponible1 	: std_logic_vector(11 downto 0);
		 --signal Contador_Cafe_Expreso_Disponible 	: std_logic;
	
		signal  ver_Estados1							 :std_logic_vector(14 downto 0);
		
	  --signal ver_conteo1                   : std_logic;
		 
				signal MayorA1				: std_logic;
				signal MenorA1       	 	:  std_logic;
				signal IgualA1				:  std_logic;
				
				signal MayorC1				: std_logic;
				signal MenorC1        	:  std_logic;
				signal IgualC1		 		:  std_logic;
			
			 
--				signal  Valvula_Agua1	 :std_logic;
		-- signal Valvula_Cafe1					  :std_logic;
		--signal Llenado_Agua1                     :std_logic;
		--signal Llenado_Cafe1                     :std_logic;
		 
		 --signal Led_Expreso_Listo1                :std_logic;
		-- signal Led_Llenar_Almacenamiento1        :std_logic;
		
		 
---------------------------------------------------------------------------
--******************************************************--
--Instancias y Conectividad                             --
--******************************************************--
begin

--Definicion de las entradas y salidas y emperejamientos de salidas

BLOQUE_P_Control: Control port map ( Reloj,Reset, Usuario, Boton_Vaso, Confirmar,Expreso_Disponible_Control1,Llenado_Cafe ,Llenado_Agua,  Conteo_E1_Control1, Conteo_E2_Control1, Conteo_E3_Control1, Conteo_E4_Control1,Conteo_1_Control1,Conteo_2_Control1,Conteo_3_Control1, Conteo_4_Control1, Control_Conteo_E11 ,Control_Conteo_E21, Control_Conteo_E31,Control_Conteo_E41, Control_Conteo_11 , Control_Conteo_21, Control_Conteo_31,  Control_Conteo_41, Control_Cantidad_Agua1, Control_Cantidad_Cafe1, Control_Contador_Agua1, Control_Contador_Cafe1, Valvula_Agua, Valvula_Cafe,Led_Expreso_Listo, Led_Llenar_Almacenamiento,ver_Estados1) ;

BLOQUE_P_Tipo_Expreso: Tipo_Expreso port map( Usuario, Tipo_Expreso_Deco_7_Seg1,Tipo_Expreso_Expreso_Disponible_A1,Tipo_Expreso_Expreso_Disponible_C1);--, Tipo_Expreso_Expreso_Disponible1);-- );--, Tipo_Expreso_Expreso_Disponible,Tipo_Expreso_Deco_7_Seg1); 

BLOQUE_P_Comp_C : Comp_C port map (Tipo_Expreso_Expreso_Disponible_C1,Contador_Cafe_Expreso_Disponible1, MayorC1,MenorC1,IgualC1);

BLOQUE_P_Comp_A : Comp_A port map (Tipo_Expreso_Expreso_Disponible_A1,Contador_Agua_Expreso_Disponible1, MayorA1,MenorA1,IgualA1);

BLOQUE_P_Expreso_Dispo: Expreso_Dispo port map( MayorA1,MenorA1, IgualA1, MayorC1,MenorC1, IgualC1, Expreso_Disponible_Control1);
    

BLOQUE_P_Deco_7_Seg: Deco_7_Seg port map( Tipo_Expreso_Deco_7_Seg1, Expreso_Tipo);
BLOQUE_P_Cantidad_Agua: Cantidad_Agua port map (Reloj, Reset, Control_Cantidad_Agua1);
BLOQUE_P_Cantidad_Cafe: Cantidad_Cafe port map (Reloj, Reset, Control_Cantidad_Cafe1);

BLOQUE_P_Conteo_1: Conteo_1 port map (Reloj, Reset, Control_Conteo_11, Conteo_1_Control1);
BLOQUE_P_Conteo_2: Conteo_2 port map (Reloj, Reset, Control_Conteo_21, Conteo_2_Control1);
BLOQUE_P_Conteo_3: Conteo_3 port map (Reloj, Reset, Control_Conteo_31, Conteo_3_Control1);
BLOQUE_P_Conteo_4: Conteo_4 port map (Reloj, Reset, Control_Conteo_41, Conteo_4_Control1);

BLOQUE_P_Conteo_E1: Conteo_1 port map (Reloj, Reset, Control_Conteo_E11, Conteo_E1_Control1);
BLOQUE_P_Conteo_E2: Conteo_1 port map (Reloj, Reset, Control_Conteo_E21, Conteo_E2_Control1);
BLOQUE_P_Conteo_E3: Conteo_1 port map (Reloj, Reset, Control_Conteo_E31, Conteo_E3_Control1);
BLOQUE_P_Conteo_E4: Conteo_1 port map (Reloj, Reset, Control_Conteo_E41, Conteo_E4_Control1);


BLOQUE_P_Contador_Agua: Contador_Agua port map (Reloj, Reset, Control_Contador_Agua1 ,  Contador_Agua_Expreso_Disponible1);

BLOQUE_P_Contador_Cafe: Contador_Cafe port map (Reloj, Reset, Control_Contador_Cafe1, Contador_Cafe_Expreso_Disponible1);

look_state <= ver_Estados1;
ver_conteo <= Conteo_4_Control1;
ver_acabadot <= Expreso_Disponible_Control1;
relojito<=Reloj;
--ver_fin_conteo<=Contador_control;

end ExpresoArch;