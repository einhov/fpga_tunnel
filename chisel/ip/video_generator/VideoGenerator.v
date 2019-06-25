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

module VideoGenerator(
  input         clock,
  input         reset,
  output [23:0] io_colour,
  output        io_hsync,
  output        io_vsync,
  output        io_vde,
  output [17:0] io_distance_addr,
  input  [7:0]  io_distance_data,
  output [17:0] io_angle_addr,
  input  [7:0]  io_angle_data,
  output [15:0] io_texture_addr,
  input  [5:0]  io_texture_data,
  input  [1:0]  io_switch,
  input         io_button
);
  reg [10:0] value;
  reg [31:0] _RAND_0;
  reg [9:0] value_1;
  reg [31:0] _RAND_1;
  reg [15:0] value_2;
  reg [31:0] _RAND_2;
  wire  _T_21;
  wire [11:0] _T_23;
  wire [10:0] _T_24;
  wire [10:0] _GEN_0;
  wire  _T_27;
  wire [10:0] _T_29;
  wire [9:0] _T_30;
  wire [9:0] _GEN_1;
  wire  _T_33;
  wire [16:0] _T_35;
  wire [15:0] _T_36;
  wire [15:0] _GEN_2;
  wire [15:0] _GEN_3;
  wire [9:0] _GEN_4;
  wire [15:0] _GEN_5;
  wire  _T_39;
  wire  _T_41;
  wire  _T_42;
  wire  _T_43;
  wire  _T_45;
  wire  _T_47;
  wire  _T_48;
  wire  _T_49;
  wire  _T_51;
  wire  _T_53;
  wire  _T_54;
  wire [10:0] _T_56;
  wire [9:0] _T_58;
  wire [19:0] _T_60;
  wire [19:0] _GEN_6;
  wire [20:0] _T_61;
  wire [19:0] scaled_addr;
  wire [15:0] _GEN_7;
  wire [16:0] _T_62;
  wire [15:0] _T_63;
  wire [15:0] _GEN_16;
  wire [8:0] mapped_x;
  wire [15:0] _T_66;
  wire [15:0] _GEN_8;
  wire [16:0] _T_67;
  wire [15:0] _T_68;
  wire [15:0] _GEN_17;
  wire [8:0] mapped_y;
  wire  _T_71;
  wire [10:0] _GEN_18;
  wire [8:0] _T_73;
  wire [9:0] _GEN_19;
  wire [8:0] _T_75;
  wire [17:0] _T_77;
  wire [17:0] _GEN_9;
  wire [18:0] _T_78;
  wire [17:0] _T_79;
  wire [17:0] _T_81;
  wire [17:0] _GEN_10;
  wire [18:0] _T_82;
  wire [17:0] _T_83;
  wire [17:0] _T_84;
  wire [7:0] sample;
  wire [15:0] _GEN_11;
  wire [16:0] _T_86;
  wire [15:0] _T_87;
  wire [15:0] _GEN_20;
  wire [8:0] _T_89;
  wire [17:0] _T_91;
  wire [17:0] _GEN_12;
  wire [18:0] _T_92;
  wire [17:0] _T_93;
  wire [17:0] _GEN_21;
  wire [8:0] _T_95;
  wire [8:0] xor_intensity;
  wire  _T_100;
  wire  _T_102;
  wire  _T_103;
  wire [7:0] _T_104;
  wire [8:0] _T_107;
  wire [8:0] _T_108;
  wire  _T_109;
  wire [8:0] _T_110;
  wire  _T_111;
  wire [8:0] _T_112;
  wire  _T_113;
  wire [8:0] _T_114;
  wire  _T_115;
  wire [8:0] intensity;
  wire [24:0] _GEN_13;
  wire [24:0] _T_116;
  wire [16:0] _GEN_14;
  wire [16:0] _T_117;
  wire [24:0] _GEN_15;
  wire [24:0] _T_118;
  wire [24:0] _T_119;
  assign _T_21 = value == 11'h671;
  assign _T_23 = value + 11'h1;
  assign _T_24 = _T_23[10:0];
  assign _GEN_0 = _T_21 ? 11'h0 : _T_24;
  assign _T_27 = value_1 == 10'h2ed;
  assign _T_29 = value_1 + 10'h1;
  assign _T_30 = _T_29[9:0];
  assign _GEN_1 = _T_27 ? 10'h0 : _T_30;
  assign _T_33 = value_2 == 16'hfffe;
  assign _T_35 = value_2 + 16'h1;
  assign _T_36 = _T_35[15:0];
  assign _GEN_2 = _T_33 ? 16'h0 : _T_36;
  assign _GEN_3 = _T_27 ? _GEN_2 : value_2;
  assign _GEN_4 = _T_21 ? _GEN_1 : value_1;
  assign _GEN_5 = _T_21 ? _GEN_3 : value_2;
  assign _T_39 = value >= 11'h56e;
  assign _T_41 = value < 11'h596;
  assign _T_42 = _T_39 & _T_41;
  assign _T_43 = ~ _T_42;
  assign _T_45 = value_1 >= 10'h2d5;
  assign _T_47 = value_1 < 10'h2da;
  assign _T_48 = _T_45 & _T_47;
  assign _T_49 = ~ _T_48;
  assign _T_51 = value < 11'h500;
  assign _T_53 = value_1 < 10'h2d0;
  assign _T_54 = _T_51 & _T_53;
  assign _T_56 = value >> 1'h1;
  assign _T_58 = value_1 >> 1'h1;
  assign _T_60 = _T_58 * 10'h280;
  assign _GEN_6 = {{9'd0}, _T_56};
  assign _T_61 = _GEN_6 + _T_60;
  assign scaled_addr = _T_61[19:0];
  assign _GEN_7 = {{8'd0}, io_distance_data};
  assign _T_62 = _GEN_7 + value_2;
  assign _T_63 = _T_62[15:0];
  assign _GEN_16 = _T_63 % 16'h100;
  assign mapped_x = _GEN_16[8:0];
  assign _T_66 = value_2 >> 1'h1;
  assign _GEN_8 = {{8'd0}, io_angle_data};
  assign _T_67 = _GEN_8 + _T_66;
  assign _T_68 = _T_67[15:0];
  assign _GEN_17 = _T_68 % 16'h100;
  assign mapped_y = _GEN_17[8:0];
  assign _T_71 = io_switch == 2'h1;
  assign _GEN_18 = value % 11'h100;
  assign _T_73 = _GEN_18[8:0];
  assign _GEN_19 = value_1 % 10'h100;
  assign _T_75 = _GEN_19[8:0];
  assign _T_77 = _T_75 * 9'h100;
  assign _GEN_9 = {{9'd0}, _T_73};
  assign _T_78 = _GEN_9 + _T_77;
  assign _T_79 = _T_78[17:0];
  assign _T_81 = mapped_y * 9'h100;
  assign _GEN_10 = {{9'd0}, mapped_x};
  assign _T_82 = _T_81 + _GEN_10;
  assign _T_83 = _T_82[17:0];
  assign _T_84 = _T_71 ? _T_79 : _T_83;
  assign sample = {io_texture_data,2'h0};
  assign _GEN_11 = {{5'd0}, value};
  assign _T_86 = _GEN_11 + value_2;
  assign _T_87 = _T_86[15:0];
  assign _GEN_20 = _T_87 % 16'h100;
  assign _T_89 = _GEN_20[8:0];
  assign _T_91 = 16'h2 * value_2;
  assign _GEN_12 = {{8'd0}, value_1};
  assign _T_92 = _GEN_12 + _T_91;
  assign _T_93 = _T_92[17:0];
  assign _GEN_21 = _T_93 % 18'h100;
  assign _T_95 = _GEN_21[8:0];
  assign xor_intensity = _T_89 ^ _T_95;
  assign _T_100 = value < 11'h100;
  assign _T_102 = value_1 < 10'h100;
  assign _T_103 = _T_100 & _T_102;
  assign _T_104 = _T_103 ? sample : io_angle_data;
  assign _T_107 = mapped_x ^ mapped_y;
  assign _T_108 = io_button ? _T_107 : {{1'd0}, sample};
  assign _T_109 = 2'h3 == io_switch;
  assign _T_110 = _T_109 ? _T_108 : 9'h0;
  assign _T_111 = 2'h2 == io_switch;
  assign _T_112 = _T_111 ? {{1'd0}, io_distance_data} : _T_110;
  assign _T_113 = 2'h1 == io_switch;
  assign _T_114 = _T_113 ? {{1'd0}, _T_104} : _T_112;
  assign _T_115 = 2'h0 == io_switch;
  assign intensity = _T_115 ? xor_intensity : _T_114;
  assign _GEN_13 = {{16'd0}, intensity};
  assign _T_116 = _GEN_13 << 16;
  assign _GEN_14 = {{8'd0}, intensity};
  assign _T_117 = _GEN_14 << 8;
  assign _GEN_15 = {{8'd0}, _T_117};
  assign _T_118 = _T_116 | _GEN_15;
  assign _T_119 = _T_118 | _GEN_13;
  assign io_colour = _T_119[23:0];
  assign io_hsync = _T_43;
  assign io_vsync = _T_49;
  assign io_vde = _T_54;
  assign io_distance_addr = scaled_addr[17:0];
  assign io_angle_addr = scaled_addr[17:0];
  assign io_texture_addr = _T_84[15:0];
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  value = _RAND_0[10:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  value_1 = _RAND_1[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  value_2 = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 11'h0;
    end else begin
      if (_T_21) begin
        value <= 11'h0;
      end else begin
        value <= _T_24;
      end
    end
    if (reset) begin
      value_1 <= 10'h0;
    end else begin
      if (_T_21) begin
        if (_T_27) begin
          value_1 <= 10'h0;
        end else begin
          value_1 <= _T_30;
        end
      end
    end
    if (reset) begin
      value_2 <= 16'h0;
    end else begin
      if (_T_21) begin
        if (_T_27) begin
          if (_T_33) begin
            value_2 <= 16'h0;
          end else begin
            value_2 <= _T_36;
          end
        end
      end
    end
  end
endmodule
