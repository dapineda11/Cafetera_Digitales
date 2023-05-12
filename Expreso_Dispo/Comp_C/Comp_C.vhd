			--Comparador de Cáfe--
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

entity Comp_C is
	port(   
							
				Tipo_Expreso_Expreso_Disponible   : in std_logic_vector(11 downto 0);
				Contador_Cafe_Expreso_Disponible  : in std_logic_vector(11 downto 0);
				--Contador_Cafe_Expreso_Disponible1 : in std_logic_vector(11 downto 0);
				MayorC			: out std_logic;
				MenorC         : out std_logic;
          	IgualC			 : out std_logic
	);
	end entity Comp_C;

	
architecture Comp_CArch of Comp_C is

Signal a :  std_logic_vector(11 downto 0);
Signal b :  std_logic_vector(11 downto 0);

begin 

b <= Tipo_Expreso_Expreso_Disponible;
a <= Contador_Cafe_Expreso_Disponible;
IgualC<=((not (a(10) xor b(10))) and (not(a(9) xor b(9))) and (not (a(8) xor b(8))) and (not (a(7) xor b(7))) and (not (a(6) xor b(6))) and (not(a(5) xor b(5))) and (not(a(4) xor b(4))) and (not(a(3) xor b(3))) and (not(a(2) xor b(2)))and (not(a(1) xor b(1))) and (not(a(0) xor b(0))));  
MayorC<=((a(10) and (not b(10))) or ((not (a(10) xor b(10))) and (a(9) and (not b(9)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (a(8) and (not b(8)))) or ((not (a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (a(7) and (not b(7)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not(a(7) xor b(7))) and (a(6) and (not b(6)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (a(5) and (not b(5)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not (a(5) xor b(5))) and  (a(4) and (not b(4)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not (a(5)xor b(5))) and (not (a(4)xor b(4))) and (a(3) and (not b(3)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not (a(5)xor b(5))) and (not (a(4)xor b(4))) and (not (a(3)xor b(3))) and (a(2) and (not b(2)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not (a(5)xor b(5))) and (not (a(4)xor b(4))) and (not (a(3)xor b(3))) and (not (a(2)xor b(2))) and (a(1) and (not b(1)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not (a(5)xor b(5))) and (not (a(4)xor b(4))) and (not (a(3)xor b(3))) and (not (a(2)xor b(2))) and (not (a(1)xor b(1))) and (a(0) and (not b(0))))) ;
MenorC<=((not a(10) and (b(10))) or ((not (a(10) xor b(10))) and (not a(9) and (b(9)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not a(8) and ( b(8)))) or ((not (a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not a(7) and (b(7)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not(a(7) xor b(7))) and (not a(6) and (b(6)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not a(5) and (b(5)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not (a(5) xor b(5))) and  (not a(4) and (b(4)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not (a(5)xor b(5))) and (not (a(4)xor b(4))) and (not a(3) and (b(3)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not (a(5)xor b(5))) and (not (a(4)xor b(4))) and (not (a(3)xor b(3))) and (not a(2) and (b(2)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not (a(5)xor b(5))) and (not (a(4)xor b(4))) and (not (a(3)xor b(3))) and (not (a(2)xor b(2))) and (not a(1) and (b(1)))) or ((not(a(10)xor b(10))) and (not(a(9) xor b (9))) and (not (a(8)xor b(8))) and (not (a(7) xor b(7))) and (not (a(6)xor b(6))) and (not (a(5)xor b(5))) and (not (a(4)xor b(4))) and (not (a(3)xor b(3))) and (not (a(2)xor b(2))) and (not (a(1)xor b(1))) and (not a(0) and (b(0))))) ;


End Comp_CArch;