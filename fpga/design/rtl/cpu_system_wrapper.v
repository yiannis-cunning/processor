`timescale 1 ps / 1 ps

module cpu_system_wrapper
   (sys_clk_p,
    sys_clk_n,
    led,
    key_in,
    resetn_i);
    
  // Manual led/sw connections
  output wire [3:0] led;
  input wire [1:0] key_in;
  input wire resetn_i;
  input wire sys_clk_n;
  input wire sys_clk_p;
  
  wire newclk;
  wire [31:0]gpio_i;
  wire [31:0]gpio_o;
  


  wire resetn_int;
  
  assign gpio_i = {26'b0, key_in[1:0], led[3:0]};
  assign led[3:0] = gpio_o[3:0];

 
  clk_reset_gen I_clk_rst(
    .clkp_i(sys_clk_p),
    .clkn_i(sys_clk_n),
    .resetn_i(resetn_i),
    .clk_o(newclk),
    .resetn_o(resetn_int)
  );

  bd_core cpu_block_design
       (.clk_i(newclk),
        .gpio_i(gpio_i),
        .gpio_o(gpio_o),
        .resetn_i(resetn_int),
        .run_req_i(1'b1));
endmodule