module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum);//
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
                 .cout());

  assign sum = {hi_16,lo_16};



endmodule

module add1 ( input a, input b, input cin, output sum, output cout );

  always @(*)
  begin
    case ({cin, b, a})
      3'b000:
        {cout, sum} = 2'b00;
      3'b001:
        {cout, sum} = 2'b01;
      3'b010:
        {cout, sum} = 2'b01;
      3'b011:
        {cout, sum} = 2'b10;
      3'b100:
        {cout, sum} = 2'b01;
      3'b101:
        {cout, sum} = 2'b10;
      3'b110:
        {cout, sum} = 2'b10;
      3'b111:
        {cout, sum} = 2'b11;
      default:
        {cout, sum} = 2'bxx;

    endcase
  end

endmodule

