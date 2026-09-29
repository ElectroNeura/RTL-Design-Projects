`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 12:11:52
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb();

reg clk,rst;
reg wr_enb;
reg rd_enb;
reg [7:0] d_in;
wire [7:0] d_out;
wire full;
wire empty;

reg [7:0] expected [0:3];
integer i;

fifo dut(clk,rst,wr_enb,rd_enb,d_in,d_out,full,empty);

initial 
   begin
       {clk,rst,wr_enb,rd_enb,d_in}=0;
   end
   
always #5 clk =~clk;

    initial begin
     //test case 1&2
       rst = 1'b1;

          @(posedge clk);
          #1;

           if(rst == 1)
           $display("TEST 1 PASS : reset Condition met");
          @(negedge clk);
          rst = 1'b0;
       
    
       wr_enb=1'b1;
       d_in=10;
     @(posedge clk);
        #1;

       $display("DEBUG: rst=%b wr_enb=%b d_in=%d wr_ptr=%d rd_ptr=%d empty=%b full=%b",rst, wr_enb, d_in, dut.wr_ptr, dut.rd_ptr, empty, full);
       if(empty ==0)
       $display("TEST 2 PASS : Single Write is done ");
       else
       $display("TEST 2 FAIl: Single Write is not done ");
       
       wr_enb=1'b1;
       d_in=8;
       #10;
       
       wr_enb=1'b0;
       rd_enb=1'b1;
       #50;
       rd_enb=1'b0;
       
//test case 3 .... multiple write check right fifo behaviour
     wr_enb=1'b0;
     rd_enb=1'b0;
     rst =1'b1;
     @(posedge clk);
     #1;
     
     @(negedge clk);
     rst =1'b0;
     
     $display("RESET CHECK: wr_ptr=%d rd_ptr=%d empty=%b",
         dut.wr_ptr, dut.rd_ptr, empty);
     
     expected[0]=2;
expected[1]=4;
expected[2]=6;
expected[3]=8;

for(i=0;i<4;i=i+1)
begin
    @(negedge clk);

    wr_enb=1;
    d_in=expected[i];

    @(posedge clk);
    #1;

end

wr_enb=1'b0;
rd_enb=1'b1;

for(i=0;i<4;i=i+1)
begin
    @(posedge clk);
    #1;

    if(d_out == expected[i])
        $display("TEST 3 PASS : Right FIFO Working");
    else
        $display("TEST 3 FAIL");
end
        
//test case 4 ..... full condition

rst = 1'b1;
wr_enb = 1'b0;
rd_enb = 1'b0;

@(posedge clk);
#1;
@(negedge clk);
rst = 1'b0;

expected[0]=2;
expected[1]=4;
expected[2]=6;
expected[3]=8;
expected[4]=10;
expected[5]=12;
expected[6]=14;

for(i=0;i<7;i=i+1)
begin
    @(negedge clk);
    wr_enb=1'b1;
    d_in=expected[i];

    @(posedge clk);
    #1;
end

if(full == 1'b1)
    $display("TEST 4 PASS : FIFO FULL condition detected");
else
    $display("TEST 4 FAIL : FIFO FULL condition not detected");

@(negedge clk);
wr_enb=1'b1;
d_in=16;

@(posedge clk);
#1;

if(full == 1'b1)
    $display("TEST 4 PASS : Write blocked when FIFO is FULL");
else
    $display("TEST 4 FAIL : Write was not blocked when FIFO is FULL");

wr_enb=1'b0;
rd_enb=1'b1;

#100;
rd_enb=1'b0;


//test case 5 .... Read after full check whether full falls to 0 after one read

rst = 1'b1;
wr_enb = 1'b0;
rd_enb = 1'b0;

@(posedge clk);
#1;
@(negedge clk);
rst = 1'b0;

expected[0]=2;
expected[1]=4;
expected[2]=6;
expected[3]=8;
expected[4]=10;
expected[5]=12;
expected[6]=14;

for(i=0;i<7;i=i+1)
begin
    @(negedge clk);
    wr_enb=1'b1;
    d_in=expected[i];

    @(posedge clk);
    #1;
end

if(full == 1'b1)
    $display("TEST 5 PASS : FIFO is FULL before read");
else
    $display("TEST 5 FAIL : FIFO is not FULL before read");

@(negedge clk);
wr_enb=1'b0;
rd_enb=1'b1;

@(posedge clk);
#1;

if(d_out == 2)
    $display("TEST 5 PASS : Correct data read after FULL");
else
    $display("TEST 5 FAIL : Incorrect data read after FULL");

if(full == 1'b0)
    $display("TEST 5 PASS : FULL falls to 0 after one read");
else
    $display("TEST 5 FAIL : FULL did not fall to 0 after one read");

rd_enb=1'b0;


//test case 6 .... write after one space is empty

rst = 1'b1;
wr_enb = 1'b0;
rd_enb = 1'b0;

@(posedge clk);
#1;
@(negedge clk);
rst = 1'b0;

expected[0]=2;
expected[1]=4;
expected[2]=6;
expected[3]=8;
expected[4]=10;
expected[5]=12;
expected[6]=14;

for(i=0;i<7;i=i+1)
begin
    @(negedge clk);
    wr_enb=1'b1;
    d_in=expected[i];

    @(posedge clk);
    #1;
end

if(full == 1'b1)
    $display("TEST 6 PASS : FIFO is FULL");
else
    $display("TEST 6 FAIL : FIFO is not FULL");

@(negedge clk);
wr_enb=1'b0;
rd_enb=1'b1;

@(posedge clk);
#1;

if(full == 1'b0)
    $display("TEST 6 PASS : Space available after read");
else
    $display("TEST 6 FAIL : Space not available after read");

@(negedge clk);
wr_enb=1'b1;
rd_enb=1'b0;
d_in=16;

@(posedge clk);
#1;

if(full == 1'b1)
    $display("TEST 6 PASS : New data written after space became available");
else
    $display("TEST 6 FAIL : New data was not written");

wr_enb=1'b0;
rd_enb=1'b1;

#100;
rd_enb=1'b0;
 //test case 7 ..... simuntaneous read and write in same clock
     wr_enb=1'b0;
     rd_enb=1'b0;
     rst =1'b1;
     @(posedge clk);
     #1;
     
     @(negedge clk);
     rst =1'b0;
     
        @(negedge clk);
        wr_enb=1'b1;
        rd_enb=1'b1;
        d_in=2;
        
        @(posedge clk);
        #1;
         
        d_in=4;
        @(posedge clk);
        #1;
        
        d_in=6;
        @(posedge clk);
        #1;
          
        d_in=8;
        @(posedge clk);
        #1;
         
        d_in=10;
        @(posedge clk);
        #1;
        
        d_in=12;
        @(posedge clk);
        #1;
        
        d_in=14;
        @(posedge clk);
        #1;
          
        d_in=16;
        @(posedge clk);
        #1;

        wr_enb=1'b0;
        rd_enb=1'b0;
        
        #20;
  
       $finish;
       end
endmodule
