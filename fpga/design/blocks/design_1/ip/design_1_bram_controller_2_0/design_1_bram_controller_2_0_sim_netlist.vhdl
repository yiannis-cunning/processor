-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Mon Sep 14 04:19:45 2026
-- Host        : Yiannis-XPS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/yiann/Desktop/gits/processor/fpga/design/blocks/design_1/ip/design_1_bram_controller_2_0/design_1_bram_controller_2_0_sim_netlist.vhdl
-- Design      : design_1_bram_controller_2_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_bram_controller_2_0_bram_controller is
  port (
    rdata_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_rdata_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rd_en_i : in STD_LOGIC;
    addr_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk_i : in STD_LOGIC;
    resetn_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_bram_controller_2_0_bram_controller : entity is "bram_controller";
end design_1_bram_controller_2_0_bram_controller;

architecture STRUCTURE of design_1_bram_controller_2_0_bram_controller is
  signal \bram_raddr_d1r[1]_i_1_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rdata_o[10]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rdata_o[11]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rdata_o[12]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rdata_o[13]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rdata_o[14]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rdata_o[15]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rdata_o[16]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rdata_o[17]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \rdata_o[18]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rdata_o[19]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rdata_o[20]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rdata_o[21]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rdata_o[22]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rdata_o[23]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rdata_o[24]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rdata_o[25]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rdata_o[26]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \rdata_o[27]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \rdata_o[28]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \rdata_o[29]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \rdata_o[30]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rdata_o[31]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rdata_o[8]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rdata_o[9]_INST_0\ : label is "soft_lutpair1";
begin
\bram_raddr_d1r[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn_i,
      O => \bram_raddr_d1r[1]_i_1_n_0\
    );
\bram_raddr_d1r_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \bram_raddr_d1r[1]_i_1_n_0\,
      D => addr_i(0),
      Q => p_0_in(3)
    );
\bram_raddr_d1r_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \bram_raddr_d1r[1]_i_1_n_0\,
      D => addr_i(1),
      Q => p_0_in(4)
    );
\rdata_o[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => bram_rdata_i(24),
      I1 => bram_rdata_i(8),
      I2 => p_0_in(3),
      I3 => bram_rdata_i(16),
      I4 => p_0_in(4),
      I5 => bram_rdata_i(0),
      O => rdata_o(0)
    );
\rdata_o[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => bram_rdata_i(18),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(26),
      I3 => p_0_in(4),
      I4 => bram_rdata_i(10),
      O => rdata_o(10)
    );
\rdata_o[11]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => bram_rdata_i(19),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(27),
      I3 => p_0_in(4),
      I4 => bram_rdata_i(11),
      O => rdata_o(11)
    );
\rdata_o[12]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => bram_rdata_i(20),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(28),
      I3 => p_0_in(4),
      I4 => bram_rdata_i(12),
      O => rdata_o(12)
    );
\rdata_o[13]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => bram_rdata_i(21),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(29),
      I3 => p_0_in(4),
      I4 => bram_rdata_i(13),
      O => rdata_o(13)
    );
\rdata_o[14]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => bram_rdata_i(22),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(30),
      I3 => p_0_in(4),
      I4 => bram_rdata_i(14),
      O => rdata_o(14)
    );
\rdata_o[15]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => bram_rdata_i(23),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(31),
      I3 => p_0_in(4),
      I4 => bram_rdata_i(15),
      O => rdata_o(15)
    );
\rdata_o[16]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => bram_rdata_i(24),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(16),
      I3 => p_0_in(4),
      O => rdata_o(16)
    );
\rdata_o[17]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => bram_rdata_i(25),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(17),
      I3 => p_0_in(4),
      O => rdata_o(17)
    );
\rdata_o[18]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => bram_rdata_i(26),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(18),
      I3 => p_0_in(4),
      O => rdata_o(18)
    );
\rdata_o[19]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => bram_rdata_i(27),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(19),
      I3 => p_0_in(4),
      O => rdata_o(19)
    );
