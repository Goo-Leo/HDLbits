// https://hdlbits.01xz.net/wiki/Conditional
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

  assign min = (a<b ? a:b) < (c<d ? c:d) ? (a<b ? a:b):(c<d ? c:d);
  //   function automatic logic [WIDTH-1:0] min2 (input logic [WIDTH-1:0] x, y);
  //     if (x < y)
  //       return x;
  //     else
  //       return y;
  //   endfunction

  //   assign min = min2.( min2(a, b), min2(c, d) );

endmodule
