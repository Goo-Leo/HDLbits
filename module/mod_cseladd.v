//https://hdlbits.01xz.net/wiki/Module_cseladd

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
  );

  wire cs_signal;
  wire [15:0] hi_0, hi_1, low;
  add16 lo_16(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(low), .cout(cs_signal));
  add16 hi_16_0(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(hi_0), .cout());
  add16 hi_16_1(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(hi_1), .cout());
  always @(*)
  begin
    case (cs_signal)
      1'b0:
        sum = {hi_0, low};
      1'b1:
        sum = {hi_1, low};
      default:
        sum = 32'hxx;
    endcase
  end
endmodule
