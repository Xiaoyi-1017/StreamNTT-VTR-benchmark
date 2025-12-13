/*
 * WDSFPGA Benchmark Template - Sample Verilog File
 *
 * This is a sample top-level Verilog module for the WDSFPGA benchmark template.
 * It instantiates the diffeq module (copied from the VTR repository) as an example
 * benchmark design. Replace this with your own Verilog designs when using the template.
 */

module top(
    input clk,
    input reset,
    input [31:0] aport,
    input [31:0] dxport,
    output [31:0] sum_out
);

wire [31:0] xport, yport, uport;

diffeq_f_systemC inst(
    .aport(aport),
    .dxport(dxport),
    .xport(xport),
    .yport(yport),
    .uport(uport),
    .clk(clk),
    .reset(reset)
);

assign sum_out = xport + yport + uport;

endmodule