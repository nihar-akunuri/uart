`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 22:06:47
// Design Name: 
// Module Name: baud_rate_gen
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


module baud_rate_gen(input clk, reset, 
                     output reg clk_tx, clk_rx
                     );

parameter clk_freq = 1000000;

parameter baud_rate = 9600;

parameter divisor_tx = clk_freq/baud_rate;

parameter divisor_rx = clk_freq/baud_rate;

reg [13:0] count_rx, count_tx;

always @(posedge clk) begin
    if(reset) begin 
        clk_tx = 0;
        count_tx = 0;
    end 
    else if (count_tx == divisor_tx - 1) begin 
        clk_tx = ~clk_tx;
        count_tx = 0;
    end
    else
        count_tx = count_tx + 1;
end                      
                     
                     
endmodule
