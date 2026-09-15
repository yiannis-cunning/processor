-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Mon Sep 14 04:19:59 2026
-- Host        : Yiannis-XPS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/yiann/Desktop/gits/processor/fpga/design/blocks/design_1/ip/design_1_cpu_top_0_0/design_1_cpu_top_0_0_stub.vhdl
-- Design      : design_1_cpu_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_cpu_top_0_0 is
  Port ( 
    resetn_i : in STD_LOGIC;
    clk_i : in STD_LOGIC;
    run_req_i : in STD_LOGIC;
    done_state : out STD_LOGIC;
    iccm_word_raddr_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    iccm_wdata_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    iccm_data_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    iccm_wr_en_o : out STD_LOGIC;
    iccm_rd_en_o : out STD_LOGIC;
    iccm_wr_byte_en_i : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dccm_addr_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dccm_wdata_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dccm_rdata_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dccm_wr_en_o : out STD_LOGIC;
    dccm_rd_en_o : out STD_LOGIC;
    dccm_wr_byte_en_i : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end design_1_cpu_top_0_0;

architecture stub of design_1_cpu_top_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "resetn_i,clk_i,run_req_i,done_state,iccm_word_raddr_o[31:0],iccm_wdata_o[31:0],iccm_data_i[31:0],iccm_wr_en_o,iccm_rd_en_o,iccm_wr_byte_en_i[3:0],dccm_addr_o[31:0],dccm_wdata_o[31:0],dccm_rdata_i[31:0],dccm_wr_en_o,dccm_rd_en_o,dccm_wr_byte_en_i[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "cpu_top,Vivado 2023.2";
begin
end;
