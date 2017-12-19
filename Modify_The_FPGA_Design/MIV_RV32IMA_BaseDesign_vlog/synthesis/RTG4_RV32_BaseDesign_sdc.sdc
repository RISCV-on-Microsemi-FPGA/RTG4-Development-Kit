# Written by Synplify Pro version map201609actrcp1, Build 005R. Synopsys Run ID: sid1510786909 
# Top Level Design Parameters 

# Clocks 
create_clock -period 20.000 -waveform {0.000 10.000} -name {rcosc_50mhz} [get_pins {RCOSC_50MHZ_0:CLKOUT}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {COREJTAGDEBUG_UJ_JTAG_85_0_0|un1_DUT_TCK_inferred_clock} [get_pins {COREJTAGDEBUG_0/genblk4.UJ_JTAG/un1_DUT_TCK_0_0:Y}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {COREJTAGDEBUG_Z11|iUDRCK_inferred_clock} [get_pins {COREJTAGDEBUG_0/genblk1.UJTAG_inst:UDRCK}] 

# Virtual Clocks 

# Generated Clocks 
create_generated_clock -name {RTG4FCCC_0/GL0} -multiply_by {2} -divide_by {2} -source [get_pins {RCOSC_50MHZ_0:CLKOUT}]  [get_pins {RTG4FCCC_0/CCC_INST:GL0}] 
create_generated_clock -name {RTG4FCCC_0/GL1} -multiply_by {2} -divide_by {2} -source [get_pins {RCOSC_50MHZ_0:CLKOUT}]  [get_pins {RTG4FCCC_0/CCC_INST:GL1}] 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set_clock_groups -asynchronous -group [get_clocks {COREJTAGDEBUG_UJ_JTAG_85_0_0|un1_DUT_TCK_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {COREJTAGDEBUG_Z11|iUDRCK_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 

# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

