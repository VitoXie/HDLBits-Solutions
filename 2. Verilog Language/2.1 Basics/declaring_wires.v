`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	wire top = a&&b;
    wire bot = c&&d;
    assign out = top||bot;
    assign out_n = !(top||bot);
endmodule
