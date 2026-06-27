module aes_round(
    input  [127:0] state_in,
    input  [127:0] round_key,
    output [127:0] state_out
);

wire [127:0] sub_out;
wire [127:0] shift_out;
wire [127:0] mix_out;

sub_bytes SB(
    .state_in(state_in),
    .state_out(sub_out)
);

shift_rows SR(
    .state_in(sub_out),
    .state_out(shift_out)
);

mix_columns MC(
    .state_in(shift_out),
    .state_out(mix_out)
);

add_round_key ARK(
    .state_in(mix_out),
    .round_key(round_key),
    .state_out(state_out)
);

endmodule