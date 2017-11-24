open_project -project {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM_fp\PROC_SUBSYSTEM.pro}\
         -connect_programmers {FALSE}
if { [catch {load_programming_data \
    -name {RT4G150} \
    -fpga {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.map} \
    -header {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.hdr} } return_val] } {
save_project
close_project
exit }
export_single_stapl \
    -name {RT4G150} \
    -file {C:\Users\ciaran.lappin\Desktop\MiV_Github\RTG4\MIV_RV32IMA_BaseDesign_vlog\designer\PROC_SUBSYSTEM\export\PROC_SUBSYSTEM_RV32IMA_BaseDesign_RT4G150.stp} \
    -secured
set_programming_file -name {RT4G150} -no_file
save_project
close_project
