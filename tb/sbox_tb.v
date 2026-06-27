`timescale 1ns/1ps

module sbox_tb;

reg [7:0] in;
wire [7:0] out;

sbox uut(
    .in(in),
    .out(out)
);

initial begin

in = 8'h00;
#10;
$display("in=%h out=%h", in, out);

in = 8'h01;
#10;
$display("in=%h out=%h", in, out);

in = 8'h53;
#10;
$display("in=%h out=%h", in, out);

#10;
$finish;

end

endmodule