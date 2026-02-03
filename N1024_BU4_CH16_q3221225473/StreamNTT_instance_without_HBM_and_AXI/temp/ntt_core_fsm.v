module ntt_core_fsm(  ap_clk,
  ap_rst_n,
  ap_start,
  ap_ready,
  ap_done,
  ap_idle,
  input_mem_stage_0__ap_start,
  input_mem_stage_1__ap_start,
  input_mem_stage_2__ap_start,
  input_mem_stage_3__ap_start,
  l_stages_0__ap_start,
  l_stages_1__ap_start,
  l_stages_2__ap_start,
  l_stages_3__ap_start,
  l_stages_4__ap_start,
  l_stages_5__ap_start,
  l_stages_6__ap_start,
  x_stages_0__ap_start);
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_ready;
  output ap_done;
  output ap_idle;
  output reg input_mem_stage_0__ap_start;
  output reg input_mem_stage_1__ap_start;
  output reg input_mem_stage_2__ap_start;
  output reg input_mem_stage_3__ap_start;
  output reg l_stages_0__ap_start;
  output reg l_stages_1__ap_start;
  output reg l_stages_2__ap_start;
  output reg l_stages_3__ap_start;
  output reg l_stages_4__ap_start;
  output reg l_stages_5__ap_start;
  output reg l_stages_6__ap_start;
  output reg x_stages_0__ap_start;
  wire ap_start__q0;
  assign ap_start__q0 = ap_start;
  wire ap_done__q0;
  wire input_mem_stage_0__ap_start_global__q0;
  assign input_mem_stage_0__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    input_mem_stage_0__ap_start <= 1'b0;
  end else if(input_mem_stage_0__ap_start_global__q0) begin
    input_mem_stage_0__ap_start <= 1'b1;
  end 
end
  // reg input_mem_stage_0__ap_start;
  wire input_mem_stage_1__ap_start_global__q0;
  assign input_mem_stage_1__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    input_mem_stage_1__ap_start <= 1'b0;
  end else if(input_mem_stage_1__ap_start_global__q0) begin
    input_mem_stage_1__ap_start <= 1'b1;
  end 
end
  // reg input_mem_stage_1__ap_start;
  wire input_mem_stage_2__ap_start_global__q0;
  assign input_mem_stage_2__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    input_mem_stage_2__ap_start <= 1'b0;
  end else if(input_mem_stage_2__ap_start_global__q0) begin
    input_mem_stage_2__ap_start <= 1'b1;
  end 
end
  // reg input_mem_stage_2__ap_start;
  wire input_mem_stage_3__ap_start_global__q0;
  assign input_mem_stage_3__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    input_mem_stage_3__ap_start <= 1'b0;
  end else if(input_mem_stage_3__ap_start_global__q0) begin
    input_mem_stage_3__ap_start <= 1'b1;
  end 
end
  // reg input_mem_stage_3__ap_start;
  wire l_stages_0__ap_start_global__q0;
  assign l_stages_0__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    l_stages_0__ap_start <= 1'b0;
  end else if(l_stages_0__ap_start_global__q0) begin
    l_stages_0__ap_start <= 1'b1;
  end 
end
  // reg l_stages_0__ap_start;
  wire l_stages_1__ap_start_global__q0;
  assign l_stages_1__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    l_stages_1__ap_start <= 1'b0;
  end else if(l_stages_1__ap_start_global__q0) begin
    l_stages_1__ap_start <= 1'b1;
  end 
end
  // reg l_stages_1__ap_start;
  wire l_stages_2__ap_start_global__q0;
  assign l_stages_2__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    l_stages_2__ap_start <= 1'b0;
  end else if(l_stages_2__ap_start_global__q0) begin
    l_stages_2__ap_start <= 1'b1;
  end 
end
  // reg l_stages_2__ap_start;
  wire l_stages_3__ap_start_global__q0;
  assign l_stages_3__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    l_stages_3__ap_start <= 1'b0;
  end else if(l_stages_3__ap_start_global__q0) begin
    l_stages_3__ap_start <= 1'b1;
  end 
end
  // reg l_stages_3__ap_start;
  wire l_stages_4__ap_start_global__q0;
  assign l_stages_4__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    l_stages_4__ap_start <= 1'b0;
  end else if(l_stages_4__ap_start_global__q0) begin
    l_stages_4__ap_start <= 1'b1;
  end 
end
  // reg l_stages_4__ap_start;
  wire l_stages_5__ap_start_global__q0;
  assign l_stages_5__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    l_stages_5__ap_start <= 1'b0;
  end else if(l_stages_5__ap_start_global__q0) begin
    l_stages_5__ap_start <= 1'b1;
  end 
end
  // reg l_stages_5__ap_start;
  wire l_stages_6__ap_start_global__q0;
  assign l_stages_6__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    l_stages_6__ap_start <= 1'b0;
  end else if(l_stages_6__ap_start_global__q0) begin
    l_stages_6__ap_start <= 1'b1;
  end 
end
  // reg l_stages_6__ap_start;
  wire x_stages_0__ap_start_global__q0;
  assign x_stages_0__ap_start_global__q0 = ap_start__q0;
  always @(posedge ap_clk) begin
  if(~ap_rst_n) begin
    x_stages_0__ap_start <= 1'b0;
  end else if(x_stages_0__ap_start_global__q0) begin
    x_stages_0__ap_start <= 1'b1;
  end 
end
  // reg x_stages_0__ap_start;
// pragma RS clk port=ap_clk
// pragma RS rst port=ap_rst_n active=low
// pragma RS ap-ctrl ap_start=ap_start ap_done=ap_done ap_idle=ap_idle ap_ready=ap_ready
// pragma RS ap-ctrl ap_start=input_mem_stage_0__ap_start
// pragma RS ap-ctrl ap_start=input_mem_stage_1__ap_start
// pragma RS ap-ctrl ap_start=input_mem_stage_2__ap_start
// pragma RS ap-ctrl ap_start=input_mem_stage_3__ap_start
// pragma RS ap-ctrl ap_start=l_stages_0__ap_start
// pragma RS ap-ctrl ap_start=l_stages_1__ap_start
// pragma RS ap-ctrl ap_start=l_stages_2__ap_start
// pragma RS ap-ctrl ap_start=l_stages_3__ap_start
// pragma RS ap-ctrl ap_start=l_stages_4__ap_start
// pragma RS ap-ctrl ap_start=l_stages_5__ap_start
// pragma RS ap-ctrl ap_start=l_stages_6__ap_start
// pragma RS ap-ctrl ap_start=x_stages_0__ap_start
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
  assign ap_done__q0 = (tapa_state == 2'b10); 

endmodule
