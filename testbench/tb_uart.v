`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2025 14:37:59
// Design Name: 
// Module Name: tb_uart
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


module tb_uart();

reg clk, reset, enable;
reg [7:0] data_in;
wire [7:0] data_out;

uart_top uut(clk, reset, enable, data_in, data_out);

initial {clk, reset, enable, data_in} = 0;

always #2 clk = ~clk;

initial begin
    reset = 1;
    #5;
    reset = 0;
    #5;
    data_in = 8'h5A;
    #10;
    enable = 1;
    #50;
    enable = 0;

end 


endmodule
