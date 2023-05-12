-- Comparador Nivel Contador Tanque de Agua y Café
--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;

--******************--
entity Expreso_Dispo is
	port(   

			MayorA			: in std_logic;
			MenorA        : in std_logic;
         IgualA		 : in std_logic;
				
			MayorC			: in std_logic;
			MenorC        : in std_logic;
         IgualC		 : in std_logic;
			
		
			--Contador_Cafe_Expreso_Disponible			: in std_logic;
			--Contador_Agua_Expreso_Disponible   : in std_logic;
			
			
			Expreso_Disponible_Control:   out std_logic
				
						
	);
	end entity Expreso_Dispo;

	
architecture Expreso_DispoArch of Expreso_Dispo is

begin 

Expreso_Disponible_Control<= (MayorA and MayorC);


End Expreso_DispoArch;