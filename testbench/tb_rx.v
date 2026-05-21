`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 18:05:57
// Design Name: 
// Module Name: tb_rx
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


module tb_rx();

reg clk, reset, data_in;
wire [7:0] data_out_rx;

initial {clk, reset, data_in} = 1;

uart_rx recv(clk, reset, data_in, data_out_rx);

always #2 clk = ~clk;

initial begin
@(negedge clk)
data_in = 1;
@(negedge clk)
data_in = 1;
@(negedge clk)
data_in = 0;
@(negedge clk)
data_in = 0;
@(negedge clk)
data_in = 1;
@(negedge clk)
data_in = 1;
@(negedge clk)
data_in = 0;
@(negedge clk)
data_in = 1;
@(negedge clk)
data_in = 0;
@(negedge clk)
data_in = 1;
@(negedge clk)
data_in = 0;
@(negedge clk)
data_in = 0;
@(negedge clk)
data_in = 1;
@(negedge clk)
data_in = 1;
@(negedge clk)
data_in = 1;
end

endmodule
