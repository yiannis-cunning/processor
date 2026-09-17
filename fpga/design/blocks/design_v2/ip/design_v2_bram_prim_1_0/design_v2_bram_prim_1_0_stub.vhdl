-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Thu Sep 17 06:42:35 2026
-- Host        : DESKTOP-7L9HO1V running 64-bit Debian GNU/Linux 12 (bookworm)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/cunningy/Desktop/gits/processor/fpga/design/blocks/design_v2/ip/design_v2_bram_prim_1_0/design_v2_bram_prim_1_0_stub.vhdl
-- Design      : design_v2_bram_prim_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_v2_bram_prim_1_0 is
  Port ( 
    en_i : in STD_LOGIC;
    rdata_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wdata_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    byte_wr_en_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addr_i : in STD_LOGIC_VECTOR ( 12 downto 0 );
    clk_i : in STD_LOGIC
  );

end design_v2_bram_prim_1_0;

architecture stub of design_v2_bram_prim_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "en_i,rdata_o[31:0],wdata_i[31:0],byte_wr_en_i[3:0],addr_i[12:0],clk_i";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "bram_prim,Vivado 2023.2";
begin
end;
