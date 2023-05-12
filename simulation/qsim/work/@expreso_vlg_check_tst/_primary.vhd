library verilog;
use verilog.vl_types.all;
entity Expreso_vlg_check_tst is
    port(
        Expreso_Tipo    : in     vl_logic_vector(6 downto 0);
        Led_Expreso_Listo: in     vl_logic;
        Led_Llenar_Almacenamiento: in     vl_logic;
        look_state      : in     vl_logic_vector(14 downto 0);
        relojito        : in     vl_logic;
        Valvula_Agua    : in     vl_logic;
        Valvula_Cafe    : in     vl_logic;
        ver_acabadot    : in     vl_logic;
        ver_conteo      : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Expreso_vlg_check_tst;
