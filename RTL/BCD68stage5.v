//BCD68stage5.v

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

module BCD68stage5(
    CLK,
    RESET,
    stage5in,
    stage5out
);    

input RESET;
input CLK;
input[81:0] stage5in;
output[83:0] stage5out;

reg [83:0] stage5out;

wire [3:0] shftadd3AD_out;
wire [3:0] shftadd3AC_out;
wire [3:0] shftadd3AB_out;
wire [3:0] shftadd3AA_out;
wire [3:0] shftadd3A9_out;
wire [3:0] shftadd3A8_out;
wire [3:0] shftadd3A7_out;
wire [3:0] shftadd3A6_out;
wire [3:0] shftadd3A5_out;
wire [3:0] shftadd3A4_out;                               
wire [3:0] shftadd3A3_out;
wire [3:0] shftadd3A2_out;
wire [3:0] shftadd3A1_out;
wire [3:0] shftadd3A0_out;

wire [3:0] shftadd3BD_out;
wire [3:0] shftadd3BC_out;
wire [3:0] shftadd3BB_out;
wire [3:0] shftadd3BA_out;
wire [3:0] shftadd3B9_out;
wire [3:0] shftadd3B8_out;
wire [3:0] shftadd3B7_out;
wire [3:0] shftadd3B6_out;
wire [3:0] shftadd3B5_out;
wire [3:0] shftadd3B4_out;                               
wire [3:0] shftadd3B3_out;
wire [3:0] shftadd3B2_out;
wire [3:0] shftadd3B1_out;
wire [3:0] shftadd3B0_out;

wire [3:0] shftadd3CE_out;
wire [3:0] shftadd3CD_out;
wire [3:0] shftadd3CC_out;
wire [3:0] shftadd3CB_out;
wire [3:0] shftadd3CA_out;
wire [3:0] shftadd3C9_out;
wire [3:0] shftadd3C8_out;
wire [3:0] shftadd3C7_out;
wire [3:0] shftadd3C6_out;
wire [3:0] shftadd3C5_out;
wire [3:0] shftadd3C4_out;                               
wire [3:0] shftadd3C3_out;
wire [3:0] shftadd3C2_out;
wire [3:0] shftadd3C1_out;
wire [3:0] shftadd3C0_out;

wire [3:0] shftadd3DE_out;
wire [3:0] shftadd3DD_out;
wire [3:0] shftadd3DC_out;
wire [3:0] shftadd3DB_out;
wire [3:0] shftadd3DA_out;
wire [3:0] shftadd3D9_out;
wire [3:0] shftadd3D8_out;
wire [3:0] shftadd3D7_out;
wire [3:0] shftadd3D6_out;
wire [3:0] shftadd3D5_out;
wire [3:0] shftadd3D4_out;                               
wire [3:0] shftadd3D3_out;
wire [3:0] shftadd3D2_out;
wire [3:0] shftadd3D1_out;
wire [3:0] shftadd3D0_out;

wire [3:0] shftadd3EE_out;
wire [3:0] shftadd3ED_out;
wire [3:0] shftadd3EC_out;
wire [3:0] shftadd3EB_out;
wire [3:0] shftadd3EA_out;
wire [3:0] shftadd3E9_out;
wire [3:0] shftadd3E8_out;
wire [3:0] shftadd3E7_out;
wire [3:0] shftadd3E6_out;
wire [3:0] shftadd3E5_out;
wire [3:0] shftadd3E4_out;                               
wire [3:0] shftadd3E3_out;
wire [3:0] shftadd3E2_out;
wire [3:0] shftadd3E1_out;
wire [3:0] shftadd3E0_out;

wire [3:0] shftadd3FF_out;
wire [3:0] shftadd3FE_out;
wire [3:0] shftadd3FD_out;
wire [3:0] shftadd3FC_out;
wire [3:0] shftadd3FB_out;
wire [3:0] shftadd3FA_out;
wire [3:0] shftadd3F9_out;
wire [3:0] shftadd3F8_out;
wire [3:0] shftadd3F7_out;
wire [3:0] shftadd3F6_out;
wire [3:0] shftadd3F5_out;
wire [3:0] shftadd3F4_out;                               
wire [3:0] shftadd3F3_out;
wire [3:0] shftadd3F2_out;
wire [3:0] shftadd3F1_out;
wire [3:0] shftadd3F0_out;