\rdata_o[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => bram_rdata_i(25),
      I1 => bram_rdata_i(9),
      I2 => p_0_in(3),
      I3 => bram_rdata_i(17),
      I4 => p_0_in(4),
      I5 => bram_rdata_i(1),
      O => rdata_o(1)
    );
\rdata_o[20]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => bram_rdata_i(28),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(20),
      I3 => p_0_in(4),
      O => rdata_o(20)
    );
\rdata_o[21]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => bram_rdata_i(29),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(21),
      I3 => p_0_in(4),
      O => rdata_o(21)
    );
\rdata_o[22]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => bram_rdata_i(30),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(22),
      I3 => p_0_in(4),
      O => rdata_o(22)
    );
\rdata_o[23]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => bram_rdata_i(31),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(23),
      I3 => p_0_in(4),
      O => rdata_o(23)
    );
\rdata_o[24]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => p_0_in(4),
      I1 => bram_rdata_i(24),
      I2 => p_0_in(3),
      O => rdata_o(24)
    );
\rdata_o[25]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => p_0_in(4),
      I1 => bram_rdata_i(25),
      I2 => p_0_in(3),
      O => rdata_o(25)
    );
\rdata_o[26]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => p_0_in(4),
      I1 => bram_rdata_i(26),
      I2 => p_0_in(3),
      O => rdata_o(26)
    );
\rdata_o[27]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => p_0_in(4),
      I1 => bram_rdata_i(27),
      I2 => p_0_in(3),
      O => rdata_o(27)
    );
\rdata_o[28]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => p_0_in(4),
      I1 => bram_rdata_i(28),
      I2 => p_0_in(3),
      O => rdata_o(28)
    );
\rdata_o[29]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => p_0_in(4),
      I1 => bram_rdata_i(29),
      I2 => p_0_in(3),
      O => rdata_o(29)
    );
\rdata_o[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => bram_rdata_i(26),
      I1 => bram_rdata_i(10),
      I2 => p_0_in(3),
      I3 => bram_rdata_i(18),
      I4 => p_0_in(4),
      I5 => bram_rdata_i(2),
      O => rdata_o(2)
    );
\rdata_o[30]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => p_0_in(4),
      I1 => bram_rdata_i(30),
      I2 => p_0_in(3),
      O => rdata_o(30)
    );
\rdata_o[31]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => p_0_in(4),
      I1 => bram_rdata_i(31),
      I2 => p_0_in(3),
      O => rdata_o(31)
    );
\rdata_o[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => bram_rdata_i(27),
      I1 => bram_rdata_i(11),
      I2 => p_0_in(3),
      I3 => bram_rdata_i(19),
      I4 => p_0_in(4),
      I5 => bram_rdata_i(3),
      O => rdata_o(3)
    );
\rdata_o[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => bram_rdata_i(28),
      I1 => bram_rdata_i(12),
      I2 => p_0_in(3),
      I3 => bram_rdata_i(20),
      I4 => p_0_in(4),
      I5 => bram_rdata_i(4),
      O => rdata_o(4)
    );
\rdata_o[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => bram_rdata_i(29),
      I1 => bram_rdata_i(13),
      I2 => p_0_in(3),
      I3 => bram_rdata_i(21),
      I4 => p_0_in(4),
      I5 => bram_rdata_i(5),
      O => rdata_o(5)
    );
\rdata_o[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => bram_rdata_i(30),
      I1 => bram_rdata_i(14),
      I2 => p_0_in(3),
      I3 => bram_rdata_i(22),
      I4 => p_0_in(4),
      I5 => bram_rdata_i(6),
      O => rdata_o(6)
    );
\rdata_o[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => bram_rdata_i(31),
      I1 => bram_rdata_i(15),
      I2 => p_0_in(3),
      I3 => bram_rdata_i(23),
      I4 => p_0_in(4),
      I5 => bram_rdata_i(7),
      O => rdata_o(7)
    );
\rdata_o[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => bram_rdata_i(16),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(24),
      I3 => p_0_in(4),
      I4 => bram_rdata_i(8),
      O => rdata_o(8)
    );
