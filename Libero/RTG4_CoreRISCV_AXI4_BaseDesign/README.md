# RTG4 CoreRISCV_AXI4 Base Design

### Overview
This Libero SoC design implements a simple RISC-V microcontroller design for a Microsemi RTG4 Rad-Tolerant FPGA. It includes a UART, GPIOs and timers. The RISC-V code executes from one of the DDR memory controller. This design is intended as a software development platform.

### IP packages
This design includes a number of IP packages that are not available by default from the Libero catalog. These packages are availalble from the [riscv-junk-drawer](https://github.com/RISCV-on-Microsemi-FPGA/riscv-junk-drawer/tree/master/IP-packages).


### Feed-through RAM configuration work-around

You will need to add a synthesis directive to Verilog source code to avoid synthesis inferring RAM blocks configured in feed-through mode.

Regenerating the Libero project's top level SmartDesign will cause the CoreRISCV_AXI4 RTL to be regenerated from the Libero Catalog IP package. This will overwrite synthesis directives that were added to one of the source files to prevent synthesis from infering the RAM blocks configured in feed-through mode.

Open the following file: component->Actel->DirectCore->CORERISCV_AXI4-1.0.100->rtl->verilog->Top.v

Modify lines 13111, 13124, 13137, 13150, 13163, 13176, 13189, 13202 as follows:
```sh
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
```
