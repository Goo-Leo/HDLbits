// https://hdlbits.01xz.net/wiki/Gatesv
module gatesv(
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );

  assign out_both[2] = in[3] & in[2];
  assign out_both[1] = in[2] & in[1];
  assign out_both[0] = in[1] & in[0];

  assign out_any[3] = in[3] | in[2];
  assign out_any[2] = in[2] | in[1];
  assign out_any[1] = in[1] | in[0];

  assign out_different[3] = in[3] ^ in[0];
  assign out_different[2] = in[3] ^ in[2];
  assign out_different[1] = in[2] ^ in[1];
  assign out_different[0] = in[1] ^ in[0];

endmodule


module top_module(
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );

  assign out_any = in[99:1] | in[98:0];

  assign out_both = in[98:0] & in[99:1];

  assign out_different = in ^ {in[0], in[99:1]};

endmodule
