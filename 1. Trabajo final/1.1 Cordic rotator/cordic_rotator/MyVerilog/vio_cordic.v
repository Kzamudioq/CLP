module vio_cordic (
    input wire clk  // Reloj del sistema
);

// Conexiones internas
wire signed [31:0] angle;
wire signed [15:0] Xin, Yin;
wire signed [16:0] Xout, Yout;

// Instancia de cordic_rotator
cordic_rotator cordic_rotator (
    .clock(clk),
    .angle(angle),
    .Xin(Xin),
    .Yin(Yin),
    .Xout(Xout),
    .Yout(Yout)
);

// Instancia de VIO para la simulación y pruebas
vio_cordic_rotator vio_cordic_rotator (
    .clk(clk),
    .probe_in0(Xout),
    .probe_in1(Yout),
    .probe_out0(angle),
    .probe_out1(Xin),
    .probe_out2(Yin)
);


endmodule


