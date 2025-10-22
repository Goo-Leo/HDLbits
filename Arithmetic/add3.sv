module add3(
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

  wire [2:0] cout_inner;
  assign cout = cout_inner;
  genvar i;
  generate
    for (i = 0; i < 3; i = i + 1)
    begin: adder_gen_block
      fadder fadder(
               .a(a[i]),
               .b(b[i]),
               .cin(i == 0 ? cin : cout_inner[i-1]),
               .sum(sum[i]),
               .cout(cout_inner[i])
             );
    end
  endgenerate

endmodule