\rdata_o[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => bram_rdata_i(17),
      I1 => p_0_in(3),
      I2 => bram_rdata_i(25),
      I3 => p_0_in(4),
      I4 => bram_rdata_i(9),
      O => rdata_o(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_bram_controller_2_0 is
  port (
    clk_i : in STD_LOGIC;
    resetn_i : in STD_LOGIC;
    addr_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wdata_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rdata_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en_i : in STD_LOGIC;
    rd_en_i : in STD_LOGIC;
    wr_byte_en_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_en_o : out STD_LOGIC;
    bram_rdata_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_wdata_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_byte_wr_en_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_addr_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    bram_clk_o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_bram_controller_2_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_bram_controller_2_0 : entity is "design_1_bram_controller_2_0,bram_controller,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_bram_controller_2_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_bram_controller_2_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_bram_controller_2_0 : entity is "bram_controller,Vivado 2023.2";
end design_1_bram_controller_2_0;

architecture STRUCTURE of design_1_bram_controller_2_0 is
  signal \^addr_i\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \bram_byte_wr_en_o[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \^clk_i\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of bram_clk_o : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of bram_clk_o : signal is "XIL_INTERFACENAME BRAM_PORT_A, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute X_INTERFACE_INFO of bram_en_o : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A EN";
  attribute X_INTERFACE_INFO of rd_en_i : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT READSTROBE";
  attribute X_INTERFACE_INFO of wr_en_i : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT WRITESTROBE";
  attribute X_INTERFACE_INFO of addr_i : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT ABUS";
  attribute X_INTERFACE_INFO of bram_addr_o : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A ADDR";
  attribute X_INTERFACE_INFO of bram_byte_wr_en_o : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A WE";
  attribute X_INTERFACE_INFO of bram_rdata_i : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of bram_wdata_o : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DIN";
  attribute X_INTERFACE_INFO of rdata_o : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT READDBUS";
  attribute X_INTERFACE_INFO of wdata_i : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT WRITEDBUS";
  attribute X_INTERFACE_INFO of wr_byte_en_i : signal is "xilinx.com:interface:lmb:1.0 S_LMB_PORT BE";
  attribute X_INTERFACE_PARAMETER of wr_byte_en_i : signal is "XIL_INTERFACENAME S_LMB_PORT, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD";
begin
  \^addr_i\(6 downto 0) <= addr_i(6 downto 0);
  \^clk_i\ <= clk_i;
  bram_addr_o(4 downto 0) <= \^addr_i\(6 downto 2);
  bram_clk_o <= \^clk_i\;
\bram_byte_wr_en_o[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \^addr_i\(0),
      I1 => wr_byte_en_i(0),
      I2 => \^addr_i\(1),
      I3 => wr_en_i,
      O => bram_byte_wr_en_o(0)
    );
\bram_byte_wr_en_o[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54040000"
    )
        port map (
      I0 => \^addr_i\(1),
      I1 => wr_byte_en_i(1),
      I2 => \^addr_i\(0),
      I3 => wr_byte_en_i(0),
      I4 => wr_en_i,
      O => bram_byte_wr_en_o(1)
    );
\bram_byte_wr_en_o[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33E200E200000000"
    )
        port map (
      I0 => wr_byte_en_i(2),
      I1 => \^addr_i\(1),
      I2 => wr_byte_en_i(0),
      I3 => \^addr_i\(0),
      I4 => wr_byte_en_i(1),
      I5 => wr_en_i,
      O => bram_byte_wr_en_o(2)
    );
\bram_byte_wr_en_o[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFE200E200000000"
    )
        port map (
      I0 => wr_byte_en_i(3),
      I1 => \^addr_i\(1),
      I2 => wr_byte_en_i(1),
      I3 => \^addr_i\(0),
      I4 => \bram_byte_wr_en_o[3]_INST_0_i_1_n_0\,
      I5 => wr_en_i,
      O => bram_byte_wr_en_o(3)
    );
\bram_byte_wr_en_o[3]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wr_byte_en_i(0),
      I1 => \^addr_i\(1),
      I2 => wr_byte_en_i(2),
      O => \bram_byte_wr_en_o[3]_INST_0_i_1_n_0\
    );
bram_en_o_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => wr_en_i,
      I1 => rd_en_i,
      O => bram_en_o
    );
\bram_wdata_o[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^addr_i\(1),
      I1 => wdata_i(0),
      I2 => \^addr_i\(0),
      O => bram_wdata_o(0)
    );
\bram_wdata_o[10]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => wdata_i(2),
      I1 => \^addr_i\(0),
      I2 => wdata_i(10),
      I3 => \^addr_i\(1),
      O => bram_wdata_o(10)
    );
\bram_wdata_o[11]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => wdata_i(3),
      I1 => \^addr_i\(0),
      I2 => wdata_i(11),
      I3 => \^addr_i\(1),
      O => bram_wdata_o(11)
    );
