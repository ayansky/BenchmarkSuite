`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2019 02:23:00 PM
// Design Name: 
// Module Name: slice
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module slice #(parameter numLUTs=4, numFFs=8)(
input clk,
input wire [numLUTs*6-1:0] inData,
output wire [numFFs-1:0]outData
    );
    
    wire [numLUTs-1:0] lutOut;
    
    generate
    genvar i;
    
    for(i=0;i<numLUTs;i=i+1)
    begin:lutloop
       LUT6 #(
       .INIT(64'h0000000000000000)  // Specify LUT Contents
    ) LUT6_inst (
       .O(lutOut[i]),   // LUT general output
       .I0(inData[i*6]), // LUT input
       .I1(inData[i*6+1]), // LUT input
       .I2(inData[i*6+2]), // LUT input
       .I3(inData[i*6+3]), // LUT input
       .I4(inData[i*6+4]), // LUT input
       .I5(inData[i*6+5])  // LUT input
    );
    end
    endgenerate
    
    
    generate
    genvar j;
    
    for(j=0;j<numFFs;j=j+1)
    begin:ffloop
    
     FDSE #(.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) FDSE_instP (
           .Q(outData[j]),      // 1-bit Data output
           .C(clk),      // 1-bit Clock input
           .CE(1'b1),    // 1-bit Clock enable input
           .S(1'b0),      // 1-bit Synchronous set input
           .D(lutOut[j/(numFFs/numLUTs)])       // 1-bit Data input
        );
    end
    
    endgenerate
   
endmodule
