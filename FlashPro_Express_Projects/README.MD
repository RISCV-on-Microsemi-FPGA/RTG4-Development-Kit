# RTG4 Development Kit FPGA Programming Files

This folder contains FlashPro Express v12.6 projects for the RTG4 Development Kit Mi-V sample designs.

## FlashPro Express
The programming files contained under this folder were exported from the designs in the Libero_Projects folder in this repository. Select the desired programming file (.job) and program your device using FlashPro Express.

## Programming the Device using FlashPro Express
 Before running these steps, connect the FPGA board to the computer using FlashPro5 or Embedded FlashPro and power up the board.

    1. Open FlashPro Express
    2. Select Project -> New Job Project from FlashPro Express Job   
    3. Browse to the programming Job file (.job) using "Browse ...". The Job files are located
       in the FlashPro_Express_Project/Programming_Files directory
    4. Select the Job file, then select "Open"
    5. Select the FlashPro_Express_Project folder (or any folder of your choice) as the project
       location, then select "OK"
    6. The FlashPro Express Job Project is created
    7. Select the "RUN" button; the status bar will change from IDLE to the percentage complete
    8. Once complete the status bar will display "1 PROGRAMMER(S) PASSED"

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