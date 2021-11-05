`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/05 00:20:16
// Design Name: 
// Module Name: led
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


module led(input clk,rst_n, input[31:0] in_cnt0,in_cnt1,in_cnt2,in_cnt3, input[3:0] sw, output[3:0] led);


counter counter0 (.clk(clk),.rst(rst_n),.enable(sw[0]),.in_cnt(in_cnt0),.toggle(led[0]));
counter counter1 (.clk(clk),.rst(rst_n),.enable(sw[1]),.in_cnt(in_cnt1),.toggle(led[1]));
counter counter2 (.clk(clk),.rst(rst_n),.enable(sw[2]),.in_cnt(in_cnt2),.toggle(led[2]));
counter counter3 (.clk(clk),.rst(rst_n),.enable(sw[3]),.in_cnt(in_cnt3),.toggle(led[3]));

endmodule

module counter(input clk,rst,enable, input[31:0] in_cnt, output reg toggle);
reg [31:0] cur_cnt;

always @(posedge clk) begin 
if(!rst) begin 
cur_cnt <= 0;
toggle  <= 0;
end
else if(!enable) begin 
cur_cnt <= 0;
toggle  <= 0;
end
else if(cur_cnt>=in_cnt-1) begin
cur_cnt <= 0;
toggle <= ~toggle;
end
else begin 
cur_cnt <= cur_cnt+1;
end
end

endmodule