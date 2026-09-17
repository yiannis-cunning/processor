-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Thu Sep 17 05:44:09 2026
-- Host        : DESKTOP-7L9HO1V running 64-bit Debian GNU/Linux 12 (bookworm)
-- Command     : write_vhdl -force -mode funcsim
--               /home/cunningy/Desktop/gits/processor/fpga/design/blocks/design_v2/ip/design_v2_bram_gpio_0_0/design_v2_bram_gpio_0_0_sim_netlist.vhdl
-- Design      : design_v2_bram_gpio_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_v2_bram_gpio_0_0_bram_gpio is
  port (
    bram_rdata_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clk_i : in STD_LOGIC;
    bram_wdata_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_byte_wr_en_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_en_i : in STD_LOGIC;
    bram_addr_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    resetn_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_v2_bram_gpio_0_0_bram_gpio : entity is "bram_gpio";
end design_v2_bram_gpio_0_0_bram_gpio;

architecture STRUCTURE of design_v2_bram_gpio_0_0_bram_gpio is
  signal \bram_rdata_o[31]_i_1_n_0\ : STD_LOGIC;
  signal \bram_rdata_o[31]_i_2_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 7 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[0]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[10]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[11]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[12]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[13]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[14]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[15]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[16]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[17]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[18]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[19]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[1]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[20]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[21]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[22]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[23]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[24]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[25]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[26]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[27]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[28]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[29]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[2]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[30]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[31]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[3]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[4]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[5]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[6]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[7]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[8]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of \bram_rdata_o_reg[9]\ : label is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
begin
\bram_rdata_o[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => bram_en_i,
      I1 => bram_addr_i(2),
      I2 => bram_addr_i(4),
      I3 => bram_addr_i(0),
      I4 => bram_addr_i(1),
      I5 => bram_addr_i(3),
      O => \bram_rdata_o[31]_i_1_n_0\
    );
\bram_rdata_o[31]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn_i,
      O => \bram_rdata_o[31]_i_2_n_0\
    );
\bram_rdata_o_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(0),
      Q => bram_rdata_o(0)
    );
\bram_rdata_o_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(10),
      Q => bram_rdata_o(10)
    );
\bram_rdata_o_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(11),
      Q => bram_rdata_o(11)
    );
\bram_rdata_o_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(12),
      Q => bram_rdata_o(12)
    );
\bram_rdata_o_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(13),
      Q => bram_rdata_o(13)
    );
\bram_rdata_o_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(14),
      Q => bram_rdata_o(14)
    );
\bram_rdata_o_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(15),
      Q => bram_rdata_o(15)
    );
\bram_rdata_o_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(16),
      Q => bram_rdata_o(16)
    );
\bram_rdata_o_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(17),
      Q => bram_rdata_o(17)
    );
\bram_rdata_o_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(18),
      Q => bram_rdata_o(18)
    );
\bram_rdata_o_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(19),
      Q => bram_rdata_o(19)
    );
\bram_rdata_o_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(1),
      Q => bram_rdata_o(1)
    );
\bram_rdata_o_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(20),
      Q => bram_rdata_o(20)
    );
\bram_rdata_o_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(21),
      Q => bram_rdata_o(21)
    );
\bram_rdata_o_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(22),
      Q => bram_rdata_o(22)
    );
\bram_rdata_o_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(23),
      Q => bram_rdata_o(23)
    );
\bram_rdata_o_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(24),
      Q => bram_rdata_o(24)
    );
\bram_rdata_o_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(25),
      Q => bram_rdata_o(25)
    );
\bram_rdata_o_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(26),
      Q => bram_rdata_o(26)
    );
\bram_rdata_o_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(27),
      Q => bram_rdata_o(27)
    );
\bram_rdata_o_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(28),
      Q => bram_rdata_o(28)
    );
\bram_rdata_o_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(29),
      Q => bram_rdata_o(29)
    );
\bram_rdata_o_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(2),
      Q => bram_rdata_o(2)
    );
\bram_rdata_o_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(30),
      Q => bram_rdata_o(30)
    );
\bram_rdata_o_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(31),
      Q => bram_rdata_o(31)
    );
\bram_rdata_o_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(3),
      Q => bram_rdata_o(3)
    );
\bram_rdata_o_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(4),
      Q => bram_rdata_o(4)
    );
\bram_rdata_o_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(5),
      Q => bram_rdata_o(5)
    );
\bram_rdata_o_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(6),
      Q => bram_rdata_o(6)
    );
\bram_rdata_o_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(7),
      Q => bram_rdata_o(7)
    );
\bram_rdata_o_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(8),
      Q => bram_rdata_o(8)
    );
\bram_rdata_o_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => \bram_rdata_o[31]_i_1_n_0\,
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => gpio_i(9),
      Q => bram_rdata_o(9)
    );
\gpio_o[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bram_rdata_o[31]_i_1_n_0\,
      I1 => bram_byte_wr_en_i(1),
      O => p_0_in(15)
    );
\gpio_o[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bram_rdata_o[31]_i_1_n_0\,
      I1 => bram_byte_wr_en_i(2),
      O => p_0_in(23)
    );
\gpio_o[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bram_rdata_o[31]_i_1_n_0\,
      I1 => bram_byte_wr_en_i(3),
      O => p_0_in(31)
    );
\gpio_o[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \bram_rdata_o[31]_i_1_n_0\,
      I1 => bram_byte_wr_en_i(0),
      O => p_0_in(7)
    );
\gpio_o_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(7),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(0),
      Q => gpio_o(0)
    );
\gpio_o_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(15),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(10),
      Q => gpio_o(10)
    );
\gpio_o_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(15),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(11),
      Q => gpio_o(11)
    );
\gpio_o_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(15),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(12),
      Q => gpio_o(12)
    );
\gpio_o_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(15),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(13),
      Q => gpio_o(13)
    );
\gpio_o_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(15),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(14),
      Q => gpio_o(14)
    );
\gpio_o_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(15),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(15),
      Q => gpio_o(15)
    );
\gpio_o_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(23),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(16),
      Q => gpio_o(16)
    );
\gpio_o_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(23),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(17),
      Q => gpio_o(17)
    );
\gpio_o_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(23),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(18),
      Q => gpio_o(18)
    );
\gpio_o_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(23),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(19),
      Q => gpio_o(19)
    );
\gpio_o_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(7),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(1),
      Q => gpio_o(1)
    );
\gpio_o_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(23),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(20),
      Q => gpio_o(20)
    );
\gpio_o_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(23),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(21),
      Q => gpio_o(21)
    );
\gpio_o_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(23),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(22),
      Q => gpio_o(22)
    );
\gpio_o_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(23),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(23),
      Q => gpio_o(23)
    );
\gpio_o_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(31),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(24),
      Q => gpio_o(24)
    );
\gpio_o_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(31),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(25),
      Q => gpio_o(25)
    );
\gpio_o_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(31),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(26),
      Q => gpio_o(26)
    );
\gpio_o_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(31),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(27),
      Q => gpio_o(27)
    );
\gpio_o_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(31),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(28),
      Q => gpio_o(28)
    );
\gpio_o_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(31),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(29),
      Q => gpio_o(29)
    );
\gpio_o_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(7),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(2),
      Q => gpio_o(2)
    );
\gpio_o_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(31),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(30),
      Q => gpio_o(30)
    );
\gpio_o_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(31),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(31),
      Q => gpio_o(31)
    );
\gpio_o_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(7),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(3),
      Q => gpio_o(3)
    );
\gpio_o_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(7),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(4),
      Q => gpio_o(4)
    );
\gpio_o_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(7),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(5),
      Q => gpio_o(5)
    );
\gpio_o_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(7),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(6),
      Q => gpio_o(6)
    );
\gpio_o_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(7),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(7),
      Q => gpio_o(7)
    );
\gpio_o_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(15),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(8),
      Q => gpio_o(8)
    );
\gpio_o_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => p_0_in(15),
      CLR => \bram_rdata_o[31]_i_2_n_0\,
      D => bram_wdata_i(9),
      Q => gpio_o(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_v2_bram_gpio_0_0 is
  port (
    clk_i : in STD_LOGIC;
    resetn_i : in STD_LOGIC;
    bram_en_i : in STD_LOGIC;
    bram_rdata_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_wdata_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_byte_wr_en_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_addr_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    bram_clk_i : in STD_LOGIC;
    gpio_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_o : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_v2_bram_gpio_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_v2_bram_gpio_0_0 : entity is "design_v2_bram_gpio_0_0,bram_gpio,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_v2_bram_gpio_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_v2_bram_gpio_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_v2_bram_gpio_0_0 : entity is "bram_gpio,Vivado 2023.2";
end design_v2_bram_gpio_0_0;

architecture STRUCTURE of design_v2_bram_gpio_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of bram_clk_i : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of bram_clk_i : signal is "XIL_INTERFACENAME BRAM_PORT_A, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute X_INTERFACE_INFO of bram_en_i : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A EN";
  attribute X_INTERFACE_INFO of bram_addr_i : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A ADDR";
  attribute X_INTERFACE_INFO of bram_byte_wr_en_i : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A WE";
  attribute X_INTERFACE_INFO of bram_rdata_o : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT";
  attribute X_INTERFACE_INFO of bram_wdata_i : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT_A DIN";
begin
inst: entity work.design_v2_bram_gpio_0_0_bram_gpio
     port map (
      bram_addr_i(4 downto 0) => bram_addr_i(4 downto 0),
      bram_byte_wr_en_i(3 downto 0) => bram_byte_wr_en_i(3 downto 0),
      bram_en_i => bram_en_i,
      bram_rdata_o(31 downto 0) => bram_rdata_o(31 downto 0),
      bram_wdata_i(31 downto 0) => bram_wdata_i(31 downto 0),
      clk_i => clk_i,
      gpio_i(31 downto 0) => gpio_i(31 downto 0),
      gpio_o(31 downto 0) => gpio_o(31 downto 0),
      resetn_i => resetn_i
    );
end STRUCTURE;
