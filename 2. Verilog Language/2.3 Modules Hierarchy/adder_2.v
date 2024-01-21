module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
	wire [15:0]lowersum,uppersum;
    wire cout1;
	add16 inst1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .cout(cout1),
        .sum(lowersum)
        
    );
	add16 inst2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout1),
        .sum(uppersum)
    );
    always @(*)begin
        sum = ({uppersum,lowersum});
    end
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
	assign sum = a^b^cin;
	assign cout = a&b | a&cin | b&cin;
// Full adder module here
endmodule

