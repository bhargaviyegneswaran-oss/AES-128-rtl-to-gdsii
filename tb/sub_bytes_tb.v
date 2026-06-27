`timescale 1ns/1ps

module sub_bytes_tb;

reg [127:0] state_in;

wire [127:0] state_out;

sub_bytes uut(

.state_in(state_in),

.state_out(state_out)

);

initial begin

state_in=
128'h53535353535353535353535353535353;

#10;

$display("OUTPUT=%h",state_out);

#10;

$finish;

end

endmodule