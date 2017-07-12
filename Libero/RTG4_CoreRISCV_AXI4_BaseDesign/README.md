# RTG4 CoreRISCV_AXI4 Base Design

### Overview
This Libero SoC design implements a simple RISC-V microcontroller design for a Microsemi RTG4 Rad-Tolerant FPGA. It includes a UART, GPIOs, timers and SPI flash. The RISC-V code executes from one of the DDR memory controller.

### DIP switches
DIP switch 1 controls the system's boot sequence. When in the ON position, the application executable is copied from SPI flash into DDR memory by the CoreBootStrap IP block. DIP swicth 1 in the OFF position leaves the DDR memory content unmodified at boot up. Please put DIP switch 1 in the OFF position when actively debugging software in order to avoid CoreBootStrap interfering the executable downloaded by the debugger.

### Programming the SPI flash content
A simple bare metal bootloader is available from the SoftConsole example workspace availalbe from the GitHub SoftConsole page. This bootloader can be executed on the board using the SoftConsole debugger to transfer a binary from the host PC using the YModem file transfer protocol and writing this binary into the SPI flash.


### IP packages
This design includes a number of IP packages that are not available by default from the Libero catalog. These packages are availalble from the [riscv-junk-drawer](https://github.com/RISCV-on-Microsemi-FPGA/riscv-junk-drawer/tree/master/IP-packages).

