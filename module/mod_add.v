module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
  );

  wire [15:0] lo_16;
  wire [15:0] hi_16;
  wire carry_in;
  add16 add_low(.a(a[15:0]),
                .b(b[15:0]),
                .cin(1'b0),
                .sum(lo_16),
                .cout(carry_in));

  add16 add_high(.a(a[31:16]),
                 .b(b[31:16]),
                 .cin(carry_in),
                 .sum(hi_16),
                 .cout(),);

  assign sum = {hi_16,lo_16};

endmodule
