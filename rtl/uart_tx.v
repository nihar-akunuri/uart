`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2025 12:23:59
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(input clk, enable, input[7:0]data_in, 
               output data_out_tx
               );   

reg [10:0]temp;
reg temp_out;

always @(posedge clk) begin

    if(enable) begin
        temp[0] <= 0;
        temp[8:1] <= data_in;
        temp[9] <= ^data_in;
        temp[10] <= 1;
    end
    
    else begin
        temp_out <= temp[0];
        temp <= {1'b0,temp[10:1]};
    end  
end  

assign data_out_tx = enable ? 1 : temp_out;              
               
endmodule
