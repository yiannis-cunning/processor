-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Thu Sep 17 07:15:08 2026
-- Host        : DESKTOP-7L9HO1V running 64-bit Debian GNU/Linux 12 (bookworm)
-- Command     : write_vhdl -force -mode funcsim
--               /home/cunningy/Desktop/gits/processor/fpga/design/blocks/design_v2/ip/design_v2_lmb_mux_0_0/design_v2_lmb_mux_0_0_sim_netlist.vhdl
-- Design      : design_v2_lmb_mux_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_v2_lmb_mux_0_0_lmb_mux is
  port (
    rdata_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rd_en_i : in STD_LOGIC;
    addr_i : in STD_LOGIC_VECTOR ( 24 downto 0 );
    clk_i : in STD_LOGIC;
    resetn_i : in STD_LOGIC;
    dccm_rdata_a_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dccm_rdata_b_i : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_v2_lmb_mux_0_0_lmb_mux : entity is "lmb_mux";
end design_v2_lmb_mux_0_0_lmb_mux;

architecture STRUCTURE of design_v2_lmb_mux_0_0_lmb_mux is
  signal raddr_d1r : STD_LOGIC_VECTOR ( 31 downto 7 );
  signal \raddr_d1r[31]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_o[31]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \rdata_o[31]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \rdata_o[31]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \rdata_o[31]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \rdata_o[31]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \rdata_o[31]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \rdata_o[31]_INST_0_i_7_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rdata_o[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rdata_o[10]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rdata_o[11]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rdata_o[12]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rdata_o[13]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rdata_o[14]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rdata_o[15]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rdata_o[16]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rdata_o[17]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rdata_o[18]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \rdata_o[19]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \rdata_o[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rdata_o[20]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \rdata_o[21]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \rdata_o[22]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rdata_o[23]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rdata_o[24]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \rdata_o[25]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \rdata_o[26]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rdata_o[27]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rdata_o[28]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \rdata_o[29]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \rdata_o[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \rdata_o[30]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \rdata_o[31]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \rdata_o[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \rdata_o[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rdata_o[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rdata_o[6]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rdata_o[7]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rdata_o[8]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rdata_o[9]_INST_0\ : label is "soft_lutpair4";
begin
\raddr_d1r[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn_i,
      O => \raddr_d1r[31]_i_1_n_0\
    );
\raddr_d1r_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(3),
      Q => raddr_d1r(10)
    );
\raddr_d1r_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(4),
      Q => raddr_d1r(11)
    );
\raddr_d1r_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(5),
      Q => raddr_d1r(12)
    );
\raddr_d1r_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(6),
      Q => raddr_d1r(13)
    );
\raddr_d1r_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(7),
      Q => raddr_d1r(14)
    );
\raddr_d1r_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(8),
      Q => raddr_d1r(15)
    );
\raddr_d1r_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(9),
      Q => raddr_d1r(16)
    );
\raddr_d1r_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(10),
      Q => raddr_d1r(17)
    );
\raddr_d1r_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(11),
      Q => raddr_d1r(18)
    );
\raddr_d1r_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(12),
      Q => raddr_d1r(19)
    );
\raddr_d1r_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(13),
      Q => raddr_d1r(20)
    );
\raddr_d1r_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(14),
      Q => raddr_d1r(21)
    );
\raddr_d1r_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(15),
      Q => raddr_d1r(22)
    );
\raddr_d1r_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(16),
      Q => raddr_d1r(23)
    );
\raddr_d1r_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(17),
      Q => raddr_d1r(24)
    );
\raddr_d1r_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(18),
      Q => raddr_d1r(25)
    );
\raddr_d1r_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(19),
      Q => raddr_d1r(26)
    );
\raddr_d1r_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(20),
      Q => raddr_d1r(27)
    );
\raddr_d1r_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(21),
      Q => raddr_d1r(28)
    );
\raddr_d1r_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(22),
      Q => raddr_d1r(29)
    );
\raddr_d1r_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(23),
      Q => raddr_d1r(30)
    );
\raddr_d1r_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(24),
      Q => raddr_d1r(31)
    );
\raddr_d1r_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(0),
      Q => raddr_d1r(7)
    );
\raddr_d1r_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(1),
      Q => raddr_d1r(8)
    );
\raddr_d1r_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => rd_en_i,
      CLR => \raddr_d1r[31]_i_1_n_0\,
      D => addr_i(2),
      Q => raddr_d1r(9)
    );
\rdata_o[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(0),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(0),
      O => rdata_o(0)
    );
\rdata_o[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(10),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(10),
      O => rdata_o(10)
    );
\rdata_o[11]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(11),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(11),
      O => rdata_o(11)
    );
\rdata_o[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(12),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(12),
      O => rdata_o(12)
    );
\rdata_o[13]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(13),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(13),
      O => rdata_o(13)
    );
\rdata_o[14]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(14),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(14),
      O => rdata_o(14)
    );
\rdata_o[15]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(15),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(15),
      O => rdata_o(15)
    );
\rdata_o[16]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(16),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(16),
      O => rdata_o(16)
    );
\rdata_o[17]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(17),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(17),
      O => rdata_o(17)
    );
\rdata_o[18]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(18),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(18),
      O => rdata_o(18)
    );
\rdata_o[19]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(19),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(19),
      O => rdata_o(19)
    );
