module key_expand_round(
    input  [127:0] key_in,
    input  [7:0] rcon,
    output [127:0] key_out
);

wire [31:0] w0, w1, w2, w3;
wire [31:0] g;
wire [7:0] s0, s1, s2, s3;

assign w0 = key_in[127:96];
assign w1 = key_in[95:64];
assign w2 = key_in[63:32];
assign w3 = key_in[31:0];

sbox sb0(.in(w3[23:16]), .out(s0));
sbox sb1(.in(w3[15:8]),  .out(s1));
sbox sb2(.in(w3[7:0]),   .out(s2));
sbox sb3(.in(w3[31:24]), .out(s3));

assign g = {s0, s1, s2, s3} ^ {rcon, 24'h000000};

assign key_out[127:96] = w0 ^ g;
assign key_out[95:64]  = w1 ^ key_out[127:96];
assign key_out[63:32]  = w2 ^ key_out[95:64];
assign key_out[31:0]   = w3 ^ key_out[63:32];

endmodule


module aes_key_expand(
    input  [127:0] cipher_key,
    output [127:0] key0,
    output [127:0] key1,
    output [127:0] key2,
    output [127:0] key3,
    output [127:0] key4,
    output [127:0] key5,
    output [127:0] key6,
    output [127:0] key7,
    output [127:0] key8,
    output [127:0] key9,
    output [127:0] key10
);

assign key0 = cipher_key;

key_expand_round r1 (.key_in(key0), .rcon(8'h01), .key_out(key1));
key_expand_round r2 (.key_in(key1), .rcon(8'h02), .key_out(key2));
key_expand_round r3 (.key_in(key2), .rcon(8'h04), .key_out(key3));
key_expand_round r4 (.key_in(key3), .rcon(8'h08), .key_out(key4));
key_expand_round r5 (.key_in(key4), .rcon(8'h10), .key_out(key5));
key_expand_round r6 (.key_in(key5), .rcon(8'h20), .key_out(key6));
key_expand_round r7 (.key_in(key6), .rcon(8'h40), .key_out(key7));
key_expand_round r8 (.key_in(key7), .rcon(8'h80), .key_out(key8));
key_expand_round r9 (.key_in(key8), .rcon(8'h1b), .key_out(key9));
key_expand_round r10(.key_in(key9), .rcon(8'h36), .key_out(key10));

endmodule
