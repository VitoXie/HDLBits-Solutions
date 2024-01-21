module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout1,cout2;
    wire [15:0]lowersum,uppersum;
    wire [31:0]realb;
    add16 inst1(
        .a(a[15:0]),
        .b(realb[15:0]),
        .cin(sub),
        .cout(cout1),
        .sum(lowersum),
    );
    add16 inst2(
        .a(a[31:16]),
        .b(realb[31:16]),
        .cin(cout1),
        .cout(cout2),
        .sum(uppersum),
    );
    always @(*)begin
        case(sub)
            1'b0 : realb <= b;
            1'b1 : realb <= ~b;
        endcase
        sum = ({uppersum,lowersum});
    end
endmodule
