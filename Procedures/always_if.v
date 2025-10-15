// https://hdlbits.01xz.net/wiki/Always_if
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   );
  assign out_assign = (sel_b1 & sel_b2)? b: a;
  always @(*)
  begin
    if(sel_b1 & sel_b2)
      out_always <= b;
    else
    begin
      out_always <= a;
    end
  end

endmodule


// https://hdlbits.01xz.net/wiki/Always_if2
// Avoid Latches in branches:
//
// case (param)            if (condition) begin
//     :                       pass
//     default:            end else begin
// endcase                     pass
//                         end

module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

  //   reg computer_stat;
  always @(*)
  begin
    if (cpu_overheated)
      shut_off_computer = 1;
    else
    begin
      shut_off_computer = 0;
    end
  end

  always @(*)
  begin
    if (~arrived)
      keep_driving = ~gas_tank_empty;
    else
    begin
      keep_driving = 0;
    end
  end

endmodule
