module top_module(
    input [7:0] in,
    output [7:0] out
  );
  assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};
  // 数组赋值必须按照声明的大小端进行
  // assign out = in[0:7] does not work.
endmodule
