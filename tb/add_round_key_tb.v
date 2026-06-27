`timescale 1ns/1ps

module add_round_key_tb;

reg [127:0] state_in;
reg [127:0] round_key;

wire [127:0] state_out;

add_round_key uut(

.state_in(state_in),
.round_key(round_key),
.state_out(state_out)

);

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,add_round_key_tb);

state_in=
128'h00112233445566778899aabbccddeeff;

round_key=
128'h000102030405060708090a0b0c0d0e0f;

#10;

$display("OUTPUT=%h",state_out);

#10;

$finish;

end

endmodule