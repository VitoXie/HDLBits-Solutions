module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    wire cout1;
    wire [15:0]sum0;
    wire [15:0]sum1;
    wire [15:0]sum2;
    wire [15:0]muxsum;
    add16 inst0(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(0),
        .cout(cout1),
        .sum(sum0),
    );
    add16 inst1(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1),
        .cout(cout1),
        .sum(sum1),
    );
    add16 inst2(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .cout(cout),
        .sum(sum2),
    );
    always @(*)begin
    	case (cout)
        	1'b0 : muxsum <= sum0;
        	1'b1 : muxsum <= sum1;
        endcase
    end
    assign sum = ({muxsum,sum2});

endmodule
