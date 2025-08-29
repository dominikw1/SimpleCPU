`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2025 17:55:01
// Design Name: 
// Module Name: ALU_Test
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


module ALU_Test(
       
    );
    
    reg clk;
    reg [7:0] in_1;
    reg [7:0] in_2;
    wire [7:0] out; 
    wire carry; 
    reg [7:0] select;
   
   ALU alu(select, in_1, in_2, out, carry);
   
   always @ (posedge clk) begin
        in_1 <= in_1 +1;
        in_2 <= in_2 - 2;
   end
   
   initial begin
        select <= 8'b0;
        in_1 <= 8'd6;
        in_2 <= 8'd1;
         #10;
   end
   
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
        // Monitoring block to display values
    initial begin
        $monitor("Time=%0t, select=%h, in_1=%d, in_2=%d, out=%d, carry=%b",
                 $time, select, in_1, in_2, out, carry);
        #50 $finish;
    end
endmodule
