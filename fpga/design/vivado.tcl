


# TCL script to make the vivado workspace.
# Will need: 
#           - Git repo root folder
#           - Project output folder 
# How to use:
#     setenvs ...
#     vivado -tcl <this script>
#     then just open the .prj file.
#
# Script is modeled off vivado auto-generated scripts.

set project_name test_project
set project_dir test_project_dir

set block_design_name bd_core
set block_design_dir ./

set ws_root $env(ROOT)



################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2023.2
set current_vivado_version [version -short]


if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing t
he script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run t
he script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create a
n updated script."}

   }

   return 1
}



create_project $project_name $project_dir -part xc7a200tfbg484-2
create_bd_design -dir $block_design_dir $block_design_name
current_bd_design $block_design_name




# Add design sources

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -srcset constrs_1
}

#-quiet
add_files -norecurse -fileset sources_1 ${ws_root}/cpu/design/rtl/ 
add_files -norecurse -fileset sources_1 ${ws_root}/fpga/design/rtl/
add_files -norecurse -fileset sources_1 ${ws_root}/fpga/design/constraints/
add_files -norecurse -fileset sources_1 ${ws_root}/fpga/design/fw/dccm.hex
add_files -norecurse -fileset sources_1 ${ws_root}/fpga/design/fw/iccm.hex
add_files -fileset constrs_1 -norecurse ${ws_root}/fpga/design/constraints/cpu.xdc


proc create_root_design { parentCell } {

  current_bd_instance [get_bd_cells /]

  # Create ports
  set resetn_i [ create_bd_port -dir I resetn_i ]
  set clk_i [ create_bd_port -dir I clk_i ]
  set run_req_i [ create_bd_port -dir I run_req_i ]
  set gpio_i [ create_bd_port -dir I -from 31 -to 0 gpio_i ]
  set gpio_o [ create_bd_port -dir O -from 31 -to 0 gpio_o ]


  # Create instance: cpu_top_0, and set properties
  set block_name cpu_top
  set block_cell_name cpu_top_0
  if { [catch {set cpu_top_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $cpu_top_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }

  # Create instance: bram_controller_0, and set properties
  set block_name bram_controller
  set block_cell_name bram_controller_0
  if { [catch {set bram_controller_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bram_controller_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property CONFIG.WORD_ADDR_W {13} $bram_controller_0


  # Create instance: bram_prim_0, and set properties
  set block_name bram_prim
  set block_cell_name bram_prim_0
  if { [catch {set bram_prim_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bram_prim_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.ADDR_WIDTH {13} \
    CONFIG.MEM_INIT_FILENAME {iccm.hex} \
  ] $bram_prim_0


  # Create instance: lmb_mux_0, and set properties
  set block_name lmb_mux
  set block_cell_name lmb_mux_0
  if { [catch {set lmb_mux_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $lmb_mux_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.PORTA_ADDR_BASE {36864} \
    CONFIG.PORTA_ADDR_HIGH {69632} \
    CONFIG.PORTB_ADDR_BASE {73728} \
    CONFIG.PORTB_ADDR_HIGH {73856} \
  ] $lmb_mux_0



  # Create instance: bram_prim_1, and set properties
  set block_name bram_prim
  set block_cell_name bram_prim_1
  if { [catch {set bram_prim_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bram_prim_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.ADDR_WIDTH {13} \
    CONFIG.MEM_INIT_FILENAME {dccm.hex} \
  ] $bram_prim_1


  # Create instance: bram_controller_1, and set properties
  set block_name bram_controller
  set block_cell_name bram_controller_1
  if { [catch {set bram_controller_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bram_controller_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.BASE_ADDR {36864} \
    CONFIG.WORD_ADDR_W {13} \
  ] $bram_controller_1


  # Create instance: bram_controller_2, and set properties
  set block_name bram_controller
  set block_cell_name bram_controller_2
  if { [catch {set bram_controller_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bram_controller_2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.BASE_ADDR {73728} \
    CONFIG.WORD_ADDR_W {5} \
  ] $bram_controller_2

  # Create instance: bram_gpio_0, and set properties
  set block_name bram_gpio
  set block_cell_name bram_gpio_0
  if { [catch {set bram_gpio_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bram_gpio_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }


  # Create interface connections
  connect_bd_intf_net -intf_net bram_controller_0_BRAM_PORT_A [get_bd_intf_pins bram_controller_0/BRAM_PORT_A] [get_bd_intf_pins bram_prim_0/BRAM_PORT_A]
  connect_bd_intf_net -intf_net bram_controller_1_BRAM_PORT_A [get_bd_intf_pins bram_controller_1/BRAM_PORT_A] [get_bd_intf_pins bram_prim_1/BRAM_PORT_A]
  connect_bd_intf_net -intf_net bram_controller_2_BRAM_PORT_A [get_bd_intf_pins bram_gpio_0/BRAM_PORT_A] [get_bd_intf_pins bram_controller_2/BRAM_PORT_A]
  connect_bd_intf_net -intf_net cpu_top_0_DCCM_LMB_M [get_bd_intf_pins lmb_mux_0/S_LMB_PORT] [get_bd_intf_pins cpu_top_0/DCCM_LMB_M]
  connect_bd_intf_net -intf_net cpu_top_0_ICCM_LMB_M [get_bd_intf_pins cpu_top_0/ICCM_LMB_M] [get_bd_intf_pins bram_controller_0/S_LMB_PORT]
  connect_bd_intf_net -intf_net lmb_mux_0_M_LMB_PORT_A [get_bd_intf_pins bram_controller_1/S_LMB_PORT] [get_bd_intf_pins lmb_mux_0/M_LMB_PORT_A]
  connect_bd_intf_net -intf_net lmb_mux_0_M_LMB_PORT_B [get_bd_intf_pins bram_controller_2/S_LMB_PORT] [get_bd_intf_pins lmb_mux_0/M_LMB_PORT_B]

  # Create port connections
  connect_bd_net -net bram_gpio_0_gpio_o [get_bd_pins bram_gpio_0/gpio_o] [get_bd_ports gpio_o]
  connect_bd_net -net clk_i_0_1 [get_bd_ports clk_i] [get_bd_pins cpu_top_0/clk_i] [get_bd_pins bram_gpio_0/clk_i] [get_bd_pins bram_controller_0/clk_i] [get_bd_pins bram_controller_1/clk_i] [get_bd_pins bram_controller_2/clk_i] [get_bd_pins lmb_mux_0/clk_i]
  connect_bd_net -net gpio_i_0_1 [get_bd_ports gpio_i] [get_bd_pins bram_gpio_0/gpio_i]
  connect_bd_net -net resetn_i_0_1 [get_bd_ports resetn_i] [get_bd_pins cpu_top_0/resetn_i] [get_bd_pins bram_gpio_0/resetn_i] [get_bd_pins bram_controller_0/resetn_i] [get_bd_pins bram_controller_1/resetn_i] [get_bd_pins bram_controller_2/resetn_i] [get_bd_pins lmb_mux_0/resetn_i]
  connect_bd_net -net run_req_i_0_1 [get_bd_ports run_req_i] [get_bd_pins cpu_top_0/run_req_i]

  validate_bd_design
  save_bd_design
  # make_wrapper -files [get_files C:/Users/yiann/Desktop/gits/processor/vivado_prj/bd_core/bd_core.bd] -top
}

create_root_design ""