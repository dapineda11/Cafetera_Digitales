-- Comparador 
--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;

--******************--
-- Comentarios  						                       --
--     												           --
--                                                      --
--******************--

entity Comparador is
	port(   

				Guardar_Clave_1_Comparador :   in std_logic_vector(8 downto 0);
				Guardar_Clave_2_Comparador :   in std_logic_vector(8 downto 0);
			
				
          	Igual		 : out std_logic
			
	);
	end entity Comp_A;

	
architecture ComparadorArch of Comparador is

Signal a :  std_logic_vector(8 downto 0);
Signal b :  std_logic_vector(8 downto 0);

begin 

b <= Guardar_Clave_1_Comparador ;
a <= Guardar_Clave_2_Comparador ;

IgualA<=((not (a(8) xor b(8))) and (not (a(7) xor b(7))) and (not (a(6) xor b(6))) and (not(a(5) xor b(5))) and (not(a(4) xor b(4))) and (not(a(3) xor b(3))) and (not(a(2) xor b(2)))and (not(a(1) xor b(1))) and (not(a(0) xor b(0))));  


End Comp_AArch;