// binToBCD68.v
 `timescale 1ns/100ps
 // Author:  Jerry D. Harthcock
 // Version:  1.00  Sept. 14, 2018
 // Copyright (C) 2018.  All rights reserved.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                  //
//                                                Open-Source                                                       //
//                                        SYMPL 64-Bit OpCodeless CPU                                               //
//                                Evaluation and Product Development License                                        //
//                                                                                                                  //
//                                                                                                                  //
// Open-source means that this source code may be freely downloaded, copied, modified, distributed and used in      //
// accordance with the terms and conditons of the licenses provided herein.                                         //
//                                                                                                                  //
// Provided that you comply with all the terms and conditions set forth herein, Jerry D. Harthcock ("licensor"),    //
// the original author and exclusive copyright owner of this SYMPL 64-Bit OpCodeless CPU and related development    //
// software ("this IP") hereby grants recipient of this IP ("licensee"), a world-wide, paid-up, non-exclusive       //
// license to implement this IP within the programmable fabric of Xilinx, Intel, MicroSemi or Lattice               //
// Semiconductor brand FPGAs only and used only for the purposes of evaluation, education, and development of end   //
// products and related development tools.  Furthermore, limited to the purposes of prototyping, evaluation,        //
// characterization and testing of implementations in a hard, custom or semi-custom ASIC, any university or         //
// institution of higher education may have their implementation of this IP produced for said limited purposes at   //
// any foundary of their choosing provided that such prototypes do not ever wind up in commercial circulation,      //
// with such license extending to said foundary and is in connection with said academic pursuit and under the       //
// supervision of said university or institution of higher education.                                               //            
//                                                                                                                  //
// Any copying, distribution, customization, modification, or derivative work of this IP must include an exact copy //
// of this license and original copyright notice at the very top of each source file and any derived netlist, and,  //
// in the case of binaries, a printed copy of this license and/or a text format copy in a separate file distributed //
// with said netlists or binary files having the file name, "LICENSE.txt".  You, the licensee, also agree not to    //
// remove any copyright notices from any source file covered or distributed under this Evaluation and Product       //
// Development License.                                                                                             //
//                                                                                                                  //
// LICENSOR DOES NOT WARRANT OR GUARANTEE THAT YOUR USE OF THIS IP WILL NOT INFRINGE THE RIGHTS OF OTHERS OR        //
// THAT IT IS SUITABLE OR FIT FOR ANY PURPOSE AND THAT YOU, THE LICENSEE, AGREE TO HOLD LICENSOR HARMLESS FROM      //
// ANY CLAIM BROUGHT BY YOU OR ANY THIRD PARTY FOR YOUR SUCH USE.                                                   //
//                                                                                                                  //
//                                               N O T I C E                                                        //
//                                                                                                                  //
// Certain implementations of this IP involving certain floating-point operators may comprise IP owned by certain   //
// contributors and developers at FloPoCo.  FloPoCo's licensing terms can be found at this website:                 //
//                                                                                                                  //
//    http://flopoco.gforge.inria.fr                                                                                //
//                                                                                                                  //
// Licensor reserves all his rights, including, but in no way limited to, the right to change or modify the terms   //
// and conditions of this Evaluation and Product Development License anytime without notice of any kind to anyone.  //
// By using this IP for any purpose, you agree to all the terms and conditions set forth in this Evaluation and     //
// Product Development License.                                                                                     //
//                                                                                                                  //
// This Evaluation and Product Development License does not include the right to sell products that incorporate     //
// this IP or any IP derived from this IP. If you would like to obtain such a license, please contact Licensor.     //           
//                                                                                                                  //
// Licensor can be contacted at:  SYMPL.gpu@gmail.com                                                               //
//                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module binToBCD68 (
    CLK,
    RESET,
    binIn,
    decDigit20,
    decDigit19,
    decDigit18,
    decDigit17,
    decDigit16,
    decDigit15,
    decDigit14,
    decDigit13,
    decDigit12,
    decDigit11,
    decDigit10,
    decDigit9,
    decDigit8,
    decDigit7,
    decDigit6,
    decDigit5,
    decDigit4,
    decDigit3,
    decDigit2,
    decDigit1,
    decDigit0
    );
    
input CLK;
input RESET;
input [67:0] binIn;
output [3:0] decDigit20;
output [3:0] decDigit19;
output [3:0] decDigit18;
output [3:0] decDigit17;
output [3:0] decDigit16;
output [3:0] decDigit15;
output [3:0] decDigit14;
output [3:0] decDigit13;
output [3:0] decDigit12;
output [3:0] decDigit11;
output [3:0] decDigit10;
output [3:0] decDigit9;
output [3:0] decDigit8;
output [3:0] decDigit7;
output [3:0] decDigit6;
output [3:0] decDigit5;
output [3:0] decDigit4;
output [3:0] decDigit3;
output [3:0] decDigit2;
output [3:0] decDigit1;
output [3:0] decDigit0;


wire [3:0] decDigit20;
wire [3:0] decDigit19;
wire [3:0] decDigit18;
wire [3:0] decDigit17;
wire [3:0] decDigit16;
wire [3:0] decDigit15;
wire [3:0] decDigit14;
wire [3:0] decDigit13;
wire [3:0] decDigit12;
wire [3:0] decDigit11;
wire [3:0] decDigit10;
wire [3:0] decDigit9;
wire [3:0] decDigit8;
wire [3:0] decDigit7;
wire [3:0] decDigit6;
wire [3:0] decDigit5;
wire [3:0] decDigit4;
wire [3:0] decDigit3;
wire [3:0] decDigit2;
wire [3:0] decDigit1;
wire [3:0] decDigit0;

wire [67:0] stage0in ;
wire [70:0] stage0out;

assign stage0in = binIn;

BCD68stage0 stage0(
   .CLK      (CLK ),
   .RESET    (RESET),
   .stage0in (stage0in ),
   .stage0out(stage0out)
);    

wire [70:0] stage1in;
wire [73:0] stage1out;

assign stage1in = stage0out;

BCD68stage1 stage1(
   .CLK      (CLK ),
   .RESET    (RESET),
   .stage1in (stage1in ),
   .stage1out(stage1out)
);    

wire [73:0] stage2in;
wire [75:0] stage2out;

assign stage2in = stage1out;

BCD68stage2 stage2(
   .CLK      (CLK ),
   .RESET    (RESET),
   .stage2in (stage2in ),
   .stage2out(stage2out)
);    

wire [75:0] stage3in;
wire [78:0] stage3out;

assign stage3in = stage2out;

BCD68stage3 stage3(
   .CLK      (CLK ),
   .RESET    (RESET),
   .stage3in (stage3in ),
   .stage3out(stage3out)
);    

wire [78:0] stage4in;
wire [81:0] stage4out;

assign stage4in = stage3out;

BCD68stage4 stage4(
   .CLK      (CLK ),
   .RESET    (RESET),
   .stage4in (stage4in ),
   .stage4out(stage4out)
);    

wire [81:0] stage5in;
wire [83:0] stage5out;

assign stage5in = stage4out;

BCD68stage5 stage5(
   .CLK      (CLK ),
   .RESET    (RESET),
   .stage5in (stage5in ),
   .stage5out(stage5out)
);    

wire [83:0] stage6in;
wire [86:0] stage6out;

assign stage6in = stage5out;

BCD68stage6 stage6(
   .CLK      (CLK ),
   .RESET    (RESET),
   .stage6in (stage6in ),
   .stage6out(stage6out)
);    

wire [86:0] stage7in;
wire [83:0] stage7out;

assign stage7in = stage6out;

BCD68stage7 stage7(
   .CLK      (CLK ),
   .RESET    (RESET),
   .stage7in (stage7in ),
   .stage7out(stage7out)
);    

assign {decDigit20,      //first 3 MSBs of stage7out are tied to 0 because they are never used
        decDigit19,
        decDigit18,
        decDigit17,
        decDigit16,
        decDigit15,
        decDigit14,
        decDigit13,
        decDigit12,
        decDigit11,
        decDigit10,
        decDigit9,
        decDigit8,
        decDigit7,
        decDigit6,
        decDigit5,
        decDigit4,
        decDigit3,
        decDigit2,
        decDigit1,
        decDigit0} = stage7out;


endmodule    