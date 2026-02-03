module top(
    input  wire        clk,
    input  wire        reset,   // active-high, wrapper side

    // ap_ctrl
    input  wire        ap_start,
    output wire        ap_done,
    output wire        ap_idle,
    output wire        ap_ready,

    // streams 0..3
    input  wire [64:0] input_streams_0_dout,
    input  wire        input_streams_0_empty_n,
    output wire        input_streams_0_read,
    input  wire [64:0] input_streams_1_dout,
    input  wire        input_streams_1_empty_n,
    output wire        input_streams_1_read,
    input  wire [64:0] input_streams_2_dout,
    input  wire        input_streams_2_empty_n,
    output wire        input_streams_2_read,
    input  wire [64:0] input_streams_3_dout,
    input  wire        input_streams_3_empty_n,
    output wire        input_streams_3_read,

    // peek 0..3
    input  wire [64:0] input_streams_peek_0_dout,
    input  wire        input_streams_peek_0_empty_n,
    output wire        input_streams_peek_0_read,
    input  wire [64:0] input_streams_peek_1_dout,
    input  wire        input_streams_peek_1_empty_n,
    output wire        input_streams_peek_1_read,
    input  wire [64:0] input_streams_peek_2_dout,
    input  wire        input_streams_peek_2_empty_n,
    output wire        input_streams_peek_2_read,
    input  wire [64:0] input_streams_peek_3_dout,
    input  wire        input_streams_peek_3_empty_n,
    output wire        input_streams_peek_3_read,

    // outputs 0..3
    output wire [64:0] output_streams_0_din,
    input  wire        output_streams_0_full_n,
    output wire        output_streams_0_write,
    output wire [64:0] output_streams_1_din,
    input  wire        output_streams_1_full_n,
    output wire        output_streams_1_write,
    output wire [64:0] output_streams_2_din,
    input  wire        output_streams_2_full_n,
    output wire        output_streams_2_write,
    output wire [64:0] output_streams_3_din,
    input  wire        output_streams_3_full_n,
    output wire        output_streams_3_write,

    // output peek 0..3
    input  wire [64:0] output_streams_peek_0,
    input  wire [64:0] output_streams_peek_1,
    input  wire [64:0] output_streams_peek_2,
    input  wire [64:0] output_streams_peek_3
);

    wire ap_rst_n = ~reset; // x_stages uses active-low reset

    x_stages dut (
        .ap_clk(clk),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),

        .input_streams_0_dout(input_streams_0_dout),
        .input_streams_0_empty_n(input_streams_0_empty_n),
        .input_streams_0_read(input_streams_0_read),
        .input_streams_1_dout(input_streams_1_dout),
        .input_streams_1_empty_n(input_streams_1_empty_n),
        .input_streams_1_read(input_streams_1_read),
        .input_streams_2_dout(input_streams_2_dout),
        .input_streams_2_empty_n(input_streams_2_empty_n),
        .input_streams_2_read(input_streams_2_read),
        .input_streams_3_dout(input_streams_3_dout),
        .input_streams_3_empty_n(input_streams_3_empty_n),
        .input_streams_3_read(input_streams_3_read),

        .input_streams_peek_0_dout(input_streams_peek_0_dout),
        .input_streams_peek_0_empty_n(input_streams_peek_0_empty_n),
        .input_streams_peek_0_read(input_streams_peek_0_read),
        .input_streams_peek_1_dout(input_streams_peek_1_dout),
        .input_streams_peek_1_empty_n(input_streams_peek_1_empty_n),
        .input_streams_peek_1_read(input_streams_peek_1_read),
        .input_streams_peek_2_dout(input_streams_peek_2_dout),
        .input_streams_peek_2_empty_n(input_streams_peek_2_empty_n),
        .input_streams_peek_2_read(input_streams_peek_2_read),
        .input_streams_peek_3_dout(input_streams_peek_3_dout),
        .input_streams_peek_3_empty_n(input_streams_peek_3_empty_n),
        .input_streams_peek_3_read(input_streams_peek_3_read),

        .output_streams_0_din(output_streams_0_din),
        .output_streams_0_full_n(output_streams_0_full_n),
        .output_streams_0_write(output_streams_0_write),
        .output_streams_1_din(output_streams_1_din),
        .output_streams_1_full_n(output_streams_1_full_n),
        .output_streams_1_write(output_streams_1_write),
        .output_streams_2_din(output_streams_2_din),
        .output_streams_2_full_n(output_streams_2_full_n),
        .output_streams_2_write(output_streams_2_write),
        .output_streams_3_din(output_streams_3_din),
        .output_streams_3_full_n(output_streams_3_full_n),
        .output_streams_3_write(output_streams_3_write),

        .output_streams_peek_0(output_streams_peek_0),
        .output_streams_peek_1(output_streams_peek_1),
        .output_streams_peek_2(output_streams_peek_2),
        .output_streams_peek_3(output_streams_peek_3)
    );

endmodule
