module top(
    input  wire        clk,
    input  wire        reset,   // active-high

    // ap_ctrl_hs
    input  wire        ap_start,
    output wire        ap_done,
    output wire        ap_idle,
    output wire        ap_ready,

    input  wire [64:0] core_istreams_0_dout,
    input  wire        core_istreams_0_empty_n,
    output wire        core_istreams_0_read,

    input  wire [64:0] core_istreams_1_dout,
    input  wire        core_istreams_1_empty_n,
    output wire        core_istreams_1_read,

    input  wire [64:0] core_istreams_2_dout,
    input  wire        core_istreams_2_empty_n,
    output wire        core_istreams_2_read,

    input  wire [64:0] core_istreams_3_dout,
    input  wire        core_istreams_3_empty_n,
    output wire        core_istreams_3_read,

    input  wire [64:0] core_istreams_peek_0_dout,
    input  wire        core_istreams_peek_0_empty_n,
    output wire        core_istreams_peek_0_read,

    input  wire [64:0] core_istreams_peek_1_dout,
    input  wire        core_istreams_peek_1_empty_n,
    output wire        core_istreams_peek_1_read,

    input  wire [64:0] core_istreams_peek_2_dout,
    input  wire        core_istreams_peek_2_empty_n,
    output wire        core_istreams_peek_2_read,

    input  wire [64:0] core_istreams_peek_3_dout,
    input  wire        core_istreams_peek_3_empty_n,
    output wire        core_istreams_peek_3_read,

    output wire [64:0] core_ostreams_0_din,
    input  wire        core_ostreams_0_full_n,
    output wire        core_ostreams_0_write,

    output wire [64:0] core_ostreams_1_din,
    input  wire        core_ostreams_1_full_n,
    output wire        core_ostreams_1_write,

    output wire [64:0] core_ostreams_2_din,
    input  wire        core_ostreams_2_full_n,
    output wire        core_ostreams_2_write,

    output wire [64:0] core_ostreams_3_din,
    input  wire        core_ostreams_3_full_n,
    output wire        core_ostreams_3_write,

    input  wire [64:0] core_ostreams_peek_0,
    input  wire [64:0] core_ostreams_peek_1,
    input  wire [64:0] core_ostreams_peek_2,
    input  wire [64:0] core_ostreams_peek_3
);

    wire ap_rst_n = ~reset;

    ntt_core dut (
        .ap_clk(clk),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),

        .core_istreams_0_dout(core_istreams_0_dout),
        .core_istreams_0_empty_n(core_istreams_0_empty_n),
        .core_istreams_0_read(core_istreams_0_read),

        .core_istreams_1_dout(core_istreams_1_dout),
        .core_istreams_1_empty_n(core_istreams_1_empty_n),
        .core_istreams_1_read(core_istreams_1_read),

        .core_istreams_2_dout(core_istreams_2_dout),
        .core_istreams_2_empty_n(core_istreams_2_empty_n),
        .core_istreams_2_read(core_istreams_2_read),

        .core_istreams_3_dout(core_istreams_3_dout),
        .core_istreams_3_empty_n(core_istreams_3_empty_n),
        .core_istreams_3_read(core_istreams_3_read),

        .core_istreams_peek_0_dout(core_istreams_peek_0_dout),
        .core_istreams_peek_0_empty_n(core_istreams_peek_0_empty_n),
        .core_istreams_peek_0_read(core_istreams_peek_0_read),

        .core_istreams_peek_1_dout(core_istreams_peek_1_dout),
        .core_istreams_peek_1_empty_n(core_istreams_peek_1_empty_n),
        .core_istreams_peek_1_read(core_istreams_peek_1_read),

        .core_istreams_peek_2_dout(core_istreams_peek_2_dout),
        .core_istreams_peek_2_empty_n(core_istreams_peek_2_empty_n),
        .core_istreams_peek_2_read(core_istreams_peek_2_read),

        .core_istreams_peek_3_dout(core_istreams_peek_3_dout),
        .core_istreams_peek_3_empty_n(core_istreams_peek_3_empty_n),
        .core_istreams_peek_3_read(core_istreams_peek_3_read),

        .core_ostreams_0_din(core_ostreams_0_din),
        .core_ostreams_0_full_n(core_ostreams_0_full_n),
        .core_ostreams_0_write(core_ostreams_0_write),

        .core_ostreams_1_din(core_ostreams_1_din),
        .core_ostreams_1_full_n(core_ostreams_1_full_n),
        .core_ostreams_1_write(core_ostreams_1_write),

        .core_ostreams_2_din(core_ostreams_2_din),
        .core_ostreams_2_full_n(core_ostreams_2_full_n),
        .core_ostreams_2_write(core_ostreams_2_write),

        .core_ostreams_3_din(core_ostreams_3_din),
        .core_ostreams_3_full_n(core_ostreams_3_full_n),
        .core_ostreams_3_write(core_ostreams_3_write),

        .core_ostreams_peek_0(core_ostreams_peek_0),
        .core_ostreams_peek_1(core_ostreams_peek_1),
        .core_ostreams_peek_2(core_ostreams_peek_2),
        .core_ostreams_peek_3(core_ostreams_peek_3)
    );

endmodule
