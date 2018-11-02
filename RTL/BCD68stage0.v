//BCD68stage0.v
`timescale 1ns/100ps
 // Author:  Jerry D. Harthcock
 // Version:  1.00  Sept 13, 2018
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


module BCD68stage0(
    CLK,
    RESET,
    stage0in,
    stage0out
);    

input CLK;
input RESET;
input[67:0] stage0in;
output[70:0] stage0out;

reg [70:0] stage0out;

wire [3:0] shftadd0_out;
wire [3:0] shftadd1_out;
wire [3:0] shftadd2_out;

wire [3:0] shftadd31_out;
wire [3:0] shftadd30_out;

wire [3:0] shftadd41_out;
wire [3:0] shftadd40_out;

wire [3:0] shftadd51_out;
wire [3:0] shftadd50_out;

wire [3:0] shftadd62_out;
wire [3:0] shftadd61_out;
wire [3:0] shftadd60_out;

wire [3:0] shftadd72_out;
wire [3:0] shftadd71_out;
wire [3:0] shftadd70_out;

bindec3 shftadd0(.bin_in ({1'b0, stage0in[67:65]}), .dec_out(shftadd0_out));

bindec3 shftadd1(.bin_in ({shftadd0_out[2:0], stage0in[64]}), .dec_out(shftadd1_out));
    
bindec3 shftadd2(.bin_in ({shftadd1_out[2:0], stage0in[63]}), .dec_out(shftadd2_out));

bindec3 shftadd31(.bin_in ({1'b0, shftadd0_out[3], shftadd1_out[3], shftadd2_out[3]}), .dec_out(shftadd31_out));
bindec3 shftadd30(.bin_in ({shftadd2_out[2:0], stage0in[62]}), .dec_out(shftadd30_out));

bindec3 shftadd41(.bin_in ({shftadd31_out[2:0], shftadd30_out[3]}), .dec_out(shftadd41_out));
bindec3 shftadd40(.bin_in ({shftadd30_out[2:0], stage0in[61]}), .dec_out(shftadd40_out));

bindec3 shftadd51(.bin_in ({shftadd41_out[2:0], shftadd40_out[3]}), .dec_out(shftadd51_out));
bindec3 shftadd50(.bin_in ({shftadd40_out[2:0], stage0in[60]}), .dec_out(shftadd50_out));


bindec3 shftadd62(.bin_in ({1'b0, shftadd31_out[3], shftadd41_out[3], shftadd51_out[3]}), .dec_out(shftadd62_out));
bindec3 shftadd61(.bin_in ({shftadd51_out[2:0], shftadd50_out[3]}), .dec_out(shftadd61_out));
bindec3 shftadd60(.bin_in ({shftadd50_out[2:0], stage0in[59]}), .dec_out(shftadd60_out));

bindec3 shftadd72(.bin_in ({shftadd62_out[2:0], shftadd61_out[3]}), .dec_out(shftadd72_out));
bindec3 shftadd71(.bin_in ({shftadd61_out[2:0], shftadd60_out[3]}), .dec_out(shftadd71_out));
bindec3 shftadd70(.bin_in ({shftadd60_out[2:0], stage0in[58]}), .dec_out(shftadd70_out));

//stage 9
always @(posedge CLK) 
    if (RESET) stage0out <= 0;
    else stage0out <= {shftadd62_out[3], shftadd72_out[3:0], shftadd71_out[3:0], shftadd70_out[3:0], stage0in[57:0]};


endmodule
