// 两个int8的符号整数加法，1为+。0为-，同符号相加值溢出会改变符号位。
// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q1c
module sgn_add (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
  ); //

  assign s = {a+b};
  wire a_msb = a[7];
  wire b_msb = b[7];
  wire s_msb = s[7];
  // 后7位正数相加溢出：msb从1变0，负数相反
  wire pos_overflow = !a_msb && !b_msb && s_msb;
  wire neg_overflow = a_msb && b_msb && !s_msb;
  assign overflow = pos_overflow || neg_overflow;

endmodule
