`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2026 11:39:50
// Design Name: 
// Module Name: Ram8_8
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


module Ram8_8( input clk,rst,wr_enb,
               input [2:0] wr_addr,[2:0] rd_addr,
               input [7:0] d_in, output reg [7:0] d_out);
               
// create a temp memory file for storing purpose of 8 location with 8 bits each

reg [7:0] mem [7:0];
integer i;

// create read and write logic 

always@(posedge clk or posedge rst)
      begin
          if(rst) 
           begin
            for(i=0;i<8;i=i+1)
             mem[i]<=0;
           end
          else begin
            if(wr_enb)
               mem[wr_addr]<=d_in;
            else if(wr_enb==0)
               d_out<=mem[rd_addr];
          end
       end
endmodule
