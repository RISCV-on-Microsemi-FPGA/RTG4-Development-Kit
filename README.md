## PolarFire Evaluation Kit RISC-V Designs

Sample RISC-V Libero Projects for RTG4 the Radiation-Tolerant Dev Kit

This repository containts Libero projects containing an FPGA design including a RISC-V soft processor, the projects are .tcl scripts that are executed in Libero to build whole designs. By passing arguments with the script, the user can decide on type of the MiV Core used (AXI or AHB) and how far in the design flow they want to be taken, using the most optimal settings.
The Programming bitstream(s) are also included so that you do not need to run through the full FPGA design flow in order to start developing software for RISC-V.

### Libero
--------------------
The Libero_Projects folder contains the .tcl scripts that build the Libero design projects. Libero is Microsemi's FPGA design tool. You will need this tool if you wish to modify the sample Libero FPGA designs. Libero is available 
[here](https://www.microsemi.com/products/fpga-soc/design-resources/design-software/libero-soc#downloads).

#### Design Features
The FPGA designs include the following features:
* Uses MIV_RV32IMA_L1_AHB or MIV_RV32IMA_L1_AXI soft processor
* RISC-V debug block allowing on-target debug using openocd/GDB
* DDR for code/data
* User peripherals such as GPIO, Timers, UART
* Designs created with Libero v12.1

#### Projects
A choice of two Libero projects, each containing either MiV Core:

* MiV_RV32IMA_L1_AHB
* MiV_RV32IMA_L1_AXI

Both of the designs allow software debugging using FlashPro5. The same JTAG port is used for programming the FPGA and debugging RISC-V software. Selection of MIV_RV32IMA_L1_AHB and MiV_RV32IMA_L1_AXI soft processors.

### FlashPro Express Projects
---------------------
The FlashPro_Express_Projects folder includes the FlashPro Express programming files that can be used to program the development board's FPGA. A standalone installer for FlashPro Express is available [here](http://www.microsemi.com/products/fpga-soc/design-resources/programming/flashpro#software). 
Please note that you only need to install this standalone version of FlashPro Express if you don't have Libero tools installed. FlashPro Express has to match the version of Libero, the programming files were generated in.

### SoftConsole Projects
A set of RISC-V example software projects are also available for these designs from the SoftConsole [page](https://github.com/RISCV-on-Microsemi-FPGA/SoftConsole).

### Target Hardware
Details on the RTG4 Development kit and it's features can be found:
* RTG4-DEV-KIT [here](https://www.microsemi.com/product-directory/dev-kits-solutions/3865-rtg4-kits)

### Target Mi-V CPU
Details of the features of Mi-V CPUs are available [here](https://github.com/RISCV-on-Microsemi-FPGA/CPUs).