wire [3:0] shftadd3GF_out;
wire [3:0] shftadd3GE_out;
wire [3:0] shftadd3GD_out;
wire [3:0] shftadd3GC_out;
wire [3:0] shftadd3GB_out;
wire [3:0] shftadd3GA_out;
wire [3:0] shftadd3G9_out;
wire [3:0] shftadd3G8_out;
wire [3:0] shftadd3G7_out;
wire [3:0] shftadd3G6_out;
wire [3:0] shftadd3G5_out;
wire [3:0] shftadd3G4_out;                               
wire [3:0] shftadd3G3_out;
wire [3:0] shftadd3G2_out;
wire [3:0] shftadd3G1_out;
wire [3:0] shftadd3G0_out;

wire [3:0] shftadd3HF_out;
wire [3:0] shftadd3HE_out;
wire [3:0] shftadd3HD_out;
wire [3:0] shftadd3HC_out;
wire [3:0] shftadd3HB_out;
wire [3:0] shftadd3HA_out;
wire [3:0] shftadd3H9_out;
wire [3:0] shftadd3H8_out;
wire [3:0] shftadd3H7_out;
wire [3:0] shftadd3H6_out;
wire [3:0] shftadd3H5_out;
wire [3:0] shftadd3H4_out;                               
wire [3:0] shftadd3H3_out;
wire [3:0] shftadd3H2_out;
wire [3:0] shftadd3H1_out;
wire [3:0] shftadd3H0_out;

bindec3 shftadd3AD(.bin_in (stage5in[80:77]), .dec_out(shftadd3AD_out));
bindec3 shftadd3AC(.bin_in (stage5in[76:73]), .dec_out(shftadd3AC_out));
bindec3 shftadd3AB(.bin_in (stage5in[72:69]), .dec_out(shftadd3AB_out));
bindec3 shftadd3AA(.bin_in (stage5in[68:65]), .dec_out(shftadd3AA_out));
bindec3 shftadd3A9(.bin_in (stage5in[64:61]), .dec_out(shftadd3A9_out));
bindec3 shftadd3A8(.bin_in (stage5in[60:57]), .dec_out(shftadd3A8_out));
bindec3 shftadd3A7(.bin_in (stage5in[56:53]), .dec_out(shftadd3A7_out));
bindec3 shftadd3A6(.bin_in (stage5in[52:49]), .dec_out(shftadd3A6_out));
bindec3 shftadd3A5(.bin_in (stage5in[48:45]), .dec_out(shftadd3A5_out));
bindec3 shftadd3A4(.bin_in (stage5in[44:41]), .dec_out(shftadd3A4_out));
bindec3 shftadd3A3(.bin_in (stage5in[40:37]), .dec_out(shftadd3A3_out));
bindec3 shftadd3A2(.bin_in (stage5in[36:33]), .dec_out(shftadd3A2_out));
bindec3 shftadd3A1(.bin_in (stage5in[32:29]), .dec_out(shftadd3A1_out));
bindec3 shftadd3A0(.bin_in (stage5in[28:25]), .dec_out(shftadd3A0_out));
                                           
bindec3 shftadd3BD(.bin_in ({shftadd3AD_out[2:0], shftadd3AC_out[3]}), .dec_out(shftadd3BD_out));
bindec3 shftadd3BC(.bin_in ({shftadd3AC_out[2:0], shftadd3AB_out[3]}), .dec_out(shftadd3BC_out));
bindec3 shftadd3BB(.bin_in ({shftadd3AB_out[2:0], shftadd3AA_out[3]}), .dec_out(shftadd3BB_out));
bindec3 shftadd3BA(.bin_in ({shftadd3AA_out[2:0], shftadd3A9_out[3]}), .dec_out(shftadd3BA_out));
bindec3 shftadd3B9(.bin_in ({shftadd3A9_out[2:0], shftadd3A8_out[3]}), .dec_out(shftadd3B9_out));
bindec3 shftadd3B8(.bin_in ({shftadd3A8_out[2:0], shftadd3A7_out[3]}), .dec_out(shftadd3B8_out));
bindec3 shftadd3B7(.bin_in ({shftadd3A7_out[2:0], shftadd3A6_out[3]}), .dec_out(shftadd3B7_out));
bindec3 shftadd3B6(.bin_in ({shftadd3A6_out[2:0], shftadd3A5_out[3]}), .dec_out(shftadd3B6_out));
bindec3 shftadd3B5(.bin_in ({shftadd3A5_out[2:0], shftadd3A4_out[3]}), .dec_out(shftadd3B5_out));
bindec3 shftadd3B4(.bin_in ({shftadd3A4_out[2:0], shftadd3A3_out[3]}), .dec_out(shftadd3B4_out));
bindec3 shftadd3B3(.bin_in ({shftadd3A3_out[2:0], shftadd3A2_out[3]}), .dec_out(shftadd3B3_out));
bindec3 shftadd3B2(.bin_in ({shftadd3A2_out[2:0], shftadd3A1_out[3]}), .dec_out(shftadd3B2_out));
bindec3 shftadd3B1(.bin_in ({shftadd3A1_out[2:0], shftadd3A0_out[3]}), .dec_out(shftadd3B1_out));
bindec3 shftadd3B0(.bin_in ({shftadd3A0_out[2:0], stage5in[24]}), .dec_out(shftadd3B0_out));

