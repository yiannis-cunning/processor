`timescale 1 ps / 1 ps

module cpu_system_wrapper
   (sys_clk_p,
    sys_clk_n,
    led,
    key_in,
    resetn_i,
    run_req_i);
    
  // Manual led/sw connections
  output wire [3:0] led;
  input wire [1:0] key_in;
  wire [31:0]gpio_i;
  wire [31:0]gpio_o;
  
  input wire resetn_i;
  input wire run_req_i;
  input wire sys_clk_n;
  input wire sys_clk_p;
  
  assign gpio_i = {26'b0, key_in[1:0], led[3:0]};
  assign led[3:0] = gpio_o[3:0];

 
  
  // Manual clock gen
  IBUFDS sys_clk_ibufgds
  (
    .O              (sys_clk                  ),
    .I              (sys_clk_p                ),
    .IB             (sys_clk_n                )
  );


  design_1_wrapper cpu_block_design
       (.clk_i(sys_clk),
        .gpio_i(gpio_i),
        .gpio_o(gpio_o),
        .resetn_i(resetn_i),
        .run_req_i(run_req_i));
endmodule