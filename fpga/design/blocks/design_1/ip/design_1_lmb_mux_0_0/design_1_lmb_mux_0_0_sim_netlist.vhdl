-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Wed Sep 16 05:22:55 2026
-- Host        : Yiannis-XPS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/yiann/Desktop/gits/processor/fpga/design/blocks/design_1/ip/design_1_lmb_mux_0_0/design_1_lmb_mux_0_0_sim_netlist.vhdl
-- Design      : design_1_lmb_mux_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lmb_mux_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_lmb_mux_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_lmb_mux_0_0 : entity is "design_1_lmb_mux_0_0,lmb_mux,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_lmb_mux_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_lmb_mux_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_lmb_mux_0_0 : entity is "lmb_mux,Vivado 2023.2";
end design_1_lmb_mux_0_0;

architecture STRUCTURE of design_1_lmb_mux_0_0 is
  signal \^addr_i\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^dccm_rdata_a_i\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rd_en_i\ : STD_LOGIC;
  signal \^wdata_i\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^wr_byte_en_i\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^wr_en_i\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of dccm_rd_en_a_o : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A READSTROBE";
  attribute X_INTERFACE_INFO of dccm_rd_en_b_o : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B READSTROBE";
  attribute X_INTERFACE_INFO of dccm_wr_en_a_o : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A WRITESTROBE";
  attribute X_INTERFACE_INFO of dccm_wr_en_b_o : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B WRITESTROBE";
  attribute X_INTERFACE_INFO of rd_en_i : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT READSTROBE";
  attribute X_INTERFACE_INFO of wr_en_i : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT WRITESTROBE";
  attribute X_INTERFACE_INFO of addr_i : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT ABUS";
  attribute X_INTERFACE_INFO of dccm_addr_a_o : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A ABUS";
  attribute X_INTERFACE_INFO of dccm_addr_b_o : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B ABUS";
  attribute X_INTERFACE_INFO of dccm_rdata_a_i : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A READDBUS";
  attribute X_INTERFACE_INFO of dccm_rdata_b_i : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B READDBUS";
  attribute X_INTERFACE_INFO of dccm_wdata_a_o : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A WRITEDBUS";
  attribute X_INTERFACE_INFO of dccm_wdata_b_o : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B WRITEDBUS";
  attribute X_INTERFACE_INFO of dccm_wr_byte_en_a_i : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A BE";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of dccm_wr_byte_en_a_i : signal is "XIL_INTERFACENAME M_LMB_PORT_A, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD";
  attribute X_INTERFACE_INFO of dccm_wr_byte_en_b_i : signal is "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B BE";
  attribute X_INTERFACE_PARAMETER of dccm_wr_byte_en_b_i : signal is "XIL_INTERFACENAME M_LMB_PORT_B, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD";
  attribute X_INTERFACE_INFO of rdata_o : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT READDBUS";
  attribute X_INTERFACE_INFO of wdata_i : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT WRITEDBUS";
  attribute X_INTERFACE_INFO of wr_byte_en_i : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT BE";
  attribute X_INTERFACE_PARAMETER of wr_byte_en_i : signal is "XIL_INTERFACENAME S_LMB_PORT, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD";
begin
  \^addr_i\(31 downto 0) <= addr_i(31 downto 0);
  \^dccm_rdata_a_i\(31 downto 0) <= dccm_rdata_a_i(31 downto 0);
  \^rd_en_i\ <= rd_en_i;
  \^wdata_i\(31 downto 0) <= wdata_i(31 downto 0);
  \^wr_byte_en_i\(3 downto 0) <= wr_byte_en_i(3 downto 0);
  \^wr_en_i\ <= wr_en_i;
  dccm_addr_a_o(31 downto 0) <= \^addr_i\(31 downto 0);
  dccm_addr_b_o(31 downto 0) <= \^addr_i\(31 downto 0);
  dccm_rd_en_a_o <= \^rd_en_i\;
  dccm_rd_en_b_o <= \^rd_en_i\;
  dccm_wdata_a_o(31 downto 0) <= \^wdata_i\(31 downto 0);
  dccm_wdata_b_o(31 downto 0) <= \^wdata_i\(31 downto 0);
  dccm_wr_byte_en_a_i(3 downto 0) <= \^wr_byte_en_i\(3 downto 0);
  dccm_wr_byte_en_b_i(3 downto 0) <= \^wr_byte_en_i\(3 downto 0);
  dccm_wr_en_a_o <= \^wr_en_i\;
  dccm_wr_en_b_o <= \^wr_en_i\;
  rdata_o(31 downto 0) <= \^dccm_rdata_a_i\(31 downto 0);
end STRUCTURE;
