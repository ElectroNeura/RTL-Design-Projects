`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 11:45:54
// Design Name: 
// Module Name: fifo
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


module fifo(input clk, rst,
            input wr_enb ,rd_enb,
            input [7:0] d_in,
            output reg [7:0] d_out,
            output full, empty);
            
reg [7:0] mem [0:7];
integer i;
reg [2:0] wr_ptr;
reg [2:0] rd_ptr;
            
 always@(posedge clk)
      begin
         if(rst)
           begin
           for(i=0;i<8;i=i+1)
            mem[i]<=1'b0;
            
            wr_ptr<=3'b000;
            rd_ptr<=3'b000;
            d_out<=8'b0;
           
           end
           
       if(wr_enb && full==0)
             begin
               mem[wr_ptr]<=d_in;
               wr_ptr <= wr_ptr+1'b1;
             end
             
       if(rd_enb && empty==0)
             begin
               d_out<=mem[rd_ptr];
               rd_ptr <= rd_ptr+1'b1;
             end
         end

assign full=((wr_ptr+1'b1)==rd_ptr) ? 1'b1 : 1'b0 ;
assign empty=(wr_ptr==rd_ptr);

endmodule
