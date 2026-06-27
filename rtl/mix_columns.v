module mix_columns(
    input  [127:0] state_in,
    output [127:0] state_out
);

function [7:0] xtime;
    input [7:0] b;
    begin
        xtime = (b[7] == 1'b1) ? ((b << 1) ^ 8'h1b) : (b << 1);
    end
endfunction

function [7:0] mul2;
    input [7:0] b;
    begin
        mul2 = xtime(b);
    end
endfunction

function [7:0] mul3;
    input [7:0] b;
    begin
        mul3 = xtime(b) ^ b;
    end
endfunction

function [31:0] mix_single_column;
    input [31:0] col;
    reg [7:0] s0, s1, s2, s3;
    reg [7:0] r0, r1, r2, r3;
    begin
        s0 = col[31:24];
        s1 = col[23:16];
        s2 = col[15:8];
        s3 = col[7:0];

        r0 = mul2(s0) ^ mul3(s1) ^ s2 ^ s3;
        r1 = s0 ^ mul2(s1) ^ mul3(s2) ^ s3;
        r2 = s0 ^ s1 ^ mul2(s2) ^ mul3(s3);
        r3 = mul3(s0) ^ s1 ^ s2 ^ mul2(s3);

        mix_single_column = {r0, r1, r2, r3};
    end
endfunction

assign state_out = {
    mix_single_column(state_in[127:96]),
    mix_single_column(state_in[95:64]),
    mix_single_column(state_in[63:32]),
    mix_single_column(state_in[31:0])
};

endmodule