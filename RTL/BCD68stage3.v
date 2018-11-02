//BCD68stage3.v
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

module BCD68stage3(
    CLK,
    RESET,
    stage3in,
    stage3out
);    

input RESET;
input CLK;
input[75:0] stage3in;
output[78:0] stage3out;

reg [78:0] stage3out;

wire [3:0] shftadd248_out;
wire [3:0] shftadd247_out;
wire [3:0] shftadd246_out;
wire [3:0] shftadd245_out;
wire [3:0] shftadd244_out;
wire [3:0] shftadd243_out;
wire [3:0] shftadd242_out;
wire [3:0] shftadd241_out;
wire [3:0] shftadd240_out;

wire [3:0] shftadd258_out;
wire [3:0] shftadd257_out;
wire [3:0] shftadd256_out;
wire [3:0] shftadd255_out;
wire [3:0] shftadd254_out;
wire [3:0] shftadd253_out;
wire [3:0] shftadd252_out;
wire [3:0] shftadd251_out;
wire [3:0] shftadd250_out;

wire [3:0] shftadd268_out;
wire [3:0] shftadd267_out;
wire [3:0] shftadd266_out;
wire [3:0] shftadd265_out;
wire [3:0] shftadd264_out;
wire [3:0] shftadd263_out;
wire [3:0] shftadd262_out;
wire [3:0] shftadd261_out;
wire [3:0] shftadd260_out;
//
wire [3:0] shftadd279_out;
wire [3:0] shftadd278_out;
wire [3:0] shftadd277_out;
wire [3:0] shftadd276_out;
wire [3:0] shftadd275_out;
wire [3:0] shftadd274_out;
wire [3:0] shftadd273_out;
wire [3:0] shftadd272_out;
wire [3:0] shftadd271_out;
wire [3:0] shftadd270_out;

wire [3:0] shftadd289_out;
wire [3:0] shftadd288_out;
wire [3:0] shftadd287_out;
wire [3:0] shftadd286_out;
wire [3:0] shftadd285_out;
wire [3:0] shftadd284_out;
wire [3:0] shftadd283_out;
wire [3:0] shftadd282_out;
wire [3:0] shftadd281_out;
wire [3:0] shftadd280_out;

wire [3:0] shftadd299_out;
wire [3:0] shftadd298_out;
wire [3:0] shftadd297_out;
wire [3:0] shftadd296_out;
wire [3:0] shftadd295_out;
wire [3:0] shftadd294_out;
wire [3:0] shftadd293_out;
wire [3:0] shftadd292_out;
wire [3:0] shftadd291_out;
wire [3:0] shftadd290_out;

wire [3:0] shftadd3010_out;
wire [3:0] shftadd309_out;
wire [3:0] shftadd308_out;
wire [3:0] shftadd307_out;
wire [3:0] shftadd306_out;
wire [3:0] shftadd305_out;
wire [3:0] shftadd304_out;
wire [3:0] shftadd303_out;
wire [3:0] shftadd302_out;
wire [3:0] shftadd301_out;
wire [3:0] shftadd300_out;

wire [3:0] shftadd3020_out;
wire [3:0] shftadd319_out;
wire [3:0] shftadd318_out;
wire [3:0] shftadd317_out;
wire [3:0] shftadd316_out;
wire [3:0] shftadd315_out;
wire [3:0] shftadd314_out;
wire [3:0] shftadd313_out;
wire [3:0] shftadd312_out;
wire [3:0] shftadd311_out;
wire [3:0] shftadd310_out;