\rdata_o[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(1),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(1),
      O => rdata_o(1)
    );
\rdata_o[20]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(20),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(20),
      O => rdata_o(20)
    );
\rdata_o[21]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(21),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(21),
      O => rdata_o(21)
    );
\rdata_o[22]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(22),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(22),
      O => rdata_o(22)
    );
\rdata_o[23]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(23),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(23),
      O => rdata_o(23)
    );
\rdata_o[24]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(24),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(24),
      O => rdata_o(24)
    );
\rdata_o[25]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(25),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(25),
      O => rdata_o(25)
    );
\rdata_o[26]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(26),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(26),
      O => rdata_o(26)
    );
\rdata_o[27]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(27),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(27),
      O => rdata_o(27)
    );
\rdata_o[28]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(28),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(28),
      O => rdata_o(28)
    );
\rdata_o[29]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(29),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(29),
      O => rdata_o(29)
    );
\rdata_o[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(2),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(2),
      O => rdata_o(2)
    );
\rdata_o[30]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(30),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(30),
      O => rdata_o(30)
    );
\rdata_o[31]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(31),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(31),
      O => rdata_o(31)
    );
\rdata_o[31]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \rdata_o[31]_INST_0_i_2_n_0\,
      I1 => \rdata_o[31]_INST_0_i_3_n_0\,
      I2 => \rdata_o[31]_INST_0_i_4_n_0\,
      I3 => \rdata_o[31]_INST_0_i_5_n_0\,
      I4 => \rdata_o[31]_INST_0_i_6_n_0\,
      I5 => \rdata_o[31]_INST_0_i_7_n_0\,
      O => \rdata_o[31]_INST_0_i_1_n_0\
    );
\rdata_o[31]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => raddr_d1r(23),
      I1 => raddr_d1r(22),
      I2 => raddr_d1r(25),
      I3 => raddr_d1r(24),
      O => \rdata_o[31]_INST_0_i_2_n_0\
    );
\rdata_o[31]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => raddr_d1r(27),
      I1 => raddr_d1r(26),
      I2 => raddr_d1r(29),
      I3 => raddr_d1r(28),
      O => \rdata_o[31]_INST_0_i_3_n_0\
    );
\rdata_o[31]_INST_0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => raddr_d1r(15),
      I1 => raddr_d1r(14),
      I2 => raddr_d1r(16),
      I3 => raddr_d1r(17),
      O => \rdata_o[31]_INST_0_i_4_n_0\
    );
\rdata_o[31]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => raddr_d1r(19),
      I1 => raddr_d1r(18),
      I2 => raddr_d1r(21),
      I3 => raddr_d1r(20),
      O => \rdata_o[31]_INST_0_i_5_n_0\
    );
\rdata_o[31]_INST_0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => raddr_d1r(11),
      I1 => raddr_d1r(10),
      I2 => raddr_d1r(13),
      I3 => raddr_d1r(12),
      O => \rdata_o[31]_INST_0_i_6_n_0\
    );
\rdata_o[31]_INST_0_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => raddr_d1r(7),
      I1 => raddr_d1r(30),
      I2 => raddr_d1r(31),
      I3 => raddr_d1r(9),
      I4 => raddr_d1r(8),
      O => \rdata_o[31]_INST_0_i_7_n_0\
    );
\rdata_o[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(3),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(3),
      O => rdata_o(3)
    );
\rdata_o[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(4),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(4),
      O => rdata_o(4)
    );
\rdata_o[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(5),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(5),
      O => rdata_o(5)
    );
\rdata_o[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(6),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(6),
      O => rdata_o(6)
    );
\rdata_o[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(7),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(7),
      O => rdata_o(7)
    );
\rdata_o[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(8),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(8),
      O => rdata_o(8)
    );
\rdata_o[9]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => dccm_rdata_a_i(9),
      I1 => \rdata_o[31]_INST_0_i_1_n_0\,
      I2 => dccm_rdata_b_i(9),
      O => rdata_o(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_v2_lmb_mux_0_0 is
  port (
    clk_i : in STD_LOGIC;
    resetn_i : in STD_LOGIC;
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
  attribute NotValidForBitStream of design_v2_lmb_mux_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_v2_lmb_mux_0_0 : entity is "design_v2_lmb_mux_0_0,lmb_mux,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_v2_lmb_mux_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_v2_lmb_mux_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_v2_lmb_mux_0_0 : entity is "lmb_mux,Vivado 2023.2";
end design_v2_lmb_mux_0_0;

architecture STRUCTURE of design_v2_lmb_mux_0_0 is
  signal \^addr_i\ : STD_LOGIC_VECTOR ( 31 downto 0 );
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
inst: entity work.design_v2_lmb_mux_0_0_lmb_mux
     port map (
      addr_i(24 downto 0) => \^addr_i\(31 downto 7),
      clk_i => clk_i,
      dccm_rdata_a_i(31 downto 0) => dccm_rdata_a_i(31 downto 0),
      dccm_rdata_b_i(31 downto 0) => dccm_rdata_b_i(31 downto 0),
      rd_en_i => \^rd_en_i\,
      rdata_o(31 downto 0) => rdata_o(31 downto 0),
      resetn_i => resetn_i
    );
end STRUCTURE;
