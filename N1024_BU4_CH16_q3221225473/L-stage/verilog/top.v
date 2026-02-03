module top(
    input  wire        clk,
    input  wire        reset,   // active-high (external)

    // ap_ctrl_hs
    input  wire        ap_start,
    output wire        ap_done,
    output wire        ap_idle,
    output wire        ap_ready,

    // params
    input  wire [31:0] stage,

    // input streams
    input  wire [64:0] input_stream_0_dout,
    input  wire        input_stream_0_empty_n,
    output wire        input_stream_0_read,

    input  wire [64:0] input_stream_1_dout,
    input  wire        input_stream_1_empty_n,
    output wire        input_stream_1_read,

    input  wire [64:0] input_stream_2_dout,
    input  wire        input_stream_2_empty_n,
    output wire        input_stream_2_read,

    input  wire [64:0] input_stream_3_dout,
    input  wire        input_stream_3_empty_n,
    output wire        input_stream_3_read,

    // input peek (unused inside l_stages maybe)
    input  wire [64:0] input_stream_peek_0_dout,
    input  wire        input_stream_peek_0_empty_n,
    output wire        input_stream_peek_0_read,

    input  wire [64:0] input_stream_peek_1_dout,
    input  wire        input_stream_peek_1_empty_n,
    output wire        input_stream_peek_1_read,

    input  wire [64:0] input_stream_peek_2_dout,
    input  wire        input_stream_peek_2_empty_n,
    output wire        input_stream_peek_2_read,

    input  wire [64:0] input_stream_peek_3_dout,
    input  wire        input_stream_peek_3_empty_n,
    output wire        input_stream_peek_3_read,

    // output streams
    output wire [64:0] output_stream_0_din,
    input  wire        output_stream_0_full_n,
    output wire        output_stream_0_write,

    output wire [64:0] output_stream_1_din,
    input  wire        output_stream_1_full_n,
    output wire        output_stream_1_write,

    output wire [64:0] output_stream_2_din,
    input  wire        output_stream_2_full_n,
    output wire        output_stream_2_write,

    output wire [64:0] output_stream_3_din,
    input  wire        output_stream_3_full_n,
    output wire        output_stream_3_write,

    // output peek (input to l_stages)
    input  wire [64:0] output_stream_peek_0,
    input  wire [64:0] output_stream_peek_1,
    input  wire [64:0] output_stream_peek_2,
    input  wire [64:0] output_stream_peek_3
);

    // Convert active-high reset to active-low ap_rst_n
    wire ap_rst_n = ~reset;

    l_stages dut (
        .ap_clk(clk),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),

        .stage(stage),

        .input_stream_0_dout(input_stream_0_dout),
        .input_stream_0_empty_n(input_stream_0_empty_n),
        .input_stream_0_read(input_stream_0_read),

        .input_stream_1_dout(input_stream_1_dout),
        .input_stream_1_empty_n(input_stream_1_empty_n),
        .input_stream_1_read(input_stream_1_read),

        .input_stream_2_dout(input_stream_2_dout),
        .input_stream_2_empty_n(input_stream_2_empty_n),
        .input_stream_2_read(input_stream_2_read),

        .input_stream_3_dout(input_stream_3_dout),
        .input_stream_3_empty_n(input_stream_3_empty_n),
        .input_stream_3_read(input_stream_3_read),

        .input_stream_peek_0_dout(input_stream_peek_0_dout),
        .input_stream_peek_0_empty_n(input_stream_peek_0_empty_n),
        .input_stream_peek_0_read(input_stream_peek_0_read),

        .input_stream_peek_1_dout(input_stream_peek_1_dout),
        .input_stream_peek_1_empty_n(input_stream_peek_1_empty_n),
        .input_stream_peek_1_read(input_stream_peek_1_read),

        .input_stream_peek_2_dout(input_stream_peek_2_dout),
        .input_stream_peek_2_empty_n(input_stream_peek_2_empty_n),
        .input_stream_peek_2_read(input_stream_peek_2_read),

        .input_stream_peek_3_dout(input_stream_peek_3_dout),
        .input_stream_peek_3_empty_n(input_stream_peek_3_empty_n),
        .input_stream_peek_3_read(input_stream_peek_3_read),

        .output_stream_0_din(output_stream_0_din),
        .output_stream_0_full_n(output_stream_0_full_n),
        .output_stream_0_write(output_stream_0_write),

        .output_stream_1_din(output_stream_1_din),
        .output_stream_1_full_n(output_stream_1_full_n),
        .output_stream_1_write(output_stream_1_write),

        .output_stream_2_din(output_stream_2_din),
        .output_stream_2_full_n(output_stream_2_full_n),
        .output_stream_2_write(output_stream_2_write),

        .output_stream_3_din(output_stream_3_din),
        .output_stream_3_full_n(output_stream_3_full_n),
        .output_stream_3_write(output_stream_3_write),

        .output_stream_peek_0(output_stream_peek_0),
        .output_stream_peek_1(output_stream_peek_1),
        .output_stream_peek_2(output_stream_peek_2),
        .output_stream_peek_3(output_stream_peek_3)
    );

endmodule
