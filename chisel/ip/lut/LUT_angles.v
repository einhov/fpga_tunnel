module LUT_angles(
  input clock,
  input [17:0] addr,
  output [7:0] data
);

reg [7:0] mem[640 * 360 - 1:0];
reg [7:0] output_reg;

initial begin
	$readmemh("angles.bin", mem);
end

assign data = output_reg;

always @(posedge clock) begin
	output_reg <= mem[addr];
end

endmodule
