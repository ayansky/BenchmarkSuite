`timescale 1ns / 1ps


module bramSlice(
input clk,
input wire [11 : 0] addra,
input wire [11 : 0] addrb,
output wire [7 : 0] doutb
    );
   
    
     blk_mem_gen_0 your_instance_name (
      .clka(clk),    // input wire clka
      .wea(1'b1),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [11 : 0] addra
      .dina(8'd0),    // input wire [7 : 0] dina
      .clkb(clk),    // input wire clkb
      .addrb(addrb),  // input wire [11 : 0] addrb
      .doutb(doutb)  // output wire [7 : 0] doutb
    );

endmodule