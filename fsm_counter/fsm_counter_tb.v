`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/07 22:52:50
// Design Name: 
// Module Name: fsm_counter_tb
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


module fsm_counter_tb();
reg clk,rst_n,run;
reg[31:0] in_count;
wire done;

fsm_counter fsm_counter_inst (.clk(clk),.rst_n(rst_n),.run(run),.in_count(in_count),.done(done));

initial begin 
clk = 0;
rst_n = 1;
run = 0;
#5 rst_n = 0;
#5 rst_n = 1;
#5 run = 1;
in_count = 100;
#5 run = 0;
end

always  #5 clk = ~clk;


endmodule
