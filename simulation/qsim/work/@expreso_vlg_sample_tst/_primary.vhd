library verilog;
use verilog.vl_types.all;
entity Expreso_vlg_sample_tst is
    port(
        Boton_Vaso      : in     vl_logic;
        Confirmar       : in     vl_logic;
        LLenado_Agua    : in     vl_logic;
        Llenado_Cafe    : in     vl_logic;
        Reloj           : in     vl_logic;
        Reset           : in     vl_logic;
        Usuario         : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end Expreso_vlg_sample_tst;
