module LUT_texture(
  input clock,
  input [15:0] addr,
  output [5:0] data
);

reg [5:0] mem[256 * 256 - 1:0];
reg [5:0] output_reg;

initial begin
	$readmemh("doge2-ds.bin", mem);
end

assign data = output_reg;

always @(posedge clock) begin
	output_reg <= mem[addr];
end

endmodule
