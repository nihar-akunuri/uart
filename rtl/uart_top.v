`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2025 13:45:13
// Design Name: 
// Module Name: uart_top
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


module uart_top(input clk, reset, enable, 
                input [7:0]data_in,
                output [7:0]data_out);

uart_rx recv(clk, reset, data_out_tx, data_out);
uart_tx trans(clk, enable, data_in, data_out_tx);                
                
endmodule
