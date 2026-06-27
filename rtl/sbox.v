module sbox(
input [7:0] in,
output [7:0] out
);

reg [7:0] sbox_table [0:255];

initial begin
$readmemh("rtl/sbox.mem",sbox_table);
end

assign out=sbox_table[in];

endmodule