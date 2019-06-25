`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif

module Not(
  input   clock,
  input   reset,
  input   io_in,
  output  io_out
);
  wire  _T_4;
  assign _T_4 = ~ io_in;
  assign io_out = _T_4;
endmodule
