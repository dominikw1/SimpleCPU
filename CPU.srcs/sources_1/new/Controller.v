`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 20:08:04
// Design Name: 
// Module Name: Controller
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


module Controller(
        input wire [31:0] instruction,
        output reg [7:0] alu_select,
        output reg write_enable,
        output reg [31:0] immediate,
        output reg [7:0] reg_1,
        output reg [7:0] reg_2,
        output reg [7:0] reg_3
    );

wire [6:0] opcode;
assign opcode = instruction[6:0];

wire [4:0] type_r_rs1;
wire [4:0] type_r_rs2;
wire [4:0] type_r_rd;
assign type_r_rs1  = instruction[19:15];
assign type_r_rs2  = instruction[24:20];
assign type_r_rd  = instruction[11:7];

always @ (instruction) begin
    write_enable <= 0;
    alu_select <= 8'b0;
    immediate <= 32'b0;
    reg_1 <= 8'b0;
    reg_2 <= 8'b0;
    reg_3 <= 8'b0;

    case (opcode)
    7'b0110011: begin // add 
        write_enable <= 1;
        reg_1 <= type_r_rs1;
        reg_2 <= type_r_rs2;
        reg_3 <= type_r_rd;
        alu_select <= 8'b00000000;
    end
    endcase
end 
endmodule
