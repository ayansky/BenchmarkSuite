`timescale 1ns / 1ps

module topModule(
input 
    );
    
    
    

    module dspSlice(
    input clk,
    input [17:0] Ain,
    input [17:0] Bin,
    output [47:0] Pout
        );
        
    module bramSlice(
    input clk,
    input wire [11 : 0] addra,
    input wire [11 : 0] addrb,
    output wire [7 : 0] doutb
        );

    module slice #(parameter numLUTs=4, numFFs=8)(
    input clk,
    input wire [numLUTs*6-1:0] inData,
    output wire [numFFs-1:0]outData
        );
            
endmodule