bindec3 shftadd3CE(.bin_in ({1'b0, stage5in[81], shftadd3AD_out[3], shftadd3BD_out[3]}), .dec_out(shftadd3CE_out));
bindec3 shftadd3CD(.bin_in ({shftadd3BD_out[2:0], shftadd3BC_out[3]}), .dec_out(shftadd3CD_out));
bindec3 shftadd3CC(.bin_in ({shftadd3BC_out[2:0], shftadd3BB_out[3]}), .dec_out(shftadd3CC_out));
bindec3 shftadd3CB(.bin_in ({shftadd3BB_out[2:0], shftadd3BA_out[3]}), .dec_out(shftadd3CB_out));
bindec3 shftadd3CA(.bin_in ({shftadd3BA_out[2:0], shftadd3B9_out[3]}), .dec_out(shftadd3CA_out));
bindec3 shftadd3C9(.bin_in ({shftadd3B9_out[2:0], shftadd3B8_out[3]}), .dec_out(shftadd3C9_out));
bindec3 shftadd3C8(.bin_in ({shftadd3B8_out[2:0], shftadd3B7_out[3]}), .dec_out(shftadd3C8_out));
bindec3 shftadd3C7(.bin_in ({shftadd3B7_out[2:0], shftadd3B6_out[3]}), .dec_out(shftadd3C7_out));
bindec3 shftadd3C6(.bin_in ({shftadd3B6_out[2:0], shftadd3B5_out[3]}), .dec_out(shftadd3C6_out));
bindec3 shftadd3C5(.bin_in ({shftadd3B5_out[2:0], shftadd3B4_out[3]}), .dec_out(shftadd3C5_out));
bindec3 shftadd3C4(.bin_in ({shftadd3B4_out[2:0], shftadd3B3_out[3]}), .dec_out(shftadd3C4_out));
bindec3 shftadd3C3(.bin_in ({shftadd3B3_out[2:0], shftadd3B2_out[3]}), .dec_out(shftadd3C3_out));
bindec3 shftadd3C2(.bin_in ({shftadd3B2_out[2:0], shftadd3B1_out[3]}), .dec_out(shftadd3C2_out));
bindec3 shftadd3C1(.bin_in ({shftadd3B1_out[2:0], shftadd3B0_out[3]}), .dec_out(shftadd3C1_out));
bindec3 shftadd3C0(.bin_in ({shftadd3B0_out[2:0], stage5in[23]}), .dec_out(shftadd3C0_out));

bindec3 shftadd3DE(.bin_in ({shftadd3CE_out[2:0], shftadd3CD_out[3]}), .dec_out(shftadd3DE_out));
bindec3 shftadd3DD(.bin_in ({shftadd3CD_out[2:0], shftadd3CC_out[3]}), .dec_out(shftadd3DD_out));
bindec3 shftadd3DC(.bin_in ({shftadd3CC_out[2:0], shftadd3CB_out[3]}), .dec_out(shftadd3DC_out));
bindec3 shftadd3DB(.bin_in ({shftadd3CB_out[2:0], shftadd3CA_out[3]}), .dec_out(shftadd3DB_out));
bindec3 shftadd3DA(.bin_in ({shftadd3CA_out[2:0], shftadd3C9_out[3]}), .dec_out(shftadd3DA_out));
bindec3 shftadd3D9(.bin_in ({shftadd3C9_out[2:0], shftadd3C8_out[3]}), .dec_out(shftadd3D9_out));
bindec3 shftadd3D8(.bin_in ({shftadd3C8_out[2:0], shftadd3C7_out[3]}), .dec_out(shftadd3D8_out));
bindec3 shftadd3D7(.bin_in ({shftadd3C7_out[2:0], shftadd3C6_out[3]}), .dec_out(shftadd3D7_out));
bindec3 shftadd3D6(.bin_in ({shftadd3C6_out[2:0], shftadd3C5_out[3]}), .dec_out(shftadd3D6_out));
bindec3 shftadd3D5(.bin_in ({shftadd3C5_out[2:0], shftadd3C4_out[3]}), .dec_out(shftadd3D5_out));
bindec3 shftadd3D4(.bin_in ({shftadd3C4_out[2:0], shftadd3C3_out[3]}), .dec_out(shftadd3D4_out));
bindec3 shftadd3D3(.bin_in ({shftadd3C3_out[2:0], shftadd3C2_out[3]}), .dec_out(shftadd3D3_out));
bindec3 shftadd3D2(.bin_in ({shftadd3C2_out[2:0], shftadd3C1_out[3]}), .dec_out(shftadd3D2_out));
bindec3 shftadd3D1(.bin_in ({shftadd3C1_out[2:0], shftadd3C0_out[3]}), .dec_out(shftadd3D1_out));
bindec3 shftadd3D0(.bin_in ({shftadd3C0_out[2:0], stage5in[22]}), .dec_out(shftadd3D0_out));

bindec3 shftadd3EE(.bin_in ({shftadd3DE_out[2:0], shftadd3DD_out[3]}), .dec_out(shftadd3EE_out));
bindec3 shftadd3ED(.bin_in ({shftadd3DD_out[2:0], shftadd3DC_out[3]}), .dec_out(shftadd3ED_out));
bindec3 shftadd3EC(.bin_in ({shftadd3DC_out[2:0], shftadd3DB_out[3]}), .dec_out(shftadd3EC_out));
bindec3 shftadd3EB(.bin_in ({shftadd3DB_out[2:0], shftadd3DA_out[3]}), .dec_out(shftadd3EB_out));
bindec3 shftadd3EA(.bin_in ({shftadd3DA_out[2:0], shftadd3D9_out[3]}), .dec_out(shftadd3EA_out));
bindec3 shftadd3E9(.bin_in ({shftadd3D9_out[2:0], shftadd3D8_out[3]}), .dec_out(shftadd3E9_out));
bindec3 shftadd3E8(.bin_in ({shftadd3D8_out[2:0], shftadd3D7_out[3]}), .dec_out(shftadd3E8_out));
bindec3 shftadd3E7(.bin_in ({shftadd3D7_out[2:0], shftadd3D6_out[3]}), .dec_out(shftadd3E7_out));
bindec3 shftadd3E6(.bin_in ({shftadd3D6_out[2:0], shftadd3D5_out[3]}), .dec_out(shftadd3E6_out));
bindec3 shftadd3E5(.bin_in ({shftadd3D5_out[2:0], shftadd3D4_out[3]}), .dec_out(shftadd3E5_out));
bindec3 shftadd3E4(.bin_in ({shftadd3D4_out[2:0], shftadd3D3_out[3]}), .dec_out(shftadd3E4_out));
bindec3 shftadd3E3(.bin_in ({shftadd3D3_out[2:0], shftadd3D2_out[3]}), .dec_out(shftadd3E3_out));
bindec3 shftadd3E2(.bin_in ({shftadd3D2_out[2:0], shftadd3D1_out[3]}), .dec_out(shftadd3E2_out));
bindec3 shftadd3E1(.bin_in ({shftadd3D1_out[2:0], shftadd3D0_out[3]}), .dec_out(shftadd3E1_out));
bindec3 shftadd3E0(.bin_in ({shftadd3D0_out[2:0], stage5in[21]}), .dec_out(shftadd3E0_out));

bindec3 shftadd3FF(.bin_in ({1'b0, shftadd3CE_out[3], shftadd3DE_out[3], shftadd3EE_out[3]}), .dec_out(shftadd3FF_out));
bindec3 shftadd3FE(.bin_in ({shftadd3EE_out[2:0], shftadd3ED_out[3]}), .dec_out(shftadd3FE_out));
bindec3 shftadd3FD(.bin_in ({shftadd3ED_out[2:0], shftadd3EC_out[3]}), .dec_out(shftadd3FD_out));
bindec3 shftadd3FC(.bin_in ({shftadd3EC_out[2:0], shftadd3EB_out[3]}), .dec_out(shftadd3FC_out));
bindec3 shftadd3FB(.bin_in ({shftadd3EB_out[2:0], shftadd3EA_out[3]}), .dec_out(shftadd3FB_out));
bindec3 shftadd3FA(.bin_in ({shftadd3EA_out[2:0], shftadd3E9_out[3]}), .dec_out(shftadd3FA_out));
bindec3 shftadd3F9(.bin_in ({shftadd3E9_out[2:0], shftadd3E8_out[3]}), .dec_out(shftadd3F9_out));
bindec3 shftadd3F8(.bin_in ({shftadd3E8_out[2:0], shftadd3E7_out[3]}), .dec_out(shftadd3F8_out));
bindec3 shftadd3F7(.bin_in ({shftadd3E7_out[2:0], shftadd3E6_out[3]}), .dec_out(shftadd3F7_out));
bindec3 shftadd3F6(.bin_in ({shftadd3E6_out[2:0], shftadd3E5_out[3]}), .dec_out(shftadd3F6_out));
bindec3 shftadd3F5(.bin_in ({shftadd3E5_out[2:0], shftadd3E4_out[3]}), .dec_out(shftadd3F5_out));
bindec3 shftadd3F4(.bin_in ({shftadd3E4_out[2:0], shftadd3E3_out[3]}), .dec_out(shftadd3F4_out));
bindec3 shftadd3F3(.bin_in ({shftadd3E3_out[2:0], shftadd3E2_out[3]}), .dec_out(shftadd3F3_out));
bindec3 shftadd3F2(.bin_in ({shftadd3E2_out[2:0], shftadd3E1_out[3]}), .dec_out(shftadd3F2_out));
bindec3 shftadd3F1(.bin_in ({shftadd3E1_out[2:0], shftadd3E0_out[3]}), .dec_out(shftadd3F1_out));
bindec3 shftadd3F0(.bin_in ({shftadd3E0_out[2:0], stage5in[20]}), .dec_out(shftadd3F0_out));

bindec3 shftadd3GF(.bin_in ({shftadd3FF_out[2:0], shftadd3FE_out[3]}), .dec_out(shftadd3GF_out));
bindec3 shftadd3GE(.bin_in ({shftadd3FE_out[2:0], shftadd3FD_out[3]}), .dec_out(shftadd3GE_out));
bindec3 shftadd3GD(.bin_in ({shftadd3FD_out[2:0], shftadd3FC_out[3]}), .dec_out(shftadd3GD_out));
bindec3 shftadd3GC(.bin_in ({shftadd3FC_out[2:0], shftadd3FB_out[3]}), .dec_out(shftadd3GC_out));
bindec3 shftadd3GB(.bin_in ({shftadd3FB_out[2:0], shftadd3FA_out[3]}), .dec_out(shftadd3GB_out));
bindec3 shftadd3GA(.bin_in ({shftadd3FA_out[2:0], shftadd3F9_out[3]}), .dec_out(shftadd3GA_out));
bindec3 shftadd3G9(.bin_in ({shftadd3F9_out[2:0], shftadd3F8_out[3]}), .dec_out(shftadd3G9_out));
bindec3 shftadd3G8(.bin_in ({shftadd3F8_out[2:0], shftadd3F7_out[3]}), .dec_out(shftadd3G8_out));
bindec3 shftadd3G7(.bin_in ({shftadd3F7_out[2:0], shftadd3F6_out[3]}), .dec_out(shftadd3G7_out));
bindec3 shftadd3G6(.bin_in ({shftadd3F6_out[2:0], shftadd3F5_out[3]}), .dec_out(shftadd3G6_out));
bindec3 shftadd3G5(.bin_in ({shftadd3F5_out[2:0], shftadd3F4_out[3]}), .dec_out(shftadd3G5_out));
bindec3 shftadd3G4(.bin_in ({shftadd3F4_out[2:0], shftadd3F3_out[3]}), .dec_out(shftadd3G4_out));
bindec3 shftadd3G3(.bin_in ({shftadd3F3_out[2:0], shftadd3F2_out[3]}), .dec_out(shftadd3G3_out));
bindec3 shftadd3G2(.bin_in ({shftadd3F2_out[2:0], shftadd3F1_out[3]}), .dec_out(shftadd3G2_out));
bindec3 shftadd3G1(.bin_in ({shftadd3F1_out[2:0], shftadd3F0_out[3]}), .dec_out(shftadd3G1_out));
bindec3 shftadd3G0(.bin_in ({shftadd3F0_out[2:0], stage5in[19]}), .dec_out(shftadd3G0_out));

bindec3 shftadd3HF(.bin_in ({shftadd3GF_out[2:0], shftadd3GE_out[3]}), .dec_out(shftadd3HF_out));
bindec3 shftadd3HE(.bin_in ({shftadd3GE_out[2:0], shftadd3GD_out[3]}), .dec_out(shftadd3HE_out));
bindec3 shftadd3HD(.bin_in ({shftadd3GD_out[2:0], shftadd3GC_out[3]}), .dec_out(shftadd3HD_out));
bindec3 shftadd3HC(.bin_in ({shftadd3GC_out[2:0], shftadd3GB_out[3]}), .dec_out(shftadd3HC_out));
bindec3 shftadd3HB(.bin_in ({shftadd3GB_out[2:0], shftadd3GA_out[3]}), .dec_out(shftadd3HB_out));
bindec3 shftadd3HA(.bin_in ({shftadd3GA_out[2:0], shftadd3G9_out[3]}), .dec_out(shftadd3HA_out));
bindec3 shftadd3H9(.bin_in ({shftadd3G9_out[2:0], shftadd3G8_out[3]}), .dec_out(shftadd3H9_out));
bindec3 shftadd3H8(.bin_in ({shftadd3G8_out[2:0], shftadd3G7_out[3]}), .dec_out(shftadd3H8_out));
bindec3 shftadd3H7(.bin_in ({shftadd3G7_out[2:0], shftadd3G6_out[3]}), .dec_out(shftadd3H7_out));
bindec3 shftadd3H6(.bin_in ({shftadd3G6_out[2:0], shftadd3G5_out[3]}), .dec_out(shftadd3H6_out));
bindec3 shftadd3H5(.bin_in ({shftadd3G5_out[2:0], shftadd3G4_out[3]}), .dec_out(shftadd3H5_out));
bindec3 shftadd3H4(.bin_in ({shftadd3G4_out[2:0], shftadd3G3_out[3]}), .dec_out(shftadd3H4_out));
bindec3 shftadd3H3(.bin_in ({shftadd3G3_out[2:0], shftadd3G2_out[3]}), .dec_out(shftadd3H3_out));
bindec3 shftadd3H2(.bin_in ({shftadd3G2_out[2:0], shftadd3G1_out[3]}), .dec_out(shftadd3H2_out));
bindec3 shftadd3H1(.bin_in ({shftadd3G1_out[2:0], shftadd3G0_out[3]}), .dec_out(shftadd3H1_out));
bindec3 shftadd3H0(.bin_in ({shftadd3G0_out[2:0], stage5in[18]}), .dec_out(shftadd3H0_out));

//stage 14
always @(posedge CLK) 
    if (RESET) stage5out <= 0;
    else stage5out <= {shftadd3FF_out[3],
                       shftadd3GF_out[3],
                       shftadd3HF_out[3:0],
                       shftadd3HE_out[3:0],
                       shftadd3HD_out[3:0],
                       shftadd3HC_out[3:0],
                       shftadd3HB_out[3:0],
                       shftadd3HA_out[3:0],
                       shftadd3H9_out[3:0],
                       shftadd3H8_out[3:0],
                       shftadd3H7_out[3:0],
                       shftadd3H6_out[3:0],
                       shftadd3H5_out[3:0],
                       shftadd3H4_out[3:0],
                       shftadd3H3_out[3:0],
                       shftadd3H2_out[3:0],
                       shftadd3H1_out[3:0],
                       shftadd3H0_out[3:0],
                       stage5in[17:0]
                       };
endmodule
