/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg spi_miso,
    output reg [3:0] spi_channel,
    output reg avr_rx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [3-1:0] M_ctr_value;
  counter_2 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  reg [29:0] M_counter_d, M_counter_q = 1'h0;
  localparam NORMAL_testing = 5'd0;
  localparam ADDER_ADD0_testing = 5'd1;
  localparam ADDER_ADD1_testing = 5'd2;
  localparam ADDER_SUB2_testing = 5'd3;
  localparam ADDER_SUB3_testing = 5'd4;
  localparam ADDER_MUL4_testing = 5'd5;
  localparam ADDER_MOD5_testing = 5'd6;
  localparam ADDER_ERROR6_testing = 5'd7;
  localparam BOOL_AND0_testing = 5'd8;
  localparam BOOL_OR1_testing = 5'd9;
  localparam BOOL_XOR2_testing = 5'd10;
  localparam BOOL_ALDR3_testing = 5'd11;
  localparam BOOL_ERROR4_testing = 5'd12;
  localparam SHIFT_SHL0_testing = 5'd13;
  localparam SHIFT_SHR1_testing = 5'd14;
  localparam SHIFT_SRA2_testing = 5'd15;
  localparam SHIFT_ERROR3_testing = 5'd16;
  localparam COMP_EQ0_testing = 5'd17;
  localparam COMP_EQ1_testing = 5'd18;
  localparam COMP_LT2_testing = 5'd19;
  localparam COMP_LT3_testing = 5'd20;
  localparam COMP_LE4_testing = 5'd21;
  localparam COMP_LE5_testing = 5'd22;
  localparam COMP_ERROR6_testing = 5'd23;
  
  reg [4:0] M_testing_d, M_testing_q = NORMAL_testing;
  
  wire [1-1:0] M_alu_overflow;
  wire [8-1:0] M_alu_aluOUT;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [6-1:0] M_alu_alufn;
  reg [8-1:0] M_alu_a;
  reg [8-1:0] M_alu_b;
  aluLogic_3 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .overflow(M_alu_overflow),
    .aluOUT(M_alu_aluOUT),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  wire [7-1:0] M_num3_segs;
  reg [4-1:0] M_num3_char;
  seven_seg_4 num3 (
    .char(M_num3_char),
    .segs(M_num3_segs)
  );
  
  wire [7-1:0] M_num2_segs;
  reg [4-1:0] M_num2_char;
  seven_seg_4 num2 (
    .char(M_num2_char),
    .segs(M_num2_segs)
  );
  
  wire [7-1:0] M_num1_segs;
  reg [4-1:0] M_num1_char;
  seven_seg_4 num1 (
    .char(M_num1_char),
    .segs(M_num1_segs)
  );
  
  wire [7-1:0] M_num0_segs;
  reg [4-1:0] M_num0_char;
  seven_seg_4 num0 (
    .char(M_num0_char),
    .segs(M_num0_segs)
  );
  
  localparam T = 5'h1d;
  
  always @* begin
    M_testing_d = M_testing_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_num0_char = 4'ha;
    M_num1_char = 4'ha;
    M_num2_char = 4'ha;
    M_num3_char = 4'ha;
    io_led[0+0+7-:8] = io_dip[0+0+7-:8];
    io_led[8+0+7-:8] = io_dip[8+0+7-:8];
    M_alu_b[0+7-:8] = io_dip[0+0+7-:8];
    M_alu_a[0+7-:8] = io_dip[8+0+7-:8];
    M_alu_alufn[0+5-:6] = io_dip[16+0+5-:6];
    io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
    if (M_alu_v == 1'h1) begin
      M_num2_char = 4'hb;
    end
    if (M_alu_overflow == 1'h1) begin
      M_num2_char = 4'hb;
    end
    
    case (M_ctr_value)
      1'h0: begin
        io_seg = ~M_num0_segs;
        io_sel = 4'he;
      end
      1'h1: begin
        io_seg = ~M_num1_segs;
        io_sel = 4'hd;
      end
      2'h2: begin
        io_seg = ~M_num2_segs;
        io_sel = 4'hb;
      end
      2'h3: begin
        io_seg = ~M_num3_segs;
        io_sel = 4'h7;
      end
      default: begin
        io_seg = ~M_num3_segs;
        io_sel = 4'h7;
      end
    endcase
    
    case (M_testing_q)
      NORMAL_testing: begin
        M_counter_d = 1'h0;
        io_led[0+0+7-:8] = io_dip[0+0+7-:8];
        io_led[8+0+7-:8] = io_dip[8+0+7-:8];
        M_alu_b[0+7-:8] = io_dip[0+0+7-:8];
        M_alu_a[0+7-:8] = io_dip[8+0+7-:8];
        M_alu_alufn[0+5-:6] = io_dip[16+0+5-:6];
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        if (io_button[1+0-:1] == 1'h1) begin
          M_testing_d = ADDER_ADD0_testing;
        end
      end
      ADDER_ADD0_testing: begin
        M_alu_alufn = 6'h00;
        M_alu_b = 8'h01;
        M_alu_a = 8'h01;
        io_led[0+0+7-:8] = 8'h01;
        io_led[8+0+7-:8] = 8'h01;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hc;
        M_num0_char = 1'h0;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = ADDER_ADD1_testing;
        end
      end
      ADDER_ADD1_testing: begin
        M_alu_alufn = 6'h00;
        M_alu_b = 8'h40;
        M_alu_a = 8'h41;
        io_led[0+0+7-:8] = 8'h40;
        io_led[8+0+7-:8] = 8'h41;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hc;
        M_num0_char = 1'h1;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = ADDER_SUB2_testing;
        end
      end
      ADDER_SUB2_testing: begin
        M_alu_alufn = 6'h01;
        M_alu_b = 8'h02;
        M_alu_a = 8'h04;
        io_led[0+0+7-:8] = 8'h02;
        io_led[8+0+7-:8] = 8'h04;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hc;
        M_num0_char = 2'h2;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = ADDER_SUB3_testing;
        end
      end
      ADDER_SUB3_testing: begin
        M_alu_alufn = 6'h01;
        M_alu_b = 8'h46;
        M_alu_a = 8'hb6;
        io_led[0+0+7-:8] = 8'h46;
        io_led[8+0+7-:8] = 8'hb6;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hc;
        M_num0_char = 2'h3;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = ADDER_MUL4_testing;
        end
      end
      ADDER_MUL4_testing: begin
        M_alu_alufn = 6'h02;
        M_alu_b = 8'h02;
        M_alu_a = 8'h02;
        io_led[0+0+7-:8] = 8'h02;
        io_led[8+0+7-:8] = 8'h02;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hc;
        M_num0_char = 3'h4;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = ADDER_MOD5_testing;
        end
      end
      ADDER_MOD5_testing: begin
        M_alu_alufn = 6'h03;
        M_alu_b = 8'h04;
        M_alu_a = 8'h02;
        io_led[0+0+7-:8] = 8'h04;
        io_led[8+0+7-:8] = 8'h02;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hc;
        M_num0_char = 3'h5;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = ADDER_ERROR6_testing;
        end
      end
      ADDER_ERROR6_testing: begin
        M_alu_alufn = 6'h00;
        M_alu_b = 8'h04;
        M_alu_a = 8'h02;
        io_led[0+0+7-:8] = 8'h04;
        io_led[8+0+7-:8] = 8'h02;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8] + 1'h1;
        M_num3_char = 4'hc;
        if (M_alu_aluOUT[0+7-:8] != 8'h05) begin
          M_num2_char = 4'he;
        end
        M_num0_char = 3'h6;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = BOOL_AND0_testing;
        end
      end
      BOOL_AND0_testing: begin
        M_alu_alufn = 6'h18;
        M_alu_b = 8'h03;
        M_alu_a = 8'h05;
        io_led[0+0+7-:8] = 8'h03;
        io_led[8+0+7-:8] = 8'h05;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'h8;
        M_num0_char = 1'h0;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = BOOL_OR1_testing;
        end
      end
      BOOL_OR1_testing: begin
        M_alu_alufn = 6'h1e;
        M_alu_b = 8'h03;
        M_alu_a = 8'h05;
        io_led[0+0+7-:8] = 8'h03;
        io_led[8+0+7-:8] = 8'h05;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'h8;
        M_num0_char = 1'h1;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = BOOL_XOR2_testing;
        end
      end
      BOOL_XOR2_testing: begin
        M_alu_alufn = 6'h16;
        M_alu_b = 8'h03;
        M_alu_a = 8'h05;
        io_led[0+0+7-:8] = 8'h03;
        io_led[8+0+7-:8] = 8'h05;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'h8;
        M_num0_char = 2'h2;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = BOOL_ALDR3_testing;
        end
      end
      BOOL_ALDR3_testing: begin
        M_alu_alufn = 6'h1a;
        M_alu_b = 8'h03;
        M_alu_a = 8'h05;
        io_led[0+0+7-:8] = 8'h03;
        io_led[8+0+7-:8] = 8'h05;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'h8;
        M_num0_char = 2'h3;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = BOOL_ERROR4_testing;
        end
      end
      BOOL_ERROR4_testing: begin
        M_alu_alufn = 6'h18;
        M_alu_b = 8'h03;
        M_alu_a = 8'h05;
        io_led[0+0+7-:8] = 8'h03;
        io_led[8+0+7-:8] = 8'h05;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8] + 1'h1;
        M_num3_char = 4'h8;
        if (M_alu_aluOUT[0+7-:8] != 1'h1) begin
          M_num2_char = 4'he;
        end
        M_num0_char = 3'h4;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = SHIFT_SHL0_testing;
        end
      end
      SHIFT_SHL0_testing: begin
        M_alu_alufn = 6'h20;
        M_alu_b = 8'h04;
        M_alu_a = 8'h01;
        io_led[0+0+7-:8] = 8'h04;
        io_led[8+0+7-:8] = 8'h01;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 3'h5;
        M_num0_char = 1'h0;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = SHIFT_SHR1_testing;
        end
      end
      SHIFT_SHR1_testing: begin
        M_alu_alufn = 6'h21;
        M_alu_b = 8'h04;
        M_alu_a = 8'h40;
        io_led[0+0+7-:8] = 8'h04;
        io_led[8+0+7-:8] = 8'h40;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 3'h5;
        M_num0_char = 1'h1;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = SHIFT_SRA2_testing;
        end
      end
      SHIFT_SRA2_testing: begin
        M_alu_alufn = 6'h23;
        M_alu_b = 8'h04;
        M_alu_a = 8'hc0;
        io_led[0+0+7-:8] = 8'h04;
        io_led[8+0+7-:8] = 8'hc0;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 3'h5;
        M_num0_char = 2'h2;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = SHIFT_ERROR3_testing;
        end
      end
      SHIFT_ERROR3_testing: begin
        M_alu_alufn = 6'h20;
        M_alu_b = 8'h01;
        M_alu_a = 8'h04;
        io_led[0+0+7-:8] = 8'h01;
        io_led[8+0+7-:8] = 8'h04;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8] + 1'h1;
        M_num3_char = 3'h5;
        M_num2_char = 4'he;
        M_num0_char = 2'h3;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = COMP_EQ0_testing;
        end
      end
      COMP_EQ0_testing: begin
        M_alu_alufn = 6'h33;
        M_alu_b = 8'h01;
        M_alu_a = 8'h01;
        io_led[0+0+7-:8] = 8'h01;
        io_led[8+0+7-:8] = 8'h01;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hd;
        M_num0_char = 1'h0;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = COMP_EQ1_testing;
        end
      end
      COMP_EQ1_testing: begin
        M_alu_alufn = 6'h33;
        M_alu_b = 8'h02;
        M_alu_a = 8'h01;
        io_led[0+0+7-:8] = 8'h02;
        io_led[8+0+7-:8] = 8'h01;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hd;
        M_num0_char = 1'h1;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = COMP_LT2_testing;
        end
      end
      COMP_LT2_testing: begin
        M_alu_alufn = 6'h35;
        M_alu_b = 8'h02;
        M_alu_a = 8'h01;
        io_led[0+0+7-:8] = 8'h02;
        io_led[8+0+7-:8] = 8'h01;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hd;
        M_num0_char = 2'h2;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = COMP_LT3_testing;
        end
      end
      COMP_LT3_testing: begin
        M_alu_alufn = 6'h35;
        M_alu_b = 8'h02;
        M_alu_a = 8'h03;
        io_led[0+0+7-:8] = 8'h02;
        io_led[8+0+7-:8] = 8'h03;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hd;
        M_num0_char = 2'h3;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = COMP_LE4_testing;
        end
      end
      COMP_LE4_testing: begin
        M_alu_alufn = 6'h37;
        M_alu_b = 8'h02;
        M_alu_a = 8'h02;
        io_led[0+0+7-:8] = 8'h02;
        io_led[8+0+7-:8] = 8'h02;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hd;
        M_num0_char = 3'h4;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = COMP_LE5_testing;
        end
      end
      COMP_LE5_testing: begin
        M_alu_alufn = 6'h37;
        M_alu_b = 8'h02;
        M_alu_a = 8'h03;
        io_led[0+0+7-:8] = 8'h02;
        io_led[8+0+7-:8] = 8'h03;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8];
        M_num3_char = 4'hd;
        M_num0_char = 3'h5;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = COMP_ERROR6_testing;
        end
      end
      COMP_ERROR6_testing: begin
        M_alu_alufn = 6'h33;
        M_alu_b = 8'h02;
        M_alu_a = 8'h02;
        io_led[0+0+7-:8] = 8'h02;
        io_led[8+0+7-:8] = 8'h02;
        io_led[16+0+7-:8] = M_alu_aluOUT[0+7-:8] - 1'h1;
        M_num3_char = 4'hd;
        M_num2_char = 4'he;
        M_num0_char = 3'h6;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1) begin
          M_counter_d = 1'h0;
          M_testing_d = NORMAL_testing;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_testing_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_testing_q <= M_testing_d;
    end
  end
  
endmodule