\bram_wdata_o[12]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => wdata_i(4),
      I1 => \^addr_i\(0),
      I2 => wdata_i(12),
      I3 => \^addr_i\(1),
      O => bram_wdata_o(12)
    );
\bram_wdata_o[13]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => wdata_i(5),
      I1 => \^addr_i\(0),
      I2 => wdata_i(13),
      I3 => \^addr_i\(1),
      O => bram_wdata_o(13)
    );
\bram_wdata_o[14]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => wdata_i(6),
      I1 => \^addr_i\(0),
      I2 => wdata_i(14),
      I3 => \^addr_i\(1),
      O => bram_wdata_o(14)
    );
\bram_wdata_o[15]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => wdata_i(7),
      I1 => \^addr_i\(0),
      I2 => wdata_i(15),
      I3 => \^addr_i\(1),
      O => bram_wdata_o(15)
    );
\bram_wdata_o[16]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => wdata_i(8),
      I1 => \^addr_i\(0),
      I2 => wdata_i(0),
      I3 => \^addr_i\(1),
      I4 => wdata_i(16),
      O => bram_wdata_o(16)
    );
\bram_wdata_o[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => wdata_i(9),
      I1 => \^addr_i\(0),
      I2 => wdata_i(1),
      I3 => \^addr_i\(1),
      I4 => wdata_i(17),
      O => bram_wdata_o(17)
    );
\bram_wdata_o[18]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => wdata_i(10),
      I1 => \^addr_i\(0),
      I2 => wdata_i(2),
      I3 => \^addr_i\(1),
      I4 => wdata_i(18),
      O => bram_wdata_o(18)
    );
\bram_wdata_o[19]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => wdata_i(11),
      I1 => \^addr_i\(0),
      I2 => wdata_i(3),
      I3 => \^addr_i\(1),
      I4 => wdata_i(19),
      O => bram_wdata_o(19)
    );
\bram_wdata_o[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^addr_i\(1),
      I1 => wdata_i(1),
      I2 => \^addr_i\(0),
      O => bram_wdata_o(1)
    );
\bram_wdata_o[20]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => wdata_i(12),
      I1 => \^addr_i\(0),
      I2 => wdata_i(4),
      I3 => \^addr_i\(1),
      I4 => wdata_i(20),
      O => bram_wdata_o(20)
    );
\bram_wdata_o[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => wdata_i(13),
      I1 => \^addr_i\(0),
      I2 => wdata_i(5),
      I3 => \^addr_i\(1),
      I4 => wdata_i(21),
      O => bram_wdata_o(21)
    );
\bram_wdata_o[22]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => wdata_i(14),
      I1 => \^addr_i\(0),
      I2 => wdata_i(6),
      I3 => \^addr_i\(1),
      I4 => wdata_i(22),
      O => bram_wdata_o(22)
    );
\bram_wdata_o[23]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => wdata_i(15),
      I1 => \^addr_i\(0),
      I2 => wdata_i(7),
      I3 => \^addr_i\(1),
      I4 => wdata_i(23),
      O => bram_wdata_o(23)
    );
\bram_wdata_o[24]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => wdata_i(0),
      I1 => wdata_i(16),
      I2 => \^addr_i\(0),
      I3 => wdata_i(8),
      I4 => \^addr_i\(1),
      I5 => wdata_i(24),
      O => bram_wdata_o(24)
    );
