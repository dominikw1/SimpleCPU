`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2025 17:32:25
// Design Name: 
// Module Name: ALU
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

module Full_Adder (a,b,cin,s,cout);
    input wire a;
    input wire b;
    input wire cin;
    
    output wire s;
    output wire cout;
    
  
    assign s = (a^b) ^ cin;
    assign cout = ((a^b) & cin) | (a& b);
endmodule


module Adder8Bit (a,b,cin,s,cout);
    input wire [7:0] a,b;
    input wire cin;
    
    output wire [7:0] s;
    output wire cout;
    
    wire [6:0] inner_couts;
    
    Full_Adder full_adder0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(inner_couts[0]));
    Full_Adder full_adder1(.a(a[1]), .b(b[1]), .cin(inner_couts[0]), .s(s[1]), .cout(inner_couts[1]));
    Full_Adder full_adder2(.a(a[2]), .b(b[2]), .cin(inner_couts[1]), .s(s[2]), .cout(inner_couts[2]));
    Full_Adder full_adder3(.a(a[3]), .b(b[3]), .cin(inner_couts[2]), .s(s[3]), .cout(inner_couts[3]));
    Full_Adder full_adder4(.a(a[4]), .b(b[4]), .cin(inner_couts[3]), .s(s[4]), .cout(inner_couts[4]));
    Full_Adder full_adder5(.a(a[5]), .b(b[5]), .cin(inner_couts[4]), .s(s[5]), .cout(inner_couts[5]));
    Full_Adder full_adder6(.a(a[6]), .b(b[6]), .cin(inner_couts[5]), .s(s[6]), .cout(inner_couts[6]));
    Full_Adder full_adder7(.a(a[7]), .b(b[7]), .cin(inner_couts[6]), .s(s[7]), .cout(cout));
    
endmodule


module ALU(
    input wire [7:0] select,
    input wire [7:0] IN_1,
    input wire [7:0] IN_2,
    output reg [7:0] OUT,
    output reg carry
);

always @ (IN_1 or IN_2 or select) begin
        case (select)
            8'b00000000 : OUT <= IN_1 + IN_2;
            default: OUT <= 8'b0;
        endcase
end

endmodule
