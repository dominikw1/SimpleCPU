`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 19:54:25
// Design Name: 
// Module Name: CPU
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


module CPU(
    input wire clk
    );

wire [7:0] reg_index1;
wire [7:0] reg_index2;
wire [7:0] reg_index3;
wire reg_write_enable;
wire [31:0] reg_write_data;
wire [31:0] reg_out_data1;
wire [31:0] reg_out_data2;

RegisterFile16 registerFile(clk, reg_index1, reg_index2, reg_index3, reg_write_enable, reg_write_data, reg_out_data1, reg_out_data2);

wire [7:0] alu_select;
wire [31:0] alu_output;
wire alu_carry;

ALU alu(alu_select, reg_out_data1, reg_out_data2, alu_output, alu_carry);

endmodule
