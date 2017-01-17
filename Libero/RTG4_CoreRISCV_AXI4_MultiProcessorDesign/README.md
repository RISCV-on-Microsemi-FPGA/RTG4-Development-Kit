### RTG4 CoreRISCV_AXI4 Multiprocessor Design

### Overview
    This Libero SoC design implements a RISC-V multi-processor design for a Microsemi RTG4 FPGA. It includes a UART, GPIOs and timers.

### IP packages
    This design includes a number of IP packages that are not available by default from the Libero catalog. 
    These packages are availalble from the [riscv-junk-drawer](https://github.com/RISCV-on-Microsemi-FPGA/riscv-junk-drawer/tree/master/IP-packages).

    USER_UserCore_MIRSLV2MIRMSTRBRIDGE_AHB_1.0.3.cpz is set up in this project as follows: 
    Master Drives upper 4 address bits  0
    Upper 4 address bits                8
    This allows the ControlRISCV to transfer data to DDR WEST through slot 6 on CoreAHBLite_1.

### Memory Map
### Control RISC-V
    DDR East            0x80000000
    DDR West            0x60000000
    CoreUARTapb_0       0x70001000
    CoreGPIO_IN         0x70002000
    CoreTimer_0         0x70003000
    CoreTimer_1         0x70004000
    CoreGPIO_OUT        0x70005000
    CoreSPI_0           0x70006000
    CoreGPIO_APP_RST    0x70007000
    
### Application RISC-V
    DDR West            0x80000000
    CoreUARTapb_1       0x70001000
    CoreGPIO_1          0x70002000
    CoreTimer_2         0x70003000
    CoreTimer_3         0x70004000
    CoreGPIO_0          0x70005000

### User IO
### Control RISC-V
    SW_DEBUG_MODE       Control signal used to allow software debugging. It will set up CoreBootStrap to bypass the copying of the executable memory from SPI into the processor memory.
    LEDs [8:5]          Debug LEDs.
    Switches [8:5]      Debug Switches.
    
### Application RISC-V
    APP_PROC_DEBUG      Control signal used to allow for individual processor debug. See How to debug the cores in SoftConsolev5.0 below. 
    LEDs [4:1]          Debug LEDs.
    Switches [4:1]      Debug Switches.
    
### How to debug the cores in SoftConsole V5.0

    In the Libero Project each RISCV has its own IDCode, 0x55 and 0x56 in this design.
    To debug the design ensure that SW_DEBUG_MODE is asserted. 
    Ensure  APP_PROC_DEBUG is asserted low when debugging the ControlRISCV and asserted high when debugging the ApplicationRISCV.
    To debug the ControlRISCV: Open SoftConsole V5.0. 
        Select Run - Debug Configurations - Select your project - Open the Debugger tab. 
        In the Configure options, add  -- command "set UJ_JTAG_IRCODE 0x55" before --file board/microsemi-riscv.cfg
    
    To debug the ApplicationRISCV: Open SoftConsole V5.0.
        Select Run - Debug Configurations - Select your project - Open the Debugger tab. 
        In the Configure options, add  -- command "set UJ_JTAG_IRCODE 0x56" before --file board/microsemi-riscv.cfg
        
    
### Feed-through RAM configuration work-around

    You will need to add a synthesis directive to Verilog source code to avoid synthesis inferring RAM blocks configured in feed-through mode.

    Regenerating the Libero project's top level SmartDesign will cause the CoreRISCV_AXI4 RTL to be regenerated from the Libero Catalog IP package. 
    This will overwrite synthesis directives that were added to one of the source files to prevent synthesis from infering the RAM blocks configured in feed-through mode.

    Open the following file: component->Actel->DirectCore->CORERISCV_AXI4-1.0.100->rtl->verilog->Top.v

    Modify lines 13111, 13124, 13137, 13150, 13163, 13176, 13189, 13202 as follows:
    
    reg [9:0] GEN_1 /* synthesis syn_keep=1 */;
    ...
    reg [9:0] GEN_6 /* synthesis syn_keep=1 */;
    ...
    reg [9:0] GEN_11 /* synthesis syn_keep=1 */;
    ...
    reg [9:0] GEN_16 /* synthesis syn_keep=1 */;
    ...
    reg [9:0] GEN_21 /* synthesis syn_keep=1 */;
    ...
    reg [9:0] GEN_26 /* synthesis syn_keep=1 */;
    ...
    reg [9:0] GEN_35 /* synthesis syn_keep=1 */;
    ...
    reg [9:0] GEN_44 /* synthesis syn_keep=1 */;
