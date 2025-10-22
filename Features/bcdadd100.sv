module bcd_fadd (
    input  [3:0] a   ,
    input  [3:0] b   ,
    input        cin ,
    output       cout,
    output [3:0] sum
  );

endmodule


module top_module (
    input  [399:0] a, b,
    input          cin ,
    output         cout,
    output [399:0] sum
  );

  wire [99:0] cout_inner;
  assign cout = cout_inner[99];

  genvar j;
  generate
    for (j = 0; j < 100; j = j + 1)
    begin: bcd_gen_block
      localparam FIRST_BIT = j * 4    ;
      localparam LAST_BIT  = j * 4 + 3;
      bcd_fadd bcd_instance (
                 .a   (a[LAST_BIT : FIRST_BIT]       ),
                 .b   (b[LAST_BIT : FIRST_BIT]       ),
                 .cin (j == 0 ? cin : cout_inner[j-1]),
                 .sum (sum[LAST_BIT : FIRST_BIT]     ),
                 .cout(cout_inner[j]                 )
               );
    end
  endgenerate
endmodule
