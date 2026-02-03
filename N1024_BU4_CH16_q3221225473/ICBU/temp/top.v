module top(
    input  wire        clk,
    input  wire        reset,   // active-high

    // ap_ctrl_hs
    input  wire        ap_start,
    output wire        ap_done,
    output wire        ap_idle,
    output wire        ap_ready,

    // params
    input  wire [31:0] stage,
    input  wire [31:0] bf_id,

    // input stream
    input  wire [64:0] input_stream_s_dout,
    input  wire        input_stream_s_empty_n,
    output wire        input_stream_s_read,

    // input peek (unused inside bf_unit, but keep for fidelity)
    input  wire [64:0] input_stream_peek_dout,
    input  wire        input_stream_peek_empty_n,
    output wire        input_stream_peek_read,

    // output stream
    output wire [64:0] output_stream_s_din,
    input  wire        output_stream_s_full_n,
    output wire        output_stream_s_write,

    // output peek (input to bf_unit)
    input  wire [64:0] output_stream_peek
);

    wire ap_rst_n = ~reset;

    bf_unit dut (
        .ap_clk(clk),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .stage(stage),
        .bf_id(bf_id),
        .input_stream_s_dout(input_stream_s_dout),
        .input_stream_s_empty_n(input_stream_s_empty_n),
        .input_stream_s_read(input_stream_s_read),
        .input_stream_peek_dout(input_stream_peek_dout),
        .input_stream_peek_empty_n(input_stream_peek_empty_n),
        .input_stream_peek_read(input_stream_peek_read),
        .output_stream_s_din(output_stream_s_din),
        .output_stream_s_full_n(output_stream_s_full_n),
        .output_stream_s_write(output_stream_s_write),
        .output_stream_peek(output_stream_peek)
    );

endmodule
