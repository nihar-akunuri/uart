`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2025 12:03:24
// Design Name: 
// Module Name: uart_rx
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


module uart_rx(input clk, reset, data_in,
               output reg [7:0]data_out_rx
               );
   
parameter idle = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;
parameter s3 = 2'b11;

reg [1:0] ps = idle;
reg [1:0] ns = idle;

reg [3:0] count;

reg [9:0]temp;

reg parity;

always @(posedge clk) begin
if(reset)
    ps <= idle;
else
    ps <= ns;    
end          

always @(*) begin
case(ps)
idle: begin
if(data_in == 0)
    ns = s1;
else 
    ns = idle;    
end 
s1: begin
if(count == 9)
    ns = s2;
end  
s2: begin   
    parity = temp[1];
    if(parity == ^temp[9:2])
    data_out_rx = temp[9:2];
    else
    data_out_rx = 0;
    ns = idle;
end 
endcase
end  


always @(posedge clk) begin
 if(ps == s1) begin
    temp = {temp[9:0],data_in};
    count = count + 1;
    end
 else   
    count = 0;   
end      


               
endmodule