\bram_wdata_o[25]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => wdata_i(1),
      I1 => wdata_i(17),
      I2 => \^addr_i\(0),
      I3 => wdata_i(9),
      I4 => \^addr_i\(1),
      I5 => wdata_i(25),
      O => bram_wdata_o(25)
    );
\bram_wdata_o[26]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => wdata_i(2),
      I1 => wdata_i(18),
      I2 => \^addr_i\(0),
      I3 => wdata_i(10),
      I4 => \^addr_i\(1),
      I5 => wdata_i(26),
      O => bram_wdata_o(26)
    );
\bram_wdata_o[27]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => wdata_i(3),
      I1 => wdata_i(19),
      I2 => \^addr_i\(0),
      I3 => wdata_i(11),
      I4 => \^addr_i\(1),
      I5 => wdata_i(27),
      O => bram_wdata_o(27)
    );
\bram_wdata_o[28]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => wdata_i(4),
      I1 => wdata_i(20),
      I2 => \^addr_i\(0),
      I3 => wdata_i(12),
      I4 => \^addr_i\(1),
      I5 => wdata_i(28),
      O => bram_wdata_o(28)
    );
\bram_wdata_o[29]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => wdata_i(5),
      I1 => wdata_i(21),
      I2 => \^addr_i\(0),
      I3 => wdata_i(13),
      I4 => \^addr_i\(1),
      I5 => wdata_i(29),
      O => bram_wdata_o(29)
    );
\bram_wdata_o[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^addr_i\(1),
      I1 => wdata_i(2),
      I2 => \^addr_i\(0),
      O => bram_wdata_o(2)
    );
\bram_wdata_o[30]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => wdata_i(6),
      I1 => wdata_i(22),
      I2 => \^addr_i\(0),
      I3 => wdata_i(14),
      I4 => \^addr_i\(1),
      I5 => wdata_i(30),
      O => bram_wdata_o(30)
    );
\bram_wdata_o[31]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => wdata_i(7),
      I1 => wdata_i(23),
      I2 => \^addr_i\(0),
      I3 => wdata_i(15),
      I4 => \^addr_i\(1),
      I5 => wdata_i(31),
      O => bram_wdata_o(31)
    );
\bram_wdata_o[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^addr_i\(1),
      I1 => wdata_i(3),
      I2 => \^addr_i\(0),
      O => bram_wdata_o(3)
    );
\bram_wdata_o[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^addr_i\(1),
      I1 => wdata_i(4),
      I2 => \^addr_i\(0),
      O => bram_wdata_o(4)
    );
\bram_wdata_o[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^addr_i\(1),
      I1 => wdata_i(5),
      I2 => \^addr_i\(0),
      O => bram_wdata_o(5)
    );
\bram_wdata_o[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^addr_i\(1),
      I1 => wdata_i(6),
      I2 => \^addr_i\(0),
      O => bram_wdata_o(6)
    );
\bram_wdata_o[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^addr_i\(1),
      I1 => wdata_i(7),
      I2 => \^addr_i\(0),
      O => bram_wdata_o(7)
    );
\bram_wdata_o[8]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => wdata_i(0),
      I1 => \^addr_i\(0),
      I2 => wdata_i(8),
      I3 => \^addr_i\(1),
      O => bram_wdata_o(8)
    );
\bram_wdata_o[9]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => wdata_i(1),
      I1 => \^addr_i\(0),
      I2 => wdata_i(9),
      I3 => \^addr_i\(1),
      O => bram_wdata_o(9)
    );
inst: entity work.design_1_bram_controller_2_0_bram_controller
     port map (
      addr_i(1 downto 0) => \^addr_i\(1 downto 0),
      bram_rdata_i(31 downto 0) => bram_rdata_i(31 downto 0),
      clk_i => \^clk_i\,
      rd_en_i => rd_en_i,
      rdata_o(31 downto 0) => rdata_o(31 downto 0),
      resetn_i => resetn_i
    );
end STRUCTURE;
