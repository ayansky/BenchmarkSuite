`timescale 1ns / 1ps


module dspSlice(
input clk,
input [17:0] Ain,
input [17:0] Bin,
output [47:0] Pout
    );
    
 reg S =0;
 reg CE =1;   
 wire [17:0] A;
 wire [17:0] B;
 wire [47:0] P;
 
 genvar i;
 generate
for(i=0; i<18; i=i+1)
 begin
 FDSE #(.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDSE_instA (
        .Q(A[i]),      // 1-bit Data output
        .C(clk),      // 1-bit Clock input
        .CE(CE),    // 1-bit Clock enable input
        .S(S),      // 1-bit Synchronous set input
        .D(Ain[i])       // 1-bit Data input
     );
     
      FDSE #(.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
    ) FDSE_instB (
            .Q(B[i]),      // 1-bit Data output
            .C(clk),      // 1-bit Clock input
            .CE(CE),    // 1-bit Clock enable input
            .S(S),      // 1-bit Synchronous set input
            .D(Bin[i])       // 1-bit Data input
         );
 end
 endgenerate
 
  
genvar k;
 generate
for(k=0; k<48; k=k+1)
 begin
 FDSE #(.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
) FDSE_instP (
        .Q(Pout[k]),      // 1-bit Data output
        .C(clk),      // 1-bit Clock input
        .CE(CE),    // 1-bit Clock enable input
        .S(S),      // 1-bit Synchronous set input
        .D(P[k])       // 1-bit Data input
     );
 end
 endgenerate
 

xbip_dsp48_macro_0 your_instance_name (
      .CLK(clk),  // input wire CLK
      .A(A),      // input wire [17 : 0] A
      .B(B),      // input wire [17 : 0] B
      .C(Pout),      // input wire [47 : 0] C
      .P(P)      // output wire [47 : 0] P
    );
    
endmodule