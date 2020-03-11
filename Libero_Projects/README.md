# RTG4 Development Kit Mi-V Sample FPGA Designs
This folder contains Tcl scripts that build Libero SoC (**v12.3**) design projects for the RTG4 Development Kit. These scripts are executed in Libero SoC to generate the sample designs.

## <a name="quick"></a> Instructions


#### Running Libero SoC in GUI mode
    1. Open Libero SoC
    2. Execute the script, Project -> Execute Script
    3. Select the directory that the script is located in using the "..."
    4. Select the script and select "Open"
    5. In the arguments text box, enter "AHB"
    6. Select the "Run" button to execute the script
    7. Once complete, a script report will be generated.

Libero executes the script and opens the Mi-V sample project. The script adds Timing constraints to the project for Synthesis, Place and Route, and Timing Verification. Additionally, IO Constraints are added to the project for Place and Route. The project can now be taken through the remainder of the Libero SoC design flow.

#### Running Libero SoC in GUI mode, with Script Arguments
    1. Open Libero SoC
    2. Execute the script, Project -> Execute Script
    3. Select the directory that the script is located in, using the "..."
    4. Select the script and select "Open"
    5. In the arguments text box, enter "AHB SYNTHESIS"
    6. Select the "Run" button to execute the script
    7. Once complete, a script report will be generated.

In this example, the arguments "AHB SYNTHESIS" are entered to take the project through to Synthesis.

Libero executes the script and opens the Mi-V sample project. The script adds Timing constraints to the project for Synthesis, Place and Route, and Timing Verification. Additionally, IO Constraints are added to the project for Place and Route. The project can now be taken through the remainder of the Libero SoC design flow.

## <a name="Script arguments"></a> Script Arguments
In the examples above the arguments "AHB" and "AHB SYNTHESIS" were entered. The complete set of script arguments are documented here.

First argument:
| Argument    |  Description   |
| ------------- |:-------------:|
| AHB      | Generate a sample design with the MiV_RV32IMA_L1_AHB |
| AXI      | Generate a sample design with the MiV_RV32IMA_L1_AXI |

Second argument:
| Argument    |  Description   |
| ------------- |:-------------:|
| SYNTHESIS | Run synthesis on the design  |
| PLACE_AND_ROUTE | Run place and route on the design  |
| GENERATE_BITSTREAM | Generate the bitstream for the design|
| EXPORT_PROGRAMMING_FILE | Export the programming file (.job) |

## Design Features
The Libero designs include the following features:
* A MIV_RV32IMA_L1_AHB or MIV_RV32IMA_L1_AXI soft RISC-V processor.
* RISC-V debug block allowing on-target debug using SoftConsole.
* The operating frequency of the design is 50MHz.
* Target memory is LSRAM.
* User peripherals (GPIO, Timers, UART).

The peripherals in this design are located at the following addresses.

| Peripheral    | Address   |
| ------------- |:-------------:|
| CoreUARTapb   | 0x7000_1000   |
| CoreGPIO_IN   | 0x7000_2000   |
| CoreTimer_0   | 0x7000_3000   |
| CoreTimer_1   | 0x7000_4000   |
| CoreGPIO_OUT  | 0x7000_5000   |
| LSRAM| 0x8000_0000|
