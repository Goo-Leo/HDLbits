// https://hdlbits.01xz.net/wiki/Always_case
module top_module (
    input [2:0] sel,
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

  always@(*)
  begin  // This is a combinational circuit
    case(sel)
      3'b000:
        out = data0;
      3'b001:
        out = data1;
      3'b010:
        out = data2;
      3'b011:
        out = data3;
      3'b100:
        out = data4;
      3'b101:
        out = data5;
      default:
        out = 4'b0000;
    endcase
  end

endmodule


// https://hdlbits.01xz.net/wiki/Always_case2
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
  always @(*)
  begin
    casez (in)
      4'b1000 :
        pos = 2'd3;
      4'b?100 :
        pos = 2'd2;
      4'b??10 :
        pos = 2'd1;
      4'b???1 :
        pos = 2'd0;
      default:
        pos = 0;
    endcase
  end
endmodule