bindec3 shftadd248(.bin_in ({1'b0, stage3in[75:73]}), .dec_out(shftadd248_out));
bindec3 shftadd247(.bin_in (stage3in[72:69]), .dec_out(shftadd247_out));
bindec3 shftadd246(.bin_in (stage3in[68:65]), .dec_out(shftadd246_out));
bindec3 shftadd245(.bin_in (stage3in[64:61]), .dec_out(shftadd245_out));
bindec3 shftadd244(.bin_in (stage3in[60:57]), .dec_out(shftadd244_out));
bindec3 shftadd243(.bin_in (stage3in[56:53]), .dec_out(shftadd243_out));
bindec3 shftadd242(.bin_in (stage3in[52:49]), .dec_out(shftadd242_out));
bindec3 shftadd241(.bin_in (stage3in[48:45]), .dec_out(shftadd241_out));
bindec3 shftadd240(.bin_in (stage3in[44:41]), .dec_out(shftadd240_out));

bindec3 shftadd258(.bin_in ({shftadd248_out[2:0], shftadd247_out[3]}), .dec_out(shftadd258_out));
bindec3 shftadd257(.bin_in ({shftadd247_out[2:0], shftadd246_out[3]}), .dec_out(shftadd257_out));
bindec3 shftadd256(.bin_in ({shftadd246_out[2:0], shftadd245_out[3]}), .dec_out(shftadd256_out));
bindec3 shftadd255(.bin_in ({shftadd245_out[2:0], shftadd244_out[3]}), .dec_out(shftadd255_out));
bindec3 shftadd254(.bin_in ({shftadd244_out[2:0], shftadd243_out[3]}), .dec_out(shftadd254_out));
bindec3 shftadd253(.bin_in ({shftadd243_out[2:0], shftadd242_out[3]}), .dec_out(shftadd253_out));
bindec3 shftadd252(.bin_in ({shftadd242_out[2:0], shftadd241_out[3]}), .dec_out(shftadd252_out));
bindec3 shftadd251(.bin_in ({shftadd241_out[2:0], shftadd240_out[3]}), .dec_out(shftadd251_out));
bindec3 shftadd250(.bin_in ({shftadd240_out[2:0], stage3in[40]}), .dec_out(shftadd250_out));

bindec3 shftadd268(.bin_in ({shftadd258_out[2:0], shftadd257_out[3]}), .dec_out(shftadd268_out));
bindec3 shftadd267(.bin_in ({shftadd257_out[2:0], shftadd256_out[3]}), .dec_out(shftadd267_out));
bindec3 shftadd266(.bin_in ({shftadd256_out[2:0], shftadd255_out[3]}), .dec_out(shftadd266_out));
bindec3 shftadd265(.bin_in ({shftadd255_out[2:0], shftadd254_out[3]}), .dec_out(shftadd265_out));
bindec3 shftadd264(.bin_in ({shftadd254_out[2:0], shftadd253_out[3]}), .dec_out(shftadd264_out));
bindec3 shftadd263(.bin_in ({shftadd253_out[2:0], shftadd252_out[3]}), .dec_out(shftadd263_out));
bindec3 shftadd262(.bin_in ({shftadd252_out[2:0], shftadd251_out[3]}), .dec_out(shftadd262_out));
bindec3 shftadd261(.bin_in ({shftadd251_out[2:0], shftadd250_out[3]}), .dec_out(shftadd261_out));
bindec3 shftadd260(.bin_in ({shftadd250_out[2:0], stage3in[39]}), .dec_out(shftadd260_out));

bindec3 shftadd279(.bin_in ({1'b0, shftadd248_out[3], shftadd258_out[3], shftadd268_out[3]}), .dec_out(shftadd279_out));
bindec3 shftadd278(.bin_in ({shftadd268_out[2:0], shftadd267_out[3]}), .dec_out(shftadd278_out));
bindec3 shftadd277(.bin_in ({shftadd267_out[2:0], shftadd266_out[3]}), .dec_out(shftadd277_out));
bindec3 shftadd276(.bin_in ({shftadd266_out[2:0], shftadd265_out[3]}), .dec_out(shftadd276_out));
bindec3 shftadd275(.bin_in ({shftadd265_out[2:0], shftadd264_out[3]}), .dec_out(shftadd275_out));
bindec3 shftadd274(.bin_in ({shftadd264_out[2:0], shftadd263_out[3]}), .dec_out(shftadd274_out));
bindec3 shftadd273(.bin_in ({shftadd263_out[2:0], shftadd262_out[3]}), .dec_out(shftadd273_out));
bindec3 shftadd272(.bin_in ({shftadd262_out[2:0], shftadd261_out[3]}), .dec_out(shftadd272_out));
bindec3 shftadd271(.bin_in ({shftadd261_out[2:0], shftadd260_out[3]}), .dec_out(shftadd271_out));
bindec3 shftadd270(.bin_in ({shftadd260_out[2:0], stage3in[38]}), .dec_out(shftadd270_out));

bindec3 shftadd289(.bin_in ({shftadd279_out[2:0], shftadd278_out[3]}), .dec_out(shftadd289_out));
bindec3 shftadd288(.bin_in ({shftadd278_out[2:0], shftadd277_out[3]}), .dec_out(shftadd288_out));
bindec3 shftadd287(.bin_in ({shftadd277_out[2:0], shftadd276_out[3]}), .dec_out(shftadd287_out));
bindec3 shftadd286(.bin_in ({shftadd276_out[2:0], shftadd275_out[3]}), .dec_out(shftadd286_out));
bindec3 shftadd285(.bin_in ({shftadd275_out[2:0], shftadd274_out[3]}), .dec_out(shftadd285_out));
bindec3 shftadd284(.bin_in ({shftadd274_out[2:0], shftadd273_out[3]}), .dec_out(shftadd284_out));
bindec3 shftadd283(.bin_in ({shftadd273_out[2:0], shftadd272_out[3]}), .dec_out(shftadd283_out));
bindec3 shftadd282(.bin_in ({shftadd272_out[2:0], shftadd271_out[3]}), .dec_out(shftadd282_out));
bindec3 shftadd281(.bin_in ({shftadd271_out[2:0], shftadd270_out[3]}), .dec_out(shftadd281_out));
bindec3 shftadd280(.bin_in ({shftadd270_out[2:0], stage3in[37]}), .dec_out(shftadd280_out));

bindec3 shftadd299(.bin_in ({shftadd289_out[2:0], shftadd288_out[3]}), .dec_out(shftadd299_out));
bindec3 shftadd298(.bin_in ({shftadd288_out[2:0], shftadd287_out[3]}), .dec_out(shftadd298_out));
bindec3 shftadd297(.bin_in ({shftadd287_out[2:0], shftadd286_out[3]}), .dec_out(shftadd297_out));
bindec3 shftadd296(.bin_in ({shftadd286_out[2:0], shftadd285_out[3]}), .dec_out(shftadd296_out));
bindec3 shftadd295(.bin_in ({shftadd285_out[2:0], shftadd284_out[3]}), .dec_out(shftadd295_out));
bindec3 shftadd294(.bin_in ({shftadd284_out[2:0], shftadd283_out[3]}), .dec_out(shftadd294_out));
bindec3 shftadd293(.bin_in ({shftadd283_out[2:0], shftadd282_out[3]}), .dec_out(shftadd293_out));
bindec3 shftadd292(.bin_in ({shftadd282_out[2:0], shftadd281_out[3]}), .dec_out(shftadd292_out));
bindec3 shftadd291(.bin_in ({shftadd281_out[2:0], shftadd280_out[3]}), .dec_out(shftadd291_out));
bindec3 shftadd290(.bin_in ({shftadd280_out[2:0], stage3in[36]}), .dec_out(shftadd290_out));

bindec3 shftadd3010(.bin_in ({1'b0, shftadd279_out[3], shftadd289_out[3], shftadd299_out[3]}), .dec_out(shftadd3010_out));
bindec3 shftadd309(.bin_in  ({shftadd299_out[2:0], shftadd298_out[3]}), .dec_out(shftadd309_out));
bindec3 shftadd308(.bin_in  ({shftadd298_out[2:0], shftadd297_out[3]}), .dec_out(shftadd308_out));
bindec3 shftadd307(.bin_in  ({shftadd297_out[2:0], shftadd296_out[3]}), .dec_out(shftadd307_out));
bindec3 shftadd306(.bin_in  ({shftadd296_out[2:0], shftadd295_out[3]}), .dec_out(shftadd306_out));
bindec3 shftadd305(.bin_in  ({shftadd295_out[2:0], shftadd294_out[3]}), .dec_out(shftadd305_out));
bindec3 shftadd304(.bin_in  ({shftadd294_out[2:0], shftadd293_out[3]}), .dec_out(shftadd304_out));
bindec3 shftadd303(.bin_in  ({shftadd293_out[2:0], shftadd292_out[3]}), .dec_out(shftadd303_out));
bindec3 shftadd302(.bin_in  ({shftadd292_out[2:0], shftadd291_out[3]}), .dec_out(shftadd302_out));
bindec3 shftadd301(.bin_in  ({shftadd291_out[2:0], shftadd290_out[3]}), .dec_out(shftadd301_out));
bindec3 shftadd300(.bin_in  ({shftadd290_out[2:0], stage3in[35]}), .dec_out  (shftadd300_out));

bindec3 shftadd3020(.bin_in ({shftadd3010_out[2:0], shftadd309_out[3]}), .dec_out(shftadd3020_out));
bindec3 shftadd319 (.bin_in ({shftadd309_out[2:0],  shftadd308_out[3]}), .dec_out(shftadd319_out));
bindec3 shftadd318 (.bin_in ({shftadd308_out[2:0],  shftadd307_out[3]}), .dec_out(shftadd318_out));
bindec3 shftadd317 (.bin_in ({shftadd307_out[2:0],  shftadd306_out[3]}), .dec_out(shftadd317_out));
bindec3 shftadd316 (.bin_in ({shftadd306_out[2:0],  shftadd305_out[3]}), .dec_out(shftadd316_out));
bindec3 shftadd315 (.bin_in ({shftadd305_out[2:0],  shftadd304_out[3]}), .dec_out(shftadd315_out));
bindec3 shftadd314 (.bin_in ({shftadd304_out[2:0],  shftadd303_out[3]}), .dec_out(shftadd314_out));
bindec3 shftadd313 (.bin_in ({shftadd303_out[2:0],  shftadd302_out[3]}), .dec_out(shftadd313_out));
bindec3 shftadd312 (.bin_in ({shftadd302_out[2:0],  shftadd301_out[3]}), .dec_out(shftadd312_out));
bindec3 shftadd311 (.bin_in ({shftadd301_out[2:0],  shftadd300_out[3]}), .dec_out(shftadd311_out));
bindec3 shftadd310 (.bin_in ({shftadd300_out[2:0],  stage3in[34]}),    .dec_out(shftadd310_out));

//stage 12
always @(posedge CLK) 
    if (RESET) stage3out <= 0;
    else stage3out <= {shftadd3010_out[3],
                       shftadd3020_out[3:0],
                       shftadd319_out[3:0],
                       shftadd318_out[3:0],
                       shftadd317_out[3:0],
                       shftadd316_out[3:0],
                       shftadd315_out[3:0],
                       shftadd314_out[3:0],
                       shftadd313_out[3:0],
                       shftadd312_out[3:0],
                       shftadd311_out[3:0],
                       shftadd310_out[3:0],
                       stage3in[33:0]
                       };

endmodule
