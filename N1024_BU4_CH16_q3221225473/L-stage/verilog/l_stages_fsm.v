module l_stages_fsm(  ap_clk,
  ap_rst_n,
  ap_start,
  ap_ready,
  ap_done,
  ap_idle,
  stage,
  bf_unit_0___stage__q0,
  bf_unit_0__ap_start,
  bf_unit_1___stage__q0,
  bf_unit_1__ap_start,
  bf_unit_2___stage__q0,
  bf_unit_2__ap_start,
  bf_unit_3___stage__q0,
  bf_unit_3__ap_start);
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_ready;
  output ap_done;
  output ap_idle;
  input [31:0] stage;
  output [31:0] bf_unit_0___stage__q0;
  output reg bf_unit_0__ap_start;
  output [31:0] bf_unit_1___stage__q0;
  output reg bf_unit_1__ap_start;
  output [31:0] bf_unit_2___stage__q0;
  output reg bf_unit_2__ap_start;
  output [31:0] bf_unit_3___stage__q0;
  output reg bf_unit_3__ap_start;
 
  wire ap_start__q0;
  wire ap_done__q0;
  assign ap_start__q0 = ap_start;
  // wire [31:0] bf_unit_0___stage__q0;
  assign bf_unit_0___stage__q0 = stage;
  wire bf_unit_0__ap_start_global__q0;
  assign bf_unit_0__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    bf_unit_0__ap_start <= 1'b0;
  end else if(bf_unit_0__ap_start_global__q0) begin
    bf_unit_0__ap_start <= 1'b1;
  end 
end
  // reg bf_unit_0__ap_start;
  // wire [31:0] bf_unit_1___stage__q0;
  assign bf_unit_1___stage__q0 = stage;
  wire bf_unit_1__ap_start_global__q0;
  assign bf_unit_1__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    bf_unit_1__ap_start <= 1'b0;
  end else if(bf_unit_1__ap_start_global__q0) begin
    bf_unit_1__ap_start <= 1'b1;
  end 
end
  // reg bf_unit_1__ap_start;
  // wire [31:0] bf_unit_2___stage__q0;
  assign bf_unit_2___stage__q0 = stage;
  wire bf_unit_2__ap_start_global__q0;
  assign bf_unit_2__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    bf_unit_2__ap_start <= 1'b0;
  end else if(bf_unit_2__ap_start_global__q0) begin
    bf_unit_2__ap_start <= 1'b1;
  end 
end
  // reg bf_unit_2__ap_start;
  // wire [31:0] bf_unit_3___stage__q0;
  assign bf_unit_3___stage__q0 = stage;
  // wire bf_unit_3__ap_start_global__q0;
  assign bf_unit_3__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    bf_unit_3__ap_start <= 1'b0;
  end else if(bf_unit_3__ap_start_global__q0) begin
    bf_unit_3__ap_start <= 1'b1;
  end 
end
  // reg bf_unit_3__ap_start;
  // input [31:0] stage;
  // output [31:0] bf_unit_0___stage__q0;
  // output bf_unit_0__ap_start;
  // output [31:0] bf_unit_1___stage__q0;
  // output bf_unit_1__ap_start;
  // output [31:0] bf_unit_2___stage__q0;
  // output bf_unit_2__ap_start;
  // output [31:0] bf_unit_3___stage__q0;
  // output bf_unit_3__ap_start;
// pragma RS clk port=ap_clk
// pragma RS rst port=ap_rst_n active=low
// pragma RS ap-ctrl ap_start=ap_start ap_done=ap_done ap_idle=ap_idle ap_ready=ap_ready scalar=(stage)
// pragma RS ap-ctrl ap_start=bf_unit_0__ap_start scalar=bf_unit_0___.*
// pragma RS ap-ctrl ap_start=bf_unit_1__ap_start scalar=bf_unit_1___.*
// pragma RS ap-ctrl ap_start=bf_unit_2__ap_start scalar=bf_unit_2___.*
// pragma RS ap-ctrl ap_start=bf_unit_3__ap_start scalar=bf_unit_3___.*
  reg [1:0] tapa_state;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    tapa_state <= 2'b00;
  end else begin
    case(tapa_state)
      2'b00: begin
        if(ap_start__q0) begin
          tapa_state <= 2'b01;
        end 
      end
      2'b01: begin
        tapa_state <= 2'b10;
      end
      2'b10: begin
        tapa_state <= 2'b00;
      end
    endcase
  end
end
  assign ap_idle = (tapa_state == 2'b00);
  assign ap_done = ap_done__q0;
  assign ap_ready = ap_done__q0;
  // wire ap_start__q0;
  // wire ap_done__q0;
  // assign ap_start__q0 = ap_start;
  assign ap_done__q0 = (tapa_state == 2'b10); 

endmodule
