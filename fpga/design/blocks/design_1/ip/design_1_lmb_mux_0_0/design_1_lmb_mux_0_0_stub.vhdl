-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Thu Sep 17 00:48:23 2026
-- Host        : Yiannis-XPS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/yiann/Desktop/gits/processor/fpga/design/blocks/design_1/ip/design_1_lmb_mux_0_0/design_1_lmb_mux_0_0_stub.vhdl
-- Design      : design_1_lmb_mux_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_lmb_mux_0_0 is
  Port ( 
    addr_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wdata_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rdata_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en_i : in STD_LOGIC;
    rd_en_i : in STD_LOGIC;
    wr_byte_en_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dccm_addr_a_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dccm_wdata_a_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dccm_rdata_a_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dccm_wr_en_a_o : out STD_LOGIC;
    dccm_rd_en_a_o : out STD_LOGIC;
    dccm_wr_byte_en_a_i : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dccm_addr_b_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dccm_wdata_b_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dccm_rdata_b_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dccm_wr_en_b_o : out STD_LOGIC;
    dccm_rd_en_b_o : out STD_LOGIC;
    dccm_wr_byte_en_b_i : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end design_1_lmb_mux_0_0;

architecture stub of design_1_lmb_mux_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "addr_i[31:0],wdata_i[31:0],rdata_o[31:0],wr_en_i,rd_en_i,wr_byte_en_i[3:0],dccm_addr_a_o[31:0],dccm_wdata_a_o[31:0],dccm_rdata_a_i[31:0],dccm_wr_en_a_o,dccm_rd_en_a_o,dccm_wr_byte_en_a_i[3:0],dccm_addr_b_o[31:0],dccm_wdata_b_o[31:0],dccm_rdata_b_i[31:0],dccm_wr_en_b_o,dccm_rd_en_b_o,dccm_wr_byte_en_b_i[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "lmb_mux,Vivado 2023.2";
begin
end;
