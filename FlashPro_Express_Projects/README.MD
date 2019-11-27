## RTG4 Development Kit RISC-V Designs FlashPro Express Programming Files (Libero v12.1)

Sample Mi-V FlashPro Express files for RTG4 the Radiation-Tolerant Dev Kit

### FlashPro Express
The programming files contained here are exported from Libero projects and their configurations found in this repository. Select the desired programming .job file and program your device using the standalone installer for FlashPro Express which can be found [here](https://www.microsemi.com/product-directory/programming/4977-flashpro#software).

### Programming the Device using FPExpress
---------------------------------------------
1. Download or Clone this repository to get the contents of FlashPro_Express_Projects.
2. Power-up your board and connect it to your programming device running FlashPro Express.
3. Launch FPExpress v12.1 and wait for it to load.
4. Click into Project from the top left bar and select "New Job Project from FlashPro Express Job"
5. For "Programming job file:" navigate to your FlashPro_Express_Project/Programming_Files directory and select the (.job) programming file you want to program your board with.
6. For "FlashPro Express job project location:" select the FlashPro_Express_Projects folder you have downloaded with this project.
8. Click OK, wait for the new window to pop-up.
7. From the bottom left drop-down menu select the PROGRAM option if it's not selected by default and click RUN. Wait for device to be programmed.

### Target Hardware
Details on the RTG4 Development kit and it's features can be found:
* RTG4-DEV-KIT [here](https://www.microsemi.com/product-directory/dev-kits-solutions/3865-rtg4-kits)

### Target Mi-V CPU
Details of the features of Mi-V CPUs are available [here](https://github.com/RISCV-on-Microsemi-FPGA/CPUs).