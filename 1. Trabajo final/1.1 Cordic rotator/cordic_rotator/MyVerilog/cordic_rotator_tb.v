`timescale 1 ns/100 ps

module cordic_rotator_tb;

localparam SZ = 16; // bits de precisión

reg [SZ-1:0] Xin, Yin;
reg [31:0] angle;
wire [SZ:0] Xout, Yout;
reg CLK_100MHZ;

// Generador de formas de onda

localparam FALSE = 1'b0;
localparam TRUE = 1'b1;

localparam VALUE = 32768/1.647; // reducido por un factor de 1.647 ya que es la ganancia del sistema

reg signed [63:0] i;
reg start;

initial
begin
    start = FALSE;
    $write("Iniciando simulación");
    CLK_100MHZ = 1'b0;
    angle = 0;
    Xin = VALUE; // Xout = 32000*cos(angle)
    Yin = 1'd0;
    i = 0;


    #1000;
    @(posedge CLK_100MHZ);
    start = TRUE;

    // Salida 
    for (i = 0; i < 360; i = i + 1) // de 0 a 359 grados en incrementos de 1 grado
    // for (i = 30; i < 60; i = i + 30) // incrementar solo por 30 grados
    begin
        @(posedge CLK_100MHZ);
        #11700
        start = FALSE;
        angle = ((1 << 32)*(i+1))/360; // ejemplo: 45 grados = 45/360 * 2^32 = 32'b00100000000000000000000000000000 = 45.000 grados -> atan(2^0)
        $display("Ángulo = %d, %h, Xout = %d, Yout = %d", i, angle, Xout, Yout);
    end

    #500
    $write("La simulación ha finalizado");
    $stop;
end

cordic_rotator cordic_rotator(
    .clock(CLK_100MHZ),
    .angle(angle),
    .Xin(Xin),
    .Yin(Yin),
    .Xout(Xout),
    .Yout(Yout)
);

parameter CLK100_SPEED = 10; // 100Mhz = 10nS

initial
begin
    CLK_100MHZ = 1'b0;
    $display("CLK_100MHZ iniciado");
    #5;
    forever
    begin
        #(CLK100_SPEED/2) CLK_100MHZ = 1'b1;
        #(CLK100_SPEED/2) CLK_100MHZ = 1'b0;
    end
end

endmodule