--**Decodificador de 2 a 4 y 6 bits**--


library IEEE; 
use IEEE.std_logic_1164.all; 

--******************************************************--
-- Autor:   --
--     Julian Oviedo   --
--   --
--                --
--******************************************************--

entity  Tipo_Expreso is
port(

 Usuario: in std_logic_vector (1 downto 0) ; -- a b
 Tipo_Expreso_Deco_7_Seg :out std_logic_vector (0 to 3);
 Tipo_Expreso_Expreso_Disponible_A : out std_logic_vector (11 downto 0);
 Tipo_Expreso_Expreso_Disponible_C : out std_logic_vector (11 downto 0)-- a b c d

);
        
end entity  Tipo_Expreso;     

architecture  Tipo_ExpresoArch of  Tipo_Expreso is
begin

--Agua--
Tipo_Expreso_Expreso_Disponible_A(0) <= (not Usuario(0) and  Usuario(1));
Tipo_Expreso_Expreso_Disponible_A(1) <= ((not Usuario(0) and not Usuario(1))or (not Usuario(0) and Usuario(1))) ;
Tipo_Expreso_Expreso_Disponible_A(2) <= ((not Usuario(0) and not Usuario(1))or (not Usuario(0) and Usuario(1)) or ( Usuario(0) and not Usuario(1))) ;--10
Tipo_Expreso_Expreso_Disponible_A(3) <= ((not Usuario(0) and not Usuario(1)) or(not Usuario(0) and  Usuario(1)) or ( Usuario(0) and not Usuario(1)) or ( Usuario(0) and  Usuario(1)) );--11
Tipo_Expreso_Expreso_Disponible_A(4) <= ((not Usuario(0) and not Usuario(1))or ( Usuario(0) and not Usuario(1))) ;
Tipo_Expreso_Expreso_Disponible_A(5) <= (( Usuario(0) and not Usuario(1))or ( Usuario(0) and Usuario(1))) ;
 
 --Cafe--
Tipo_Expreso_Expreso_Disponible_C(0) <= (not Usuario(0) and not Usuario(1));
Tipo_Expreso_Expreso_Disponible_C(1) <= ((not Usuario(0) and not Usuario(1)) or(not Usuario(0) and  Usuario(1)) or ( Usuario(0) and not Usuario(1)) or ( Usuario(0) and  Usuario(1)) );
Tipo_Expreso_Expreso_Disponible_C(2) <= ((not Usuario(0) and not Usuario(1)) or(not Usuario(0) and  Usuario(1)) or ( Usuario(0) and not Usuario(1)) or ( Usuario(0) and  Usuario(1)) );
Tipo_Expreso_Expreso_Disponible_C(3) <= ( Usuario(0) and not Usuario(1));
 
 --Decodificador--
 
 Tipo_Expreso_Deco_7_Seg (0) <= ((not Usuario(0) and  not Usuario(1)) or (not Usuario(0) and  Usuario(1)));
 Tipo_Expreso_Deco_7_Seg (1) <= ((Usuario(0) and  not Usuario(1)) or (not Usuario(0) and  Usuario(1)));
 Tipo_Expreso_Deco_7_Seg (2) <= (Usuario(0) and  Usuario(1));
 Tipo_Expreso_Deco_7_Seg (3) <= '0';
 
End  Tipo_ExpresoArch;

