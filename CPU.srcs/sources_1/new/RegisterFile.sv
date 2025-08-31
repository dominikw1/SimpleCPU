module Register (
    input wire clk,
    input wire[31:0] data_in,
    input wire write_enable,
    output wire[31:0] data_out
);

reg [31:0] internal_data;

assign data_out = internal_data;

always @ (posedge clk)
begin
    if(write_enable)
        internal_data <= data_in;
end


initial begin 
    internal_data <= 32'b01;
end

endmodule


module RegisterFile16 (
    input wire clk,
    
    input wire[7:0] index_1,
    input wire[7:0] index_2,
    input wire[7:0] index_3,
    input wire write_enable,
    input wire[31:0] in_data,
    
    output wire [31:0] read_1,
    output wire [31:0] read_2
);


wire [15:0] write_enables;
wire [15:0][31:0] register_outputs;
assign write_enables = write_enable ? (1'b1 << index_3) : 16'b0;

genvar i;
generate
    // Instantiate 16 registers using a generate for loop
    for (i = 0; i < 16; i = i + 1) begin : reg_gen
        Register register_instance (
            .clk(clk),
            .data_in(in_data),
            .write_enable(write_enables[i]),
            .data_out(register_outputs[i])
        );
    end
endgenerate

assign read_1 = register_outputs[index_1];
assign read_2 = register_outputs[index_2];


endmodule

