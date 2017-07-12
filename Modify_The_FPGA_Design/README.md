# RTG4 Development Kit RISC-V Sample FPGA Designs 
Sample RISC-V Libero projects for the RTG4 (RT4G150) Development Kit.

This project contains Libero projects containing FPGA designs including a RISC-V RV32IM soft processor. Programming bitstreams are also included so you don't have to run through the full FPGA design flow in order to start developing software for RISC-V.

### Design Feature
The FPGA Designs include the following features
* CoreRISCV_AXI4 RV32IM RISC-V processor 
* RISC-V debug block allowing on-target debug using openocd/GDB
* DDR3 memory for code/data
* User peripherals such as GPIO, Timers, UART

The memory map for each design is available within each Libero project.

### Target Hardware
Details of the features available for this development board are available [here](https://www.microsemi.com/products/fpga-soc/design-resources/dev-kits/rtg4-development-kit).

### Libero Projects
This folder contains CoreRISCV_AXI4 Libero V11.8 projects.

* RTG4_CoreRISCV_AXI4_BaseDesign, contains a simple RISCV design which allows users to use basic peripherals such as GPIO, UART and Timers. 
* RTG4_CoreRISCV_AXI4_MultiProcessorDesign, implements a RISC-V multi-processor design It includes a UART, GPIOs and timers.


### Modifying the Libero projects
Some of the Libero projects use IP packages not directly available from the Microsemi IP Catalog. These IP packages were created to speed up design creation by wrapping simple logic into reusable user IP packages.
These user IP packages are available [here](https://github.com/RISCV-on-Microsemi-FPGA/riscv-junk-drawer/tree/master/IP-packages).

Please note that you may need to uncomment "`define USE_REGISTERS" in file coreriscv_axi4_defines.v in order to reduce RAM blocks usage. You will need to do this anytime you regenerate the top level SmartDesign in Libero.
