// ********************************************************************/ 
// Copyright 2008 Actel Corporation.  All rights reserved.
// IP Engineering 
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// File:  testsupport.v
//     
// Description: APB State Machine
//              Support routines for testbench  
//
// Rev: 2.4   24Jan08 IPB  : Production Release   
//
// SVN Revision Information:
// SVN $Revision: 379 $
// SVN $Date: 2008-01-24 11:38:38 +0000 (Thu, 24 Jan 2008) $  
//   
//
// Notes:
//
// *********************************************************************/ 

    function integer log2;
        input x; 
        integer x;

        begin
            case (x)
                1 :
                            begin
                                log2 = 0; 
                            end
                2 :
                            begin
                                log2 = 1; 
                            end
                4 :
                            begin
                                log2 = 2; 
                            end
                8 :
                            begin
                                log2 = 3; 
                            end
                16 :
                            begin
                                log2 = 4; 
                            end
                32 :
                            begin
                                log2 = 5; 
                            end
                64 :
                            begin
                                log2 = 6; 
                            end
                128 :
                            begin
                                log2 = 7; 
                            end
                256 :
                            begin
                                log2 = 8; 
                            end
                512 :
                            begin
                                log2 = 9; 
                            end
                default :
                            begin
                                log2 = -1; 
                            end
            endcase 
        end
    endfunction

    function integer log2z;
        input x; 
        integer x;

        begin
            case (x)
                1 :
                            begin
                                log2z = 1; 
                            end
                2 :
                            begin
                                log2z = 1; 
                            end
                4 :
                            begin
                                log2z = 2; 
                            end
                8 :
                            begin
                                log2z = 3; 
                            end
                16 :
                            begin
                                log2z = 4; 
                            end
                32 :
                            begin
                                log2z = 5; 
                            end
                64 :
                            begin
                                log2z = 6; 
                            end
                128 :
                            begin
                                log2z = 7; 
                            end
                256 :
                            begin
                                log2z = 8; 
                            end
                default :
                            begin
                                log2z = -1; 
                            end
            endcase 
        end
    endfunction

    function integer set_generic;
        input TN; 
        integer TN;
        input X; 
        integer X;
        input Y; 
        integer Y;

        begin
            if (TN == 0)
            begin
                set_generic = X; 
            end
            else
            begin
                set_generic = Y; 
            end 
        end
    endfunction

    function integer override;
        input X; 
        integer X;
        input Y; 
        integer Y;

        begin
            if (X == -1)
            begin
                override = Y; 
            end
            else
            begin
                override = X; 
            end 
        end
    endfunction

    function integer overrideP;
        input X; 
        integer X;
        input Y; 
        integer Y;

        begin
            case (X)
                1 :
                            begin
                                overrideP = 0; 
                            end
                2 :
                            begin
                                overrideP = 0; 
                            end
                3 :
                            begin
                                overrideP = 1; 
                            end
                4 :
                            begin
                                overrideP = 1; 
                            end
                5 :	        begin
                                overrideP = 2; 
                            end
         default :
                            begin
                                overrideP = Y; 
                            end
            endcase 
        end
    endfunction

    // This function creates the core configuration based on the testmode
    // NOTES
    //  Builds 0-6 match the Synthesis 
   
    function [349:0] APBsetup;
        input TN; 
        integer TN;
        input FAMILY; 
        integer FAMILY;
        input INSMODE; 
        integer INSMODE;

        reg[19:0] setup_ISRADDR; 
        reg[9:0]  setup_ID; 
        reg[9:0]  setup_FAMILY; 
        reg[9:0]  setup_APB_AWIDTH; 
        reg[9:0]  setup_APB_DWIDTH; 
        reg[9:0]  setup_APB_SDEPTH; 
        reg[9:0]  setup_ICWIDTH; 
        reg[9:0]  setup_ZRWIDTH; 
        reg[9:0]  setup_IIWIDTH; 
        reg[9:0]  setup_IFWIDTH; 
        reg[9:0]  setup_IOWIDTH; 
        reg[9:0]  setup_STWIDTH; 
        reg[9:0]  setup_EN_RAM; 
        reg[9:0]  setup_EN_AND; 
        reg[9:0]  setup_EN_XOR; 
        reg[9:0]  setup_EN_OR; 
        reg[9:0]  setup_EN_ADD; 
        reg[9:0]  setup_EN_INC; 
        reg[9:0]  setup_EN_SHL; 
        reg[9:0]  setup_EN_SHR; 
        reg[9:0]  setup_EN_CALL; 
        reg[9:0]  setup_EN_PUSH; 
        reg[9:0]  setup_EN_ACM; 
        reg[9:0]  setup_EN_DATAM; 
        reg[9:0]  setup_EN_DATAA; 
        reg[9:0]  setup_EN_INT; 
        reg[9:0]  setup_EN_IOREAD; 
        reg[9:0]  setup_EN_IOWRT; 
        reg[9:0]  setup_EN_ALURAM; 
        reg[9:0]  setup_DEBUG; 
        reg[9:0]  setup_INSMODE; 
        reg[9:0]  setup_INITWIDTH; 
        reg[9:0]  setup_TESTMODE; 
        reg[9:0]  setup_EN_MULT; 
        reg[9:0]  setup_EN_INDIRECT; 

        begin
            setup_FAMILY = FAMILY; 
            setup_TESTMODE = TN; 
            setup_INSMODE = INSMODE; 
            setup_INITWIDTH = 8; 
            setup_ID = 0; 
            setup_DEBUG = 1; 
            // Default Settings
            setup_ZRWIDTH    = 8; 
            setup_IIWIDTH    = 8; 
            setup_IFWIDTH    = 4; 
            setup_IOWIDTH    = 8; 
            setup_EN_CALL    = 1; 
            setup_EN_INC     = 1; 
            setup_EN_ADD     = 1; 
            setup_EN_AND     = 1; 
            setup_EN_OR      = 1; 
            setup_EN_XOR     = 1; 
            setup_EN_SHL     = 1; 
            setup_EN_SHR     = 1; 
            setup_EN_DATAM   = 2;
            setup_EN_RAM     = 1;
            setup_EN_ACM     = 1;
            setup_ICWIDTH    = 8;
            setup_STWIDTH    = 4;  
            setup_EN_PUSH    = 1;
            setup_INITWIDTH  = 16;
            setup_EN_INT     = 0;
            setup_ISRADDR    = 0;
            setup_EN_IOREAD  = 0;
            setup_EN_IOWRT   = 1;
            setup_EN_ALURAM  = 0;
            setup_EN_MULT    = 0;
			setup_EN_INDIRECT = 0;

            case (TN)
                0 :
                            begin
                                // Example for controlling CoreAI 
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 16; 
                                setup_APB_SDEPTH = 1; 
                                setup_ICWIDTH = 5; 
                                setup_ZRWIDTH = 0; 
                                setup_IIWIDTH = 16; 
                                setup_IOWIDTH = 2; 
                                setup_STWIDTH = 1; 
                                setup_EN_RAM = 0; 
                                setup_EN_AND = 1; 
                                setup_EN_XOR = 0; 
                                setup_EN_OR = 0; 
                                setup_EN_ADD = 1; 
                                setup_EN_INC = 0; 
                                setup_EN_SHL = 0; 
                                setup_EN_SHR = 0; 
                                setup_EN_CALL = 0; 
                                setup_EN_ACM = 1; 
                                setup_EN_DATAM = 2; 
                                setup_EN_PUSH = 0; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                1 :
                            begin
                                // Build: Small 8 bit 
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 8; 
                                setup_APB_SDEPTH = 1; 
                                setup_ICWIDTH = 5; 
                                setup_ZRWIDTH = 0; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_STWIDTH = 1; 
                                setup_EN_RAM = 0; 
                                setup_EN_AND = 1; 
                                setup_EN_XOR = 1; 
                                setup_EN_OR = 0; 
                                setup_EN_ADD = 1; 
                                setup_EN_INC = 0; 
                                setup_EN_SHL = 0; 
                                setup_EN_SHR = 0; 
                                setup_EN_CALL = 0; 
                                setup_EN_ACM = 0; 
                                setup_EN_DATAM = 2; 
                                setup_EN_PUSH = 0; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                2 :
                            begin
                                // Build: Small 16 bit 
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 16; 
                                setup_APB_SDEPTH = 1; 
                                setup_ICWIDTH = 5; 
                                setup_ZRWIDTH = 0; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_STWIDTH = 1; 
                                setup_EN_RAM = 0; 
                                setup_EN_AND = 1; 
                                setup_EN_XOR = 1; 
                                setup_EN_OR = 0; 
                                setup_EN_ADD = 1; 
                                setup_EN_INC = 0; 
                                setup_EN_SHL = 0; 
                                setup_EN_SHR = 0; 
                                setup_EN_CALL = 0; 
                                setup_EN_ACM = 0; 
                                setup_EN_DATAM = 2; 
                                setup_EN_PUSH = 0; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                3 :
                            begin
                                //Build: Small 32 bit 
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 32; 
                                setup_APB_SDEPTH = 1; 
                                setup_ICWIDTH = 5; 
                                setup_ZRWIDTH = 0; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_STWIDTH = 1; 
                                setup_EN_RAM = 0; 
                                setup_EN_AND = 1; 
                                setup_EN_XOR = 1; 
                                setup_EN_OR = 0; 
                                setup_EN_ADD = 1; 
                                setup_EN_INC = 0; 
                                setup_EN_SHL = 0; 
                                setup_EN_SHR = 0; 
                                setup_EN_CALL = 0; 
                                setup_EN_ACM = 0; 
                                setup_EN_DATAM = 2; 
                                setup_EN_PUSH = 0; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                4 :
                            begin
                                //Build: Complete 8 bit 
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 8; 
                                setup_APB_SDEPTH = 1; 
                                setup_ICWIDTH = 5; 
                                setup_ZRWIDTH = 8; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_STWIDTH = 1; 
                                setup_EN_RAM = 1; 
                                setup_EN_AND = 1; 
                                setup_EN_XOR = 1; 
                                setup_EN_OR = 1; 
                                setup_EN_ADD = 1; 
                                setup_EN_INC = 1; 
                                setup_EN_SHL = 1; 
                                setup_EN_SHR = 1; 
                                setup_EN_CALL = 1; 
                                setup_EN_ACM = 0; 
                                setup_EN_DATAM = 2; 
                                setup_EN_PUSH = 0; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                5 :
                            begin
                                //Build: Complete 16 bit 
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 16; 
                                setup_APB_SDEPTH = 1; 
                                setup_ICWIDTH = 5; 
                                setup_ZRWIDTH = 8; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_STWIDTH = 1; 
                                setup_EN_RAM = 1; 
                                setup_EN_AND = 1; 
                                setup_EN_XOR = 1; 
                                setup_EN_OR = 1; 
                                setup_EN_ADD = 1; 
                                setup_EN_INC = 1; 
                                setup_EN_SHL = 1; 
                                setup_EN_SHR = 1; 
                                setup_EN_CALL = 1; 
                                setup_EN_ACM = 0; 
                                setup_EN_DATAM = 2   ;
                                setup_EN_PUSH = 0; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                6 :
                            begin
                                //Build: Complete 32 bit 
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 32; 
                                setup_APB_SDEPTH = 1; 
                                setup_ICWIDTH = 5; 
                                setup_ZRWIDTH = 8; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_STWIDTH = 1; 
                                setup_EN_RAM = 1; 
                                setup_EN_AND = 1; 
                                setup_EN_XOR = 1; 
                                setup_EN_OR = 1; 
                                setup_EN_ADD = 1; 
                                setup_EN_INC = 1; 
                                setup_EN_SHL = 1; 
                                setup_EN_SHR = 1; 
                                setup_EN_CALL = 1; 
                                setup_EN_ACM = 0; 
                                setup_EN_DATAM = 2 ;
                                setup_EN_PUSH = 0; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                11 :
                            begin
                                // Fully Configured 8 Bit Configuration 
                                setup_APB_AWIDTH = 10; 
                                setup_APB_DWIDTH = 8; 
                                setup_APB_SDEPTH = 4; 
                                setup_ZRWIDTH = 8; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_EN_CALL = 1; 
                                setup_EN_INC  = 1; 
                                setup_EN_ADD  = 1; 
                                setup_EN_AND  = 1; 
                                setup_EN_OR   = 1; 
                                setup_EN_XOR  = 1; 
                                setup_EN_SHL  = 1; 
                                setup_EN_SHR  = 1; 
                                setup_EN_DATAM = 2; 
                                setup_EN_RAM = 1; 
                                setup_EN_ACM = 1; 
                                setup_EN_PUSH = 1; 
                                setup_EN_INT = 1; 
                                setup_ISRADDR = 400; 
                                setup_ICWIDTH = 10; 
                                setup_STWIDTH = 8; 
                                setup_EN_IOREAD  = 1;
                                setup_EN_ALURAM  = 1;
                                setup_EN_MULT  = 1;
                                setup_EN_INDIRECT = 1;     
                            end
                12 :
                            begin
                                // Fully Configured 16 Bit Configuration 
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 16; 
                                setup_APB_SDEPTH = 4; 
                                setup_ZRWIDTH = 8; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_EN_CALL = 1; 
                                setup_EN_INC = 1; 
                                setup_EN_ADD = 1; 
                                setup_EN_AND = 1; 
                                setup_EN_OR = 1; 
                                setup_EN_XOR = 1; 
                                setup_EN_SHL = 1; 
                                setup_EN_SHR = 1; 
                                setup_EN_DATAM = 2; 
                                setup_EN_RAM = 1; 
                                setup_EN_ACM = 1; 
                                setup_ICWIDTH = 8; 
                                setup_STWIDTH = 4; 
                                setup_EN_PUSH = 1; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                13 :
                            begin
                                // Fully Configured 32 Bit Configuration 
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 32; 
                                setup_APB_SDEPTH = 4; 
                                setup_ZRWIDTH = 8; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_EN_CALL = 1; 
                                setup_EN_INC = 1; 
                                setup_EN_ADD = 1; 
                                setup_EN_AND = 1; 
                                setup_EN_OR = 1; 
                                setup_EN_XOR = 1; 
                                setup_EN_SHL = 1; 
                                setup_EN_SHR = 1; 
                                setup_EN_DATAM = 2; 
                                setup_EN_RAM = 1; 
                                setup_EN_ACM = 1; 
                                setup_ICWIDTH = 8; 
                                setup_STWIDTH = 4; 
                                setup_EN_PUSH = 1; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                14 :
                            begin
                                // Small 8 Bit Configuration with call
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 8; 
                                setup_APB_SDEPTH = 4; 
                                setup_ZRWIDTH = 8; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_EN_CALL = 1; 
                                setup_EN_INC = 0; 
                                setup_EN_ADD = 1; 
                                setup_EN_AND = 1; 
                                setup_EN_OR = 1; 
                                setup_EN_XOR = 1; 
                                setup_EN_SHL = 0; 
                                setup_EN_SHR = 0; 
                                setup_EN_DATAM = 2; 
                                setup_EN_RAM = 0; 
                                setup_EN_ACM = 0; 
                                setup_ICWIDTH = 8; 
                                setup_STWIDTH = 4; 
                                setup_EN_PUSH = 1; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                15 :
                            begin
                                // Small 8 Bit Configuration no call and 1 slot
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 8; 
                                setup_APB_SDEPTH = 1; 
                                setup_ZRWIDTH = 8; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_EN_CALL = 0; 
                                setup_EN_INC = 1; 
                                setup_EN_ADD = 0; 
                                setup_EN_AND = 0; 
                                setup_EN_OR = 0; 
                                setup_EN_XOR = 1; 
                                setup_EN_SHL = 0; 
                                setup_EN_SHR = 0; 
                                setup_EN_DATAM = 3; 
                                setup_EN_RAM = 0; 
                                setup_EN_ACM = 0; 
                                setup_ICWIDTH = 8; 
                                setup_STWIDTH = 1; 
                                setup_EN_PUSH = 0; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                            end
                16 :
                            begin
                                // Full 8 bit configuration with RAM based Instructions 
                                setup_APB_AWIDTH = 8; 
                                setup_APB_DWIDTH = 8; 
                                setup_APB_SDEPTH = 4; 
                                setup_ZRWIDTH = 8; 
                                setup_IIWIDTH = 8; 
                                setup_IOWIDTH = 8; 
                                setup_EN_CALL = 1; 
                                setup_EN_INC = 1; 
                                setup_EN_ADD = 1; 
                                setup_EN_AND = 1; 
                                setup_EN_OR = 1; 
                                setup_EN_XOR = 1; 
                                setup_EN_SHL = 1; 
                                setup_EN_SHR = 1; 
                                setup_EN_DATAM = 2; 
                                setup_EN_RAM = 1; 
                                setup_EN_ACM = 1; 
                                setup_ICWIDTH = 8; 
                                setup_STWIDTH = 4; 
                                setup_INITWIDTH = 2; 
                                setup_EN_PUSH = 1; 
                                setup_EN_INT = 0; 
                                setup_ISRADDR = 0; 
                           end
              20 : begin setup_APB_AWIDTH = 16; setup_APB_DWIDTH = 8; setup_APB_SDEPTH = 16;  setup_ICWIDTH = 12;  end
              21 : begin setup_APB_AWIDTH = 8;  setup_APB_DWIDTH = 8; setup_APB_SDEPTH = 1;   setup_ICWIDTH = 8;   end
              22 : begin setup_APB_AWIDTH = 16; setup_APB_DWIDTH =32; setup_APB_SDEPTH = 16;  setup_ICWIDTH = 12;  end
              23 : begin setup_APB_AWIDTH = 16; setup_APB_DWIDTH =16; setup_APB_SDEPTH = 1 ;  setup_ICWIDTH = 7;   end
              24 : begin setup_APB_AWIDTH = 8;  setup_APB_DWIDTH =16; setup_APB_SDEPTH = 1;   setup_ICWIDTH = 8;   end
              25 : begin setup_APB_AWIDTH = 16; setup_APB_DWIDTH =32; setup_APB_SDEPTH = 16;  setup_ICWIDTH = 12;  end
              26 : begin setup_APB_AWIDTH = 16; setup_APB_DWIDTH =16; setup_APB_SDEPTH = 16;  setup_ICWIDTH = 12;  end
              27 : begin setup_APB_AWIDTH = 10; setup_APB_DWIDTH =32; setup_APB_SDEPTH = 1;   setup_ICWIDTH = 10;  end
              28 : begin setup_APB_AWIDTH = 9;  setup_APB_DWIDTH =16; setup_APB_SDEPTH = 1;   setup_ICWIDTH = 8;   end
              29 : begin setup_APB_AWIDTH = 8;  setup_APB_DWIDTH = 8; setup_APB_SDEPTH = 1;   setup_ICWIDTH = 7;   end   
              30 : begin setup_APB_AWIDTH = 16; setup_APB_DWIDTH =32; setup_APB_SDEPTH = 16;  setup_ICWIDTH = 15;  end	 
              31 : begin setup_APB_AWIDTH = 16; setup_APB_DWIDTH =8 ; setup_APB_SDEPTH = 2 ;  setup_ICWIDTH = 16;  end  // 32 bit instruction	 
                 			 
              default :
                            begin
                                $display("Testbench not configured for the TESTMODE setting used (failure)"); 
                            end
            endcase 

            setup_INITWIDTH = 16; //calc_initwidth(setup_APB_AWIDTH,setup_APB_DWIDTH,setup_APB_SDEPTH,setup_ICWIDTH);
        
            APBsetup = { setup_EN_INDIRECT,
                         setup_EN_MULT,
                         setup_ID, 				
                         setup_FAMILY, 			
                         setup_APB_AWIDTH, 		
                         setup_APB_DWIDTH, 		
                         setup_APB_SDEPTH, 		
                         setup_ICWIDTH, 		
                         setup_ZRWIDTH, 		
                         setup_IIWIDTH, 		
                         setup_IFWIDTH, 		
                         setup_IOWIDTH, 		
                         setup_STWIDTH, 		
                         setup_EN_RAM, 			
                         setup_EN_AND, 			
                         setup_EN_XOR, 			
                         setup_EN_OR, 			
                         setup_EN_ADD, 			
                         setup_EN_INC, 			
                         setup_EN_SHL, 			
                         setup_EN_SHR, 			
                         setup_EN_CALL, 		
                         setup_EN_PUSH, 		
                         setup_EN_ACM, 			
                         setup_EN_DATAM, 		
                         setup_EN_INT, 			
                         setup_EN_IOREAD,		
                         setup_EN_IOWRT,		
                         setup_EN_ALURAM, 		
                         setup_ISRADDR,			
                         setup_DEBUG, 			
                         setup_INSMODE,			
                         setup_INITWIDTH, 		
                         setup_TESTMODE			
                       }; 
        end
    endfunction

    function [1:10*8] tostr;
        input x; 
        integer x;

        reg [1:10*8] str;
        begin
            if (x == 0)
            begin
                $swrite(str,"Disabled"); 
            end
            else
            begin
                $swrite(str,"Enabled"); 
            end 
            tostr = str;
        end
    endfunction

    task printerror;
        inout ERRORS; 
        integer ERRORS;
        input [1:40*8] str; 

        begin
            ERRORS = ERRORS + 1; 
            $display("ERROR: %s", str); 
            $display(" Simulation stopped due to error (ERROR)"); 
        end
    endtask

