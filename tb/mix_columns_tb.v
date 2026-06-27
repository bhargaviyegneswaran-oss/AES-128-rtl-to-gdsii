`timescale 1ns/1ps

module mix_columns_tb;

reg [127:0] state_in;
wire [127:0] state_out;

mix_columns uut(
    .state_in(state_in),
    .state_out(state_out)
);

initial begin

state_in = 128'hd4bf5d30e0b452aeb84111f11e2798e5;

#10;

$display("OUTPUT=%h", state_out);

#10;

$finish;

end

endmodule