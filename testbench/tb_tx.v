`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 18:05:57
// Design Name: 
// Module Name: tb_tx
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


module tb_tx();

reg clk, enable;
reg [7:0] data_in;
wire data_out_tx;

initial {clk, enable, data_in} = 0;

uart_tx trans(clk, enable, data_in, data_out_tx);

always #2 clk = ~clk;

initial begin
@(negedge clk)
data_in = 8'h6A;
@(negedge clk)
enable = 1;
@(negedge clk)
enable = 0;

end 

endmodule
