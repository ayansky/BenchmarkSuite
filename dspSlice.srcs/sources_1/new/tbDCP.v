`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2019 01:28:13 PM
// Design Name: Parapama
// Module Name: tbDCP
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
`define Period 5

module tbDCP();
reg clk;
reg [17:0] Ain;
reg [17:0] Bin;
wire [47:0] Pout;

initial
begin
    clk = 0;
    forever
    begin
        clk = ~clk;
        #(`Period/2);
    end
end

initial
begin
    //start = 1'b0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    Ain <= 18'h1;
    Bin <= 18'h2;
end

dspSlice dsp(
.clk(clk),
.Ain(Ain),
.Bin(Bin),
.Pout(Pout)
    );  
endmodule
