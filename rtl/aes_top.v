module aes_top(
    input  [127:0] plaintext,
    input  [127:0] cipher_key,
    output [127:0] ciphertext
);

wire [127:0] key0;
wire [127:0] key1;
wire [127:0] key2;
wire [127:0] key3;
wire [127:0] key4;
wire [127:0] key5;
wire [127:0] key6;
wire [127:0] key7;
wire [127:0] key8;
wire [127:0] key9;
wire [127:0] key10;

wire [127:0] initial_state;
wire [127:0] r1;
wire [127:0] r2;
wire [127:0] r3;
wire [127:0] r4;
wire [127:0] r5;
wire [127:0] r6;
wire [127:0] r7;
wire [127:0] r8;
wire [127:0] r9;

aes_key_expand KE(
    .cipher_key(cipher_key),
    .key0(key0),
    .key1(key1),
    .key2(key2),
    .key3(key3),
    .key4(key4),
    .key5(key5),
    .key6(key6),
    .key7(key7),
    .key8(key8),
    .key9(key9),
    .key10(key10)
);

add_round_key initial_ark(
    .state_in(plaintext),
    .round_key(key0),
    .state_out(initial_state)
);

aes_round round1(
    .state_in(initial_state),
    .round_key(key1),
    .state_out(r1)
);

aes_round round2(
    .state_in(r1),
    .round_key(key2),
    .state_out(r2)
);

aes_round round3(
    .state_in(r2),
    .round_key(key3),
    .state_out(r3)
);

aes_round round4(
    .state_in(r3),
    .round_key(key4),
    .state_out(r4)
);

aes_round round5(
    .state_in(r4),
    .round_key(key5),
    .state_out(r5)
);

aes_round round6(
    .state_in(r5),
    .round_key(key6),
    .state_out(r6)
);

aes_round round7(
    .state_in(r6),
    .round_key(key7),
    .state_out(r7)
);

aes_round round8(
    .state_in(r7),
    .round_key(key8),
    .state_out(r8)
);

aes_round round9(
    .state_in(r8),
    .round_key(key9),
    .state_out(r9)
);

aes_final_round round10(
    .state_in(r9),
    .round_key(key10),
    .state_out(ciphertext)
);

endmodule
