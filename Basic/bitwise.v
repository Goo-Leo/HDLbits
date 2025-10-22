module top_module(
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
  );
  // |:按位或
  // ||:逻辑或，输出位宽1bit
  // assign out_or_bitwise[2] = a[2]||b[2];
  // assign out_or_bitwise[1] = a[1]||b[1];
  // assign out_or_bitwise[0] = a[0]||b[0];
  assign out_or_bitwise = a|b;
  assign out_or_logical = a||b;

  // ~:按位取反
  // !:逻辑非，输出位宽1bit
  assign out_not[5:3] = ~a;
  assign out_not[2:0] = ~b;

endmodule
