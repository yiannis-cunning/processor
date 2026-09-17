
################################################################
# This is a generated script based on design: design_v2
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2023.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_v2_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# cpu_top, bram_controller, bram_prim, lmb_mux, bram_prim, bram_controller, bram_controller, bram_gpio

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a200tfbg484-2
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_v2

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir ./Desktop/gits/processor/fpga/design/blocks

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2030 -severity "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_gid_msg -ssname BD::TCL -id 2031 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_gid_msg -ssname BD::TCL -id 2032 -severity "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2033 -severity "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2034 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files -quiet */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2035 -severity "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_gid_msg -ssname BD::TCL -id 2036 -severity "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2037 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_gid_msg -ssname BD::TCL -id 2038 -severity "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

set bCheckIPsPassed 1
##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
cpu_top\
bram_controller\
bram_prim\
lmb_mux\
bram_prim\
bram_controller\
bram_controller\
bram_gpio\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

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

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


