# RTG4 Development Kit FPGA Programming Files

This folder contains FlashPro Express **(v12.3)** projects for the RTG4 Development Kit Mi-V sample designs.

## FlashPro Express
The programming files contained under this folder were exported from the designs in the Libero_Projects folder in this repository. Select the desired programming .job file and program your device using FlashPro Express.

## Programming the Device using FlashPro Express
 Before running these steps, connect the FPGA board to the computer using FlashPro5 or Embedded FlashPro and power up the board.

    1. Open FlashPro Express
    2. Select Project -> New Job Project from FlashPro Express Job   
    3. Browse to the Job file using, "Browse ...". The Job files are located
       in the FlashPro_Express_Project/Programming_Files directory
    4. Select the Job file, then select "Open"
    5. Select the FlashPro_Express_Project/Programming_Files as the project location, then select "OK"
    6. The FlashPro Express Job Project is created
    7. Select the "RUN" button, status bar will change from IDLE to the percentage complete
    8. Once complete the status bar will display "1 PROGRAMMER(S) PASSED"

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
