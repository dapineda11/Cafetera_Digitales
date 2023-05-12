transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Expreso.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Deco_7_Seg/Deco_7_Seg.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Expreso_Dispo/Expreso_Dispo.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Expreso_Dispo/Comp_A/Comp_A.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Expreso_Dispo/Comp_C/Comp_C.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Tipo_Expreso/Tipo_Expreso.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Conteo_1/Conteo_1.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Conteo_2/Conteo_2.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Conteo_3/Conteo_3.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Conteo_4/Conteo_4.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Cantidad_Agua/Cantidad_Agua.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Cantidad_Cafe/Cantidad_Cafe.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Contador_Agua/Contador_Agua.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Contador_Cafe/Contador_Cafe.vhd}
vcom -93 -work work {C:/Users/estudiante/Desktop/Expreso/Control/Control.vhd}

