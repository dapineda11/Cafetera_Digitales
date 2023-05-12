library IEEE; 
use IEEE.std_logic_1164.all; 

--******************************************************--
-- Autor:   --
--     Daniel Pineda  --
--   --
--                --
--******************************************************--

entity Deco_7_Seg is
port(

 Tipo_Expreso_Deco_7_Seg  : in std_logic_vector (0 to 3) ; -- x y z w
  Expreso_Tipo : out std_logic_vector (0 to 6)-- a b c d e f g 
 
);
        
end entity Deco_7_Seg;     

architecture Deco_7_SegArch of Deco_7_Seg is
begin

 Expreso_Tipo(0) <=  not ((Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)));--a
 Expreso_Tipo(1) <=  not ((Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) or NOT Tipo_Expreso_Deco_7_Seg(1) or NOT Tipo_Expreso_Deco_7_Seg(2) or Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) or NOT Tipo_Expreso_Deco_7_Seg(1) or NOT Tipo_Expreso_Deco_7_Seg(2) or NOT Tipo_Expreso_Deco_7_Seg(3)));--b
 Expreso_Tipo(2) <=  not ((Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) or  Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) or  Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)));--c
 Expreso_Tipo(3) <=  not ((Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) );--d
 Expreso_Tipo(4) <=  not ((Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)));--e
 Expreso_Tipo(5) <=  not ((Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR NOT Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)) AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3)));--f
 Expreso_Tipo(6) <=  not ((Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR Tipo_Expreso_Deco_7_Seg(3)) AND (Tipo_Expreso_Deco_7_Seg(0) OR Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR NOT Tipo_Expreso_Deco_7_Seg(3))AND (NOT Tipo_Expreso_Deco_7_Seg(0) OR NOT Tipo_Expreso_Deco_7_Seg(1) OR Tipo_Expreso_Deco_7_Seg(2) OR Tipo_Expreso_Deco_7_Seg(3)));--g
 
 
End Deco_7_SegArch;

