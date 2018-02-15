
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name GeneradorTurnos -dir "C:/Users/juanz/Google Drive/Semestre 6/Laboratorio Electronica Digital/ProyectoTurnero/GeneradorTurnos/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "GeneradorTurnos.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Transmission_8bits.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Reception_8bits.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Multiplexor.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Divisor_Frecuencia.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Decodificador.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Traductor8bitsTo4bits.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {SieteSegmentos.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {RS232.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Antirrebote.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {GeneradorTurnos.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top GeneradorTurnos $srcset
add_files [list {GeneradorTurnos.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
