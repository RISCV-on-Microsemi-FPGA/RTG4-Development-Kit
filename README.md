##  RTG4 Development Kit RISC-V Sample Designs for Libero v12.1

Sample RISC-V Libero Projects for RTG4 the Radiation-Tolerant Dev Kit

To get your design download or clone this repository. The files consist of .tcl file that is the main script that builds the design and support files that are called by it to provide constraints and components for the design. Follow the instructions below to build your own design or alternatively use the pre-generated Programming Files in this repository.

**Note**: Unpack repository files to a file path not longer than 50 characters, as the project requires
a lengthy file path and some OS systems have limits. **Not providing
a sufficient file path for the project will result in errors**.

#### Follow these steps

- Launch Libero v12.1 on your computer. Wait for Libero to start. (Design will only work for Libero v12.1)
- Make sure you have __Downloaded the latest Libero Cores__. Select Catalog tab from the left hand side toolbar and click __"Download Latest Cores"__ option by a yellow marked area, this option will only be visible if you don't have the latest Cores.
- Press "CTRL+U" to display the "Execute Script" menu. Alternatively, click Project from the top left hand corner of Libero Suite and select "Execute Script" from there.
- Examine the image below, the purpose of the marked fields is listed.

 ![Execute_Script](images/libero_execute.PNG)

1. Click the "..." button and enter the directory in which the main .tcl file is that you have downloaded with your sample project. This file
is what Libero executes to build your design.
2. Click Run to execute the script and build the design. Wait for Libero to finish building, a window should appear once the script execution is finished.

###### Optional Step

3. Arguments field is optional and can be left blank. An argument can take the user further in Libero's design flow, examine the image below and try entering an argument in before clicking 'Run'. One of the following arguments can be entered:
      - Synthesize
      - Place_and_Route
      - Generate_Bitstream
      - Generate_Programming_File


![Script's_Arguments](images/libero_execute_optional.png)

#### Programming the Device using FPExpress

The projects contain Programming Files on the same level as the .tcl script. These programming files can be used to program your target device using the standalone installer for FlashPro Express which can be found [here](https://www.microsemi.com/product-directory/programming/4977-flashpro#software).
Please note that you only need to install this standalone version of FlashPro Express if you do not have Libero tools installed. The programming procedure is simple:
1. Launch FPExpress and wait for it to load.
2. Click into Project from the top left bar and select "New Job Project from FlashPro Express Job"
3. Navigate to your Job Programming File located inside your project folder beside your .tcl script.
4. For your directory, select the directory in which the Job file was located in and click OK.
5. On the next screen, from the bottom left drop-down menu select the PROGRAM option and clikc RUN. Wait for device to be programmed.


#### Notes

- Currently the designs support MiV_RV32IMA_L1_AHB Core only, Core MiV_RV32IMA_L1_AXI will be implemented in the next update
- The project is built in the same folder as the script.
- If you stop the execution of a the script halfway the project can get corrupted. If this happens, delete the project folder created by Libero and execute the script again, otherwise just try running the script again.
- The arguments serve the purpose to take the user further down the design flow, they use the most optimal settings for design build.
- Use the argument "Place_and_Route" or any argument after; The design will be built using an optimal place and route seed so, that the design's signal data path doesn't cause timing violations.
- If you don't feel like building a design to program the board, you can find the exported bitstream files in the project's folder.
- Only one argument can be entered and no spaces are allowed. The arguments are not case sensitive, if no argument is entered the sample design will be fully built to pre-synthesis stage.
