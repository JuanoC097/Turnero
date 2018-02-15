
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Turnero -dir "C:/Users/juanz/Google Drive/Semestre 6/Laboratorio Electronica Digital/ProyectoTurnero/Turnero/planAhead_run_2" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/juanz/Google Drive/Semestre 6/Laboratorio Electronica Digital/ProyectoTurnero/Turnero/Turnero.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/juanz/Google Drive/Semestre 6/Laboratorio Electronica Digital/ProyectoTurnero/Turnero} }
set_property target_constrs_file "Turnero.ucf" [current_fileset -constrset]
add_files [list {Turnero.ucf}] -fileset [get_property constrset [current_run]]
link_design
