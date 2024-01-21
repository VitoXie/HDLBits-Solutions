module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
    wire [31:0]all = {a,b,c,d,e,f,2'b11};
    assign w = all[31:24];
    assign x = all[23:16];
    assign y = all[15:8];
    assign z = all[7:0];
endmodule
