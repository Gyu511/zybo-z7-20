`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/05 01:05:02
// Design Name: 
// Module Name: led_tb
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


module led_tb();
reg clk,rst;
reg[3:0] sw;
wire[3:0] led;

led u1 (.clk(clk),.rst_n(rst),.sw(sw),.led(led));

initial begin 
clk=0;
rst=1;
#1 rst=0;
sw=4'b0000;
#1 rst=1;
sw=4'b1111;
while(1) begin
#0.1 clk=~clk;
end
end 

endmodule
