library verilog;
use verilog.vl_types.all;
entity Expreso is
    port(
        Reloj           : in     vl_logic;
        Reset           : in     vl_logic;
        Usuario         : in     vl_logic_vector(1 downto 0);
        Llenado_Cafe    : in     vl_logic;
        LLenado_Agua    : in     vl_logic;
        Confirmar       : in     vl_logic;
        Boton_Vaso      : in     vl_logic;
        relojito        : out    vl_logic;
        Expreso_Tipo    : out    vl_logic_vector(6 downto 0);
        look_state      : out    vl_logic_vector(14 downto 0);
        ver_conteo      : out    vl_logic;
        ver_acabadot    : out    vl_logic;
        Valvula_Agua    : out    vl_logic;
        Valvula_Cafe    : out    vl_logic;
        Led_Expreso_Listo: out    vl_logic;
        Led_Llenar_Almacenamiento: out    vl_logic
    );
end Expreso;
