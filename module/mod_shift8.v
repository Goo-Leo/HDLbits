//https://hdlbits.01xz.net/wiki/Module_shift8

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
wire[7:0] inner_q1, inner_q2, inner_q3;

my_dff8 dff1(.clk(clk),.d(d),.q(inner_q1));
my_dff8 dff2(.clk(clk),.d(inner_q1),.q(inner_q2));
my_dff8 dff3(.clk(clk),.d(inner_q2),.q(inner_q3));

always @(*) begin
    case (sel)
    2'b_00:  q = d;
    2'b_01:  q = inner_q1;
    2'b_10:  q = inner_q2;
    2'b_11:  q = inner_q3;
    endcase
    
end

endmodule