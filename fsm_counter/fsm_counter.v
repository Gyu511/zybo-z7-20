`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/07 22:52:26
// Design Name: 
// Module Name: fsm_counter
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


module fsm_counter(input clk,rst_n,run, input[31:0] in_count, output reg done);
localparam IDLE = 0;
localparam  RUN = 1;
localparam DONE = 2;

reg[1:0] cur_state;
reg[1:0] next_state;
reg[31:0] count;
reg is_done;

always @(posedge clk, negedge rst_n ) begin 
if(!rst_n )begin 
cur_state  <= IDLE;
next_state  <= IDLE;
end
else begin 
cur_state  <= next_state;
end
end

always @(*)begin 
if(cur_state == IDLE)begin 
if(run) next_state <= RUN;
done <= 0;
is_done <= 0;
end

else if(cur_state == RUN)begin 
if(in_count - 1 == count) begin
is_done <= 1;
next_state <= DONE;
end
else begin 
next_state <= RUN;
done <= 0;
end
end

else if(cur_state == DONE)begin 
next_state <= IDLE;
done <= 1;
is_done <= 0;
end

end

always @(posedge clk)begin
if(cur_state == RUN && next_state != DONE) count <= count + 1;
else count <= 0;
end

endmodule
