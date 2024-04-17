`timescale 1 ns / 10 ps

module sincos_tb ();

localparam CLK_PERIOD = 10; // Nombre de la constante corregido
localparam signed [15:0] PI_POS = 16'b 0110_0100_1000_1000; // Espacios a�adidos para mejor legibilidad
localparam signed [15:0] PI_NEG = 16'b 1001_1011_0111_1000; // Espacios a�adidos para mejor legibilidad
localparam PHASE_INC = 256;

// Declaraci�n de entradas y salidas
reg clk = 1'b0;
reg rst = 1'b1;

reg signed [15:0] phase = 0;
reg phase_tvalid = 1'b0;
wire signed [15:0] cos, sin;
wire sincos_tvalid;

// Instanciaci�n del m�dulo bajo prueba
sincos sincos_inst (
    .clk           (clk),
    .phase         (phase),
    .phase_tvalid  (phase_tvalid),
    .cos           (cos),
    .sin           (sin),
    .sincos_tvalid (sincos_tvalid)
);

// Impresi�n de los valores de salida
initial begin
    clk = 1'b0;
    rst = 1'b1; 
    rst = #(CLK_PERIOD*10) 1'b0;
end

always begin 
    clk = #(CLK_PERIOD/2) ~clk;
end

always @(posedge clk)
begin
  if (rst) begin
    phase <= 0;
    phase_tvalid <= 1'b0;
  end else begin 
    phase_tvalid <= 1'b1;
    
    if (phase+PHASE_INC < PI_POS) begin
      phase <= phase + PHASE_INC;
    end else begin
      phase <= PI_NEG;
    end
  end
end

endmodule


