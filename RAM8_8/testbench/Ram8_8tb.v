`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2026 11:55:34
// Design Name: 
// Module Name: Ram8_8tb
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


module Ram8_8tb();

reg clk,rst;
reg wr_enb;
reg [2:0] wr_addr;
reg [2:0] rd_addr;
reg [7:0] d_in;
wire [7:0] d_out;


Ram8_8 dut(clk,rst,wr_enb,wr_addr,rd_addr,d_in,d_out);

initial 
   begin
       {clk,rst,wr_enb,wr_addr,rd_addr,d_in}=0;
   end
   
always #5 clk =~clk;

initial 
      begin
       rst=1'b1;
       #10;
       rst=1'b0;
       
       wr_enb=1'b1;
       wr_addr=3'b101;
       d_in=10;
       
       #10
       
       wr_addr=3'b011;
       d_in=8;
       
       #10
       
       wr_enb=1'b0;
       rd_addr=3'b101;
       #10
       rd_addr=3'b011;
      
      end

endmodule
