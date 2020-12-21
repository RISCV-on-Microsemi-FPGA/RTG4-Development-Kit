# RTG4 Development Kit Mi-V Sample FPGA Designs
This folder contains Tcl scripts that build Libero SoC v12.6 design projects for the RTG4 Development Kit. These scripts are executed in Libero SoC to generate the sample designs. All cores boot from memory at 0x8000_0000.

#### RTG4_Dev_Kit_MiV_RV32IMA_BaseDesign

| Config  | Description |
| :------:|:------------|
| CFG1    |This design uses the MiV_RV32IMA_L1_AHB core with an **AHB** interface for memory and peripherals|
| CFG2    |This design uses the MiV_RV32IMA_L1_AXI core with an **AXI3** interface for memory and peripherals|


#### RTG4_Dev_Kit_MiV_RV32IMAF_BaseDesign

| Config  |Description |
| :------:|:-----------|
| CFG1    |  This design uses the MiV_RV32IMAF_L1_AHB core with an **AHB** interface for memory and peripherals|


#### RTG4_Dev_Kit_MiV_RV32_BaseDesign


| Config  | Description|
| :------:|:----------------------------------------|
| CFG1    | This design uses the MiV_RV32 core configured as follows: <ul><li>RISC-V Extensions: IMC</li><li>Multiplier: MACC (Pipelined)</li><li>Interfaces: AHB Master (mirrored), APB3 Master</li><li>Internal IRQs: 6</li><li>TCM: Enabled</li><li>System Timer: Internal MTIME enabled, Internal MTIME IRQ enabled</li><li>Debug: enabled</li></ul>|
| CFG2    | **Not available in this release**<ul> *This design uses the MiV_RV32 core configured as follows: <ul><li>RISC-V Extensions: IM</li><li>Multiplier: Fabric</li><li>Interfaces: AXI4 Master (mirrored), APB3 Master</li><li>Internal IRQs: 6</li><li>TCM: Disabled</li><li>System Timer: Internal MTIME enabled, Internal MTIME IRQ enabled</li><li>Debug: enabled* </li></ul>|
| CFG3    | This design uses the MiV_RV32 core configured as follows: <ul><li>RISC-V Extensions: I</li><li>Multiplier: none</li><li>Interfaces: APB3 Master</li><li>Internal IRQs: 6</li><li>TCM: Enabled</li><li>System Timer: Internal MTIME enabled, Internal MTIME IRQ enabled</li><li>Debug: enabled</li></ul>|


## <a name="quick"></a> Instructions

#### Running Libero SoC in GUI mode
    1. Open Libero SoC
    2. Execute the script, Project -> Execute Script
    3. Select the directory that the script is located in using the "..."
    4. Select the script and select "Open"
    5. In the arguments text box, enter the type of configuration you want e.g. "CFG1"
    6. Select the "Run" button to execute the script
    7. Once complete, a script report will be generated.

Libero executes the script and opens the Mi-V sample project. The script adds Timing constraints to the project for Synthesis, Place and Route, and Timing Verification. Additionally, IO Constraints are added to the project for Place and Route. The project can now be taken through the remainder of the Libero SoC design flow.

#### Running Libero SoC in GUI mode, with Script Arguments
    1. Open Libero SoC
    2. Execute the selected script, Project -> Execute Script
    3. Select the directory that the script is located in, using the "..."
    4. Select the script and select "Open"
    5. In the arguments text box, enter "CFG1 SYNTHESIZE"
    6. Select the "Run" button to execute the script
    7. Once complete, a script report will be generated.

In this example, the arguments "CFG1 SYNTHESIZE" are entered to take the project through to Synthesis.

Libero executes the script and opens the Mi-V sample project. The script adds Timing constraints to the project for Synthesis, Place and Route, and Timing Verification. Additionally, IO Constraints are added to the project for Place and Route. The project can now be taken through the remainder of the Libero SoC design flow.

## <a name="Script arguments"></a> Script Arguments
In the examples above the arguments "CFG1" and "CFG1 SYNTHESIZE" were entered. The complete set of script arguments are documented here.

#### First argument:
| Argument                  |  Description   |
| ------------------------- |:---------------|
| CFG1..CFGn                | Generate a sample design for the selected configuration  |


#### Second argument:
| Argument                  |  Description   |
| ------------------------- |:---------------|
| SYNTHESIZE                | Run synthesis on the design  |
| PLACE_AND_ROUTE           | Run place and route on the design  |
| GENERATE_BITSTREAM        | Generate the bitstream for the design|
| EXPORT_PROGRAMMING_FILE   | Export the programming file (.job) |

## Design Features
The Libero designs include the following features:
* A soft RISC-V [processor](https://github.com/RISCV-on-Microsemi-FPGA/CPUs)
* A RISC-V debug block allowing on-target debug using SoftConsole
* The operating frequency of the design is 50MHz
* Target memory is SRAM (32kB)
* User peripherals: 2 Timers, UART, 2 GPIO Inputs and 4 GPIO Outputs (GPIOs use fixed configs for simplicity and better resource utilization)

The peripherals in this design are located at the following addresses.

| Peripheral    | Address   |
| ------------- |:-------------:|
| CoreUARTapb   | 0x7000_1000   |
| CoreGPIO_IN   | 0x7000_2000   |
| CoreTimer_0   | 0x7000_3000   |
| CoreTimer_1   | 0x7000_4000   |
| CoreGPIO_OUT  | 0x7000_5000   |
| SRAM| 0x8000_0000|

