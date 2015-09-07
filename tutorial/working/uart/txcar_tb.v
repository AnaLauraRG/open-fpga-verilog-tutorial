//-------------------------------------------------------------------
//-- sectones_tb.v
//-- Banco de pruebas para el secuenciador de 4 notas
//-------------------------------------------------------------------
//-- BQ August 2015. Written by Juan Gonzalez (Obijuan)
//-------------------------------------------------------------------
//-- GPL License
//-------------------------------------------------------------------
`include "baudgen.vh"

module txcar_tb();

//-- Registro para generar la señal de reloj
reg clk = 0;

//-- Salida de la uart
wire tx;
wire act;

txcar #( .BAUD(`B115200), .DELAY(4000) )
  dut(
    .clk(clk),
    .tx(tx),
    .act(act)
  );

//-- Generador de reloj. Periodo 2 unidades
always 
  # 1 clk <= ~clk;


//-- Proceso al inicio
initial begin

  //-- Fichero donde almacenar los resultados
  $dumpfile("txcar_tb.vcd");
  $dumpvars(0, txcar_tb);

  # 40000 $display("FIN de la simulacion");
  $finish;
end

endmodule

