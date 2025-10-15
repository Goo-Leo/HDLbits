// https://hdlbits.01xz.net/wiki/Module_addsub
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
  );

  wire sub_sgnl;
  wire [31:0] op_num;
  wire [15:0] lo_16, hi_16;

  assign op_num = {32{sub}}^b;

  add16 add_low(.a(a[15:0]),
                .b(op_num[15:0]),
                .cin(sub),
                .sum(lo_16),
                .cout(sub_sgnl));

  add16 add_high(.a(a[31:16]),
                 .b(op_num[31:16]),
                 .cin(sub_sgnl),
                 .sum(hi_16),
                 .cout());

  assign sum = {hi_16, lo_16};

endmodule
