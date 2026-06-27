`timescale 1ns/1ps

module shift_rows_tb;

reg [127:0] state_in;

wire [127:0] state_out;

shift_rows uut(

.state_in(state_in),

.state_out(state_out)

);

initial begin

state_in=
128'h00112233445566778899aabbccddeeff;

#10;

$display("OUTPUT=%h",state_out);

#10;

$finish;

end

endmodule