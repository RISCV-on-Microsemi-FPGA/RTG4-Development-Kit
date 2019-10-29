create_clock -name { TCK } \
-period 166.67 \
-waveform { 0 83.33 } \
[ get_ports { TCK } ]
set_false_path -from [ get_clocks { TCK } ] \
-to [ get_clocks { RTG4FCCC_0/GL0} ]
set_false_path -from [ get_clocks { RTG4FCCC_0/GL0} ] \
-to [ get_clocks { TCK } ]