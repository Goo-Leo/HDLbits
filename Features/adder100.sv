module full_adder (
	input  a   ,
	input  b   ,
	input  cin ,
	output sum ,
	output cout
);
	assign sum  = a ^ b ^ cin;
	assign cout = (a & b) | (a & cin) | (b & cin);
endmodule


module top_module (
	input  [99:0] a, b,
	input         cin ,
	output [99:0] cout,
	output [99:0] sum
);

	wire [99:0] cout_inner;
	assign cout = cout_inner;
	genvar i;
	generate
		for (i = 0; i < 100; i = i + 1)
			begin: adder_gen_block
				full_adder adder_100(
					.a(a[i]),
					.b(b[i]),
					.cin(i == 0 ? cin : cout_inner[i-1]),
					.sum(sum[i]),
					.cout(cout_inner[i])
				);
			end
	endgenerate

endmodule
