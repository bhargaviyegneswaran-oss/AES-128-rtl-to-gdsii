`timescale 1ns/1ps

module aes_top_tb;

reg [127:0] plaintext;
reg [127:0] cipher_key;

wire [127:0] ciphertext;

aes_top uut(

.plaintext(plaintext),
.cipher_key(cipher_key),
.ciphertext(ciphertext)

);

initial begin

plaintext=
128'h00112233445566778899aabbccddeeff;

cipher_key=
128'h000102030405060708090a0b0c0d0e0f;

#10;

$display("AES OUTPUT=%h",ciphertext);

#10;

$finish;

end

endmodule
