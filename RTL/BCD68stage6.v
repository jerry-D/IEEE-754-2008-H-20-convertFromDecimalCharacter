//BCD68stage6.v
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

module BCD68stage6(
    CLK,
    RESET,
    stage6in,
    stage6out
); 
input RESET;   
input CLK;
input[83:0] stage6in;
output[86:0] stage6out;

reg [86:0] stage6out;

wire [3:0] shftadd3IG_out;
wire [3:0] shftadd3IF_out;
wire [3:0] shftadd3IE_out;
wire [3:0] shftadd3ID_out;
wire [3:0] shftadd3IC_out;
wire [3:0] shftadd3IB_out;
wire [3:0] shftadd3IA_out;
wire [3:0] shftadd3I9_out;
wire [3:0] shftadd3I8_out;
wire [3:0] shftadd3I7_out;
wire [3:0] shftadd3I6_out;
wire [3:0] shftadd3I5_out;
wire [3:0] shftadd3I4_out;                               
wire [3:0] shftadd3I3_out;
wire [3:0] shftadd3I2_out;
wire [3:0] shftadd3I1_out;
wire [3:0] shftadd3I0_out;

wire [3:0] shftadd3JG_out;
wire [3:0] shftadd3JF_out;
wire [3:0] shftadd3JE_out;
wire [3:0] shftadd3JD_out;
wire [3:0] shftadd3JC_out;
wire [3:0] shftadd3JB_out;
wire [3:0] shftadd3JA_out;
wire [3:0] shftadd3J9_out;
wire [3:0] shftadd3J8_out;
wire [3:0] shftadd3J7_out;
wire [3:0] shftadd3J6_out;
wire [3:0] shftadd3J5_out;
wire [3:0] shftadd3J4_out;                               
wire [3:0] shftadd3J3_out;
wire [3:0] shftadd3J2_out;
wire [3:0] shftadd3J1_out;
wire [3:0] shftadd3J0_out;

wire [3:0] shftadd3KG_out;
wire [3:0] shftadd3KF_out;
wire [3:0] shftadd3KE_out;
wire [3:0] shftadd3KD_out;
wire [3:0] shftadd3KC_out;
wire [3:0] shftadd3KB_out;
wire [3:0] shftadd3KA_out;
wire [3:0] shftadd3K9_out;
wire [3:0] shftadd3K8_out;
wire [3:0] shftadd3K7_out;
wire [3:0] shftadd3K6_out;
wire [3:0] shftadd3K5_out;
wire [3:0] shftadd3K4_out;                               
wire [3:0] shftadd3K3_out;
wire [3:0] shftadd3K2_out;
wire [3:0] shftadd3K1_out;
wire [3:0] shftadd3K0_out;

wire [3:0] shftadd3LH_out;
wire [3:0] shftadd3LG_out;
wire [3:0] shftadd3LF_out;
wire [3:0] shftadd3LE_out;
wire [3:0] shftadd3LD_out;
wire [3:0] shftadd3LC_out;
wire [3:0] shftadd3LB_out;
wire [3:0] shftadd3LA_out;
wire [3:0] shftadd3L9_out;
wire [3:0] shftadd3L8_out;
wire [3:0] shftadd3L7_out;
wire [3:0] shftadd3L6_out;
wire [3:0] shftadd3L5_out;
wire [3:0] shftadd3L4_out;                               
wire [3:0] shftadd3L3_out;
wire [3:0] shftadd3L2_out;
wire [3:0] shftadd3L1_out;
wire [3:0] shftadd3L0_out;

wire [3:0] shftadd3MH_out;
wire [3:0] shftadd3MG_out;
wire [3:0] shftadd3MF_out;
wire [3:0] shftadd3ME_out;
wire [3:0] shftadd3MD_out;
wire [3:0] shftadd3MC_out;
wire [3:0] shftadd3MB_out;
wire [3:0] shftadd3MA_out;
wire [3:0] shftadd3M9_out;
wire [3:0] shftadd3M8_out;
wire [3:0] shftadd3M7_out;
wire [3:0] shftadd3M6_out;
wire [3:0] shftadd3M5_out;
wire [3:0] shftadd3M4_out;                               
wire [3:0] shftadd3M3_out;
wire [3:0] shftadd3M2_out;
wire [3:0] shftadd3M1_out;
wire [3:0] shftadd3M0_out;

wire [3:0] shftadd3NH_out;
wire [3:0] shftadd3NG_out;
wire [3:0] shftadd3NF_out;
wire [3:0] shftadd3NE_out;
wire [3:0] shftadd3ND_out;
wire [3:0] shftadd3NC_out;
wire [3:0] shftadd3NB_out;
wire [3:0] shftadd3NA_out;
wire [3:0] shftadd3N9_out;
wire [3:0] shftadd3N8_out;
wire [3:0] shftadd3N7_out;
wire [3:0] shftadd3N6_out;
wire [3:0] shftadd3N5_out;
wire [3:0] shftadd3N4_out;                               
wire [3:0] shftadd3N3_out;
wire [3:0] shftadd3N2_out;
wire [3:0] shftadd3N1_out;
wire [3:0] shftadd3N0_out;

wire [3:0] shftadd3oI_out;
wire [3:0] shftadd3oH_out;
wire [3:0] shftadd3oG_out;
wire [3:0] shftadd3oF_out;
wire [3:0] shftadd3oE_out;
wire [3:0] shftadd3oD_out;
wire [3:0] shftadd3oC_out;
wire [3:0] shftadd3oB_out;
wire [3:0] shftadd3oA_out;
wire [3:0] shftadd3o9_out;
wire [3:0] shftadd3o8_out;
wire [3:0] shftadd3o7_out;
wire [3:0] shftadd3o6_out;
wire [3:0] shftadd3o5_out;
wire [3:0] shftadd3o4_out;                               
wire [3:0] shftadd3o3_out;
wire [3:0] shftadd3o2_out;
wire [3:0] shftadd3o1_out;
wire [3:0] shftadd3o0_out;

wire [3:0] shftadd3PI_out;
wire [3:0] shftadd3PH_out;
wire [3:0] shftadd3PG_out;
wire [3:0] shftadd3PF_out;
wire [3:0] shftadd3PE_out;
wire [3:0] shftadd3PD_out;
wire [3:0] shftadd3PC_out;
wire [3:0] shftadd3PB_out;
wire [3:0] shftadd3PA_out;
wire [3:0] shftadd3P9_out;
wire [3:0] shftadd3P8_out;
wire [3:0] shftadd3P7_out;
wire [3:0] shftadd3P6_out;
wire [3:0] shftadd3P5_out;
wire [3:0] shftadd3P4_out;                               
wire [3:0] shftadd3P3_out;
wire [3:0] shftadd3P2_out;
wire [3:0] shftadd3P1_out;
wire [3:0] shftadd3P0_out;

bindec3 shftadd3IG(.bin_in ({1'b0, stage6in[83:81]}), .dec_out(shftadd3IG_out));
bindec3 shftadd3IF(.bin_in (stage6in[80:77]), .dec_out(shftadd3IF_out));
bindec3 shftadd3IE(.bin_in (stage6in[76:73]), .dec_out(shftadd3IE_out));
bindec3 shftadd3ID(.bin_in (stage6in[72:69]), .dec_out(shftadd3ID_out));
bindec3 shftadd3IC(.bin_in (stage6in[68:65]), .dec_out(shftadd3IC_out));
bindec3 shftadd3IB(.bin_in (stage6in[64:61]), .dec_out(shftadd3IB_out));
bindec3 shftadd3IA(.bin_in (stage6in[60:57]), .dec_out(shftadd3IA_out));
bindec3 shftadd3I9(.bin_in (stage6in[56:53]), .dec_out(shftadd3I9_out));
bindec3 shftadd3I8(.bin_in (stage6in[52:49]), .dec_out(shftadd3I8_out));
bindec3 shftadd3I7(.bin_in (stage6in[48:45]), .dec_out(shftadd3I7_out));
bindec3 shftadd3I6(.bin_in (stage6in[44:41]), .dec_out(shftadd3I6_out));
bindec3 shftadd3I5(.bin_in (stage6in[40:37]), .dec_out(shftadd3I5_out));
bindec3 shftadd3I4(.bin_in (stage6in[36:33]), .dec_out(shftadd3I4_out));
bindec3 shftadd3I3(.bin_in (stage6in[32:29]), .dec_out(shftadd3I3_out));
bindec3 shftadd3I2(.bin_in (stage6in[28:25]), .dec_out(shftadd3I2_out));
bindec3 shftadd3I1(.bin_in (stage6in[24:21]), .dec_out(shftadd3I1_out));
bindec3 shftadd3I0(.bin_in (stage6in[20:17]), .dec_out(shftadd3I0_out));

bindec3 shftadd3JG(.bin_in ({shftadd3IG_out[2:0], shftadd3IF_out[3]}), .dec_out(shftadd3JG_out));
bindec3 shftadd3JF(.bin_in ({shftadd3IF_out[2:0], shftadd3IE_out[3]}), .dec_out(shftadd3JF_out));
bindec3 shftadd3JE(.bin_in ({shftadd3IE_out[2:0], shftadd3ID_out[3]}), .dec_out(shftadd3JE_out));
bindec3 shftadd3JD(.bin_in ({shftadd3ID_out[2:0], shftadd3IC_out[3]}), .dec_out(shftadd3JD_out));
bindec3 shftadd3JC(.bin_in ({shftadd3IC_out[2:0], shftadd3IB_out[3]}), .dec_out(shftadd3JC_out));
bindec3 shftadd3JB(.bin_in ({shftadd3IB_out[2:0], shftadd3IA_out[3]}), .dec_out(shftadd3JB_out));
bindec3 shftadd3JA(.bin_in ({shftadd3IA_out[2:0], shftadd3I9_out[3]}), .dec_out(shftadd3JA_out));
bindec3 shftadd3J9(.bin_in ({shftadd3I9_out[2:0], shftadd3I8_out[3]}), .dec_out(shftadd3J9_out));
bindec3 shftadd3J8(.bin_in ({shftadd3I8_out[2:0], shftadd3I7_out[3]}), .dec_out(shftadd3J8_out));
bindec3 shftadd3J7(.bin_in ({shftadd3I7_out[2:0], shftadd3I6_out[3]}), .dec_out(shftadd3J7_out));
bindec3 shftadd3J6(.bin_in ({shftadd3I6_out[2:0], shftadd3I5_out[3]}), .dec_out(shftadd3J6_out));
bindec3 shftadd3J5(.bin_in ({shftadd3I5_out[2:0], shftadd3I4_out[3]}), .dec_out(shftadd3J5_out));
bindec3 shftadd3J4(.bin_in ({shftadd3I4_out[2:0], shftadd3I3_out[3]}), .dec_out(shftadd3J4_out));
bindec3 shftadd3J3(.bin_in ({shftadd3I3_out[2:0], shftadd3I2_out[3]}), .dec_out(shftadd3J3_out));
bindec3 shftadd3J2(.bin_in ({shftadd3I2_out[2:0], shftadd3I1_out[3]}), .dec_out(shftadd3J2_out));
bindec3 shftadd3J1(.bin_in ({shftadd3I1_out[2:0], shftadd3I0_out[3]}), .dec_out(shftadd3J1_out));
bindec3 shftadd3J0(.bin_in ({shftadd3I0_out[2:0], stage6in[16]}),      .dec_out(shftadd3J0_out));

bindec3 shftadd3KG(.bin_in ({shftadd3JG_out[2:0], shftadd3JF_out[3]}), .dec_out(shftadd3KG_out));
bindec3 shftadd3KF(.bin_in ({shftadd3JF_out[2:0], shftadd3JE_out[3]}), .dec_out(shftadd3KF_out));
bindec3 shftadd3KE(.bin_in ({shftadd3JE_out[2:0], shftadd3JD_out[3]}), .dec_out(shftadd3KE_out));
bindec3 shftadd3KD(.bin_in ({shftadd3JD_out[2:0], shftadd3JC_out[3]}), .dec_out(shftadd3KD_out));
bindec3 shftadd3KC(.bin_in ({shftadd3JC_out[2:0], shftadd3JB_out[3]}), .dec_out(shftadd3KC_out));
bindec3 shftadd3KB(.bin_in ({shftadd3JB_out[2:0], shftadd3JA_out[3]}), .dec_out(shftadd3KB_out));
bindec3 shftadd3KA(.bin_in ({shftadd3JA_out[2:0], shftadd3J9_out[3]}), .dec_out(shftadd3KA_out));
bindec3 shftadd3K9(.bin_in ({shftadd3J9_out[2:0], shftadd3J8_out[3]}), .dec_out(shftadd3K9_out));
bindec3 shftadd3K8(.bin_in ({shftadd3J8_out[2:0], shftadd3J7_out[3]}), .dec_out(shftadd3K8_out));
bindec3 shftadd3K7(.bin_in ({shftadd3J7_out[2:0], shftadd3J6_out[3]}), .dec_out(shftadd3K7_out));
bindec3 shftadd3K6(.bin_in ({shftadd3J6_out[2:0], shftadd3J5_out[3]}), .dec_out(shftadd3K6_out));
bindec3 shftadd3K5(.bin_in ({shftadd3J5_out[2:0], shftadd3J4_out[3]}), .dec_out(shftadd3K5_out));
bindec3 shftadd3K4(.bin_in ({shftadd3J4_out[2:0], shftadd3J3_out[3]}), .dec_out(shftadd3K4_out));
bindec3 shftadd3K3(.bin_in ({shftadd3J3_out[2:0], shftadd3J2_out[3]}), .dec_out(shftadd3K3_out));
bindec3 shftadd3K2(.bin_in ({shftadd3J2_out[2:0], shftadd3J1_out[3]}), .dec_out(shftadd3K2_out));
bindec3 shftadd3K1(.bin_in ({shftadd3J1_out[2:0], shftadd3J0_out[3]}), .dec_out(shftadd3K1_out));
bindec3 shftadd3K0(.bin_in ({shftadd3J0_out[2:0], stage6in[15]}),      .dec_out(shftadd3K0_out));

bindec3 shftadd3LH(.bin_in ({1'b0, shftadd3IG_out[3], shftadd3JG_out[3], shftadd3KG_out[3]}), .dec_out(shftadd3LH_out));
bindec3 shftadd3LG(.bin_in ({shftadd3KG_out[2:0], shftadd3KF_out[3]}), .dec_out(shftadd3LG_out));
bindec3 shftadd3LF(.bin_in ({shftadd3KF_out[2:0], shftadd3KE_out[3]}), .dec_out(shftadd3LF_out));
bindec3 shftadd3LE(.bin_in ({shftadd3KE_out[2:0], shftadd3KD_out[3]}), .dec_out(shftadd3LE_out));
bindec3 shftadd3LD(.bin_in ({shftadd3KD_out[2:0], shftadd3KC_out[3]}), .dec_out(shftadd3LD_out));
bindec3 shftadd3LC(.bin_in ({shftadd3KC_out[2:0], shftadd3KB_out[3]}), .dec_out(shftadd3LC_out));
bindec3 shftadd3LB(.bin_in ({shftadd3KB_out[2:0], shftadd3KA_out[3]}), .dec_out(shftadd3LB_out));
bindec3 shftadd3LA(.bin_in ({shftadd3KA_out[2:0], shftadd3K9_out[3]}), .dec_out(shftadd3LA_out));
bindec3 shftadd3L9(.bin_in ({shftadd3K9_out[2:0], shftadd3K8_out[3]}), .dec_out(shftadd3L9_out));
bindec3 shftadd3L8(.bin_in ({shftadd3K8_out[2:0], shftadd3K7_out[3]}), .dec_out(shftadd3L8_out));
bindec3 shftadd3L7(.bin_in ({shftadd3K7_out[2:0], shftadd3K6_out[3]}), .dec_out(shftadd3L7_out));
bindec3 shftadd3L6(.bin_in ({shftadd3K6_out[2:0], shftadd3K5_out[3]}), .dec_out(shftadd3L6_out));
bindec3 shftadd3L5(.bin_in ({shftadd3K5_out[2:0], shftadd3K4_out[3]}), .dec_out(shftadd3L5_out));
bindec3 shftadd3L4(.bin_in ({shftadd3K4_out[2:0], shftadd3K3_out[3]}), .dec_out(shftadd3L4_out));
bindec3 shftadd3L3(.bin_in ({shftadd3K3_out[2:0], shftadd3K2_out[3]}), .dec_out(shftadd3L3_out));
bindec3 shftadd3L2(.bin_in ({shftadd3K2_out[2:0], shftadd3K1_out[3]}), .dec_out(shftadd3L2_out));
bindec3 shftadd3L1(.bin_in ({shftadd3K1_out[2:0], shftadd3K0_out[3]}), .dec_out(shftadd3L1_out));
bindec3 shftadd3L0(.bin_in ({shftadd3K0_out[2:0], stage6in[14]}),      .dec_out(shftadd3L0_out));

bindec3 shftadd3MH(.bin_in ({shftadd3LH_out[2:0], shftadd3LG_out[3]}), .dec_out(shftadd3MH_out));
bindec3 shftadd3MG(.bin_in ({shftadd3LG_out[2:0], shftadd3LF_out[3]}), .dec_out(shftadd3MG_out));
bindec3 shftadd3MF(.bin_in ({shftadd3LF_out[2:0], shftadd3LE_out[3]}), .dec_out(shftadd3MF_out));
bindec3 shftadd3ME(.bin_in ({shftadd3LE_out[2:0], shftadd3LD_out[3]}), .dec_out(shftadd3ME_out));
bindec3 shftadd3MD(.bin_in ({shftadd3LD_out[2:0], shftadd3LC_out[3]}), .dec_out(shftadd3MD_out));
bindec3 shftadd3MC(.bin_in ({shftadd3LC_out[2:0], shftadd3LB_out[3]}), .dec_out(shftadd3MC_out));
bindec3 shftadd3MB(.bin_in ({shftadd3LB_out[2:0], shftadd3LA_out[3]}), .dec_out(shftadd3MB_out));
bindec3 shftadd3MA(.bin_in ({shftadd3LA_out[2:0], shftadd3L9_out[3]}), .dec_out(shftadd3MA_out));
bindec3 shftadd3M9(.bin_in ({shftadd3L9_out[2:0], shftadd3L8_out[3]}), .dec_out(shftadd3M9_out));
bindec3 shftadd3M8(.bin_in ({shftadd3L8_out[2:0], shftadd3L7_out[3]}), .dec_out(shftadd3M8_out));
bindec3 shftadd3M7(.bin_in ({shftadd3L7_out[2:0], shftadd3L6_out[3]}), .dec_out(shftadd3M7_out));
bindec3 shftadd3M6(.bin_in ({shftadd3L6_out[2:0], shftadd3L5_out[3]}), .dec_out(shftadd3M6_out));
bindec3 shftadd3M5(.bin_in ({shftadd3L5_out[2:0], shftadd3L4_out[3]}), .dec_out(shftadd3M5_out));
bindec3 shftadd3M4(.bin_in ({shftadd3L4_out[2:0], shftadd3L3_out[3]}), .dec_out(shftadd3M4_out));
bindec3 shftadd3M3(.bin_in ({shftadd3L3_out[2:0], shftadd3L2_out[3]}), .dec_out(shftadd3M3_out));
bindec3 shftadd3M2(.bin_in ({shftadd3L2_out[2:0], shftadd3L1_out[3]}), .dec_out(shftadd3M2_out));
bindec3 shftadd3M1(.bin_in ({shftadd3L1_out[2:0], shftadd3L0_out[3]}), .dec_out(shftadd3M1_out));
bindec3 shftadd3M0(.bin_in ({shftadd3L0_out[2:0], stage6in[13]}),      .dec_out(shftadd3M0_out));

bindec3 shftadd3NH(.bin_in ({shftadd3MH_out[2:0], shftadd3MG_out[3]}), .dec_out(shftadd3NH_out));
bindec3 shftadd3NG(.bin_in ({shftadd3MG_out[2:0], shftadd3MF_out[3]}), .dec_out(shftadd3NG_out));
bindec3 shftadd3NF(.bin_in ({shftadd3MF_out[2:0], shftadd3ME_out[3]}), .dec_out(shftadd3NF_out));
bindec3 shftadd3NE(.bin_in ({shftadd3ME_out[2:0], shftadd3MD_out[3]}), .dec_out(shftadd3NE_out));
bindec3 shftadd3ND(.bin_in ({shftadd3MD_out[2:0], shftadd3MC_out[3]}), .dec_out(shftadd3ND_out));
bindec3 shftadd3NC(.bin_in ({shftadd3MC_out[2:0], shftadd3MB_out[3]}), .dec_out(shftadd3NC_out));
bindec3 shftadd3NB(.bin_in ({shftadd3MB_out[2:0], shftadd3MA_out[3]}), .dec_out(shftadd3NB_out));
bindec3 shftadd3NA(.bin_in ({shftadd3MA_out[2:0], shftadd3M9_out[3]}), .dec_out(shftadd3NA_out));
bindec3 shftadd3N9(.bin_in ({shftadd3M9_out[2:0], shftadd3M8_out[3]}), .dec_out(shftadd3N9_out));
bindec3 shftadd3N8(.bin_in ({shftadd3M8_out[2:0], shftadd3M7_out[3]}), .dec_out(shftadd3N8_out));
bindec3 shftadd3N7(.bin_in ({shftadd3M7_out[2:0], shftadd3M6_out[3]}), .dec_out(shftadd3N7_out));
bindec3 shftadd3N6(.bin_in ({shftadd3M6_out[2:0], shftadd3M5_out[3]}), .dec_out(shftadd3N6_out));
bindec3 shftadd3N5(.bin_in ({shftadd3M5_out[2:0], shftadd3M4_out[3]}), .dec_out(shftadd3N5_out));
bindec3 shftadd3N4(.bin_in ({shftadd3M4_out[2:0], shftadd3M3_out[3]}), .dec_out(shftadd3N4_out));
bindec3 shftadd3N3(.bin_in ({shftadd3M3_out[2:0], shftadd3M2_out[3]}), .dec_out(shftadd3N3_out));
bindec3 shftadd3N2(.bin_in ({shftadd3M2_out[2:0], shftadd3M1_out[3]}), .dec_out(shftadd3N2_out));
bindec3 shftadd3N1(.bin_in ({shftadd3M1_out[2:0], shftadd3M0_out[3]}), .dec_out(shftadd3N1_out));
bindec3 shftadd3N0(.bin_in ({shftadd3M0_out[2:0], stage6in[12]}),      .dec_out(shftadd3N0_out));

bindec3 shftadd3oI(.bin_in ({1'b0, shftadd3LH_out[3], shftadd3MH_out[3], shftadd3NH_out[3]}), .dec_out(shftadd3oI_out));
bindec3 shftadd3oH(.bin_in ({shftadd3NH_out[2:0], shftadd3NG_out[3]}), .dec_out(shftadd3oH_out));
bindec3 shftadd3oG(.bin_in ({shftadd3NG_out[2:0], shftadd3NF_out[3]}), .dec_out(shftadd3oG_out));
bindec3 shftadd3oF(.bin_in ({shftadd3NF_out[2:0], shftadd3NE_out[3]}), .dec_out(shftadd3oF_out));
bindec3 shftadd3oE(.bin_in ({shftadd3NE_out[2:0], shftadd3ND_out[3]}), .dec_out(shftadd3oE_out));
bindec3 shftadd3oD(.bin_in ({shftadd3ND_out[2:0], shftadd3NC_out[3]}), .dec_out(shftadd3oD_out));
bindec3 shftadd3oC(.bin_in ({shftadd3NC_out[2:0], shftadd3NB_out[3]}), .dec_out(shftadd3oC_out));
bindec3 shftadd3oB(.bin_in ({shftadd3NB_out[2:0], shftadd3NA_out[3]}), .dec_out(shftadd3oB_out));
bindec3 shftadd3oA(.bin_in ({shftadd3NA_out[2:0], shftadd3N9_out[3]}), .dec_out(shftadd3oA_out));
bindec3 shftadd3o9(.bin_in ({shftadd3N9_out[2:0], shftadd3N8_out[3]}), .dec_out(shftadd3o9_out));
bindec3 shftadd3o8(.bin_in ({shftadd3N8_out[2:0], shftadd3N7_out[3]}), .dec_out(shftadd3o8_out));
bindec3 shftadd3o7(.bin_in ({shftadd3N7_out[2:0], shftadd3N6_out[3]}), .dec_out(shftadd3o7_out));
bindec3 shftadd3o6(.bin_in ({shftadd3N6_out[2:0], shftadd3N5_out[3]}), .dec_out(shftadd3o6_out));
bindec3 shftadd3o5(.bin_in ({shftadd3N5_out[2:0], shftadd3N4_out[3]}), .dec_out(shftadd3o5_out));
bindec3 shftadd3o4(.bin_in ({shftadd3N4_out[2:0], shftadd3N3_out[3]}), .dec_out(shftadd3o4_out));
bindec3 shftadd3o3(.bin_in ({shftadd3N3_out[2:0], shftadd3N2_out[3]}), .dec_out(shftadd3o3_out));
bindec3 shftadd3o2(.bin_in ({shftadd3N2_out[2:0], shftadd3N1_out[3]}), .dec_out(shftadd3o2_out));
bindec3 shftadd3o1(.bin_in ({shftadd3N1_out[2:0], shftadd3N0_out[3]}), .dec_out(shftadd3o1_out));
bindec3 shftadd3o0(.bin_in ({shftadd3N0_out[2:0], stage6in[11]}),      .dec_out(shftadd3o0_out));

bindec3 shftadd3PI(.bin_in ({shftadd3oI_out[2:0], shftadd3oH_out[3]}), .dec_out(shftadd3PI_out));
bindec3 shftadd3PH(.bin_in ({shftadd3oH_out[2:0], shftadd3oG_out[3]}), .dec_out(shftadd3PH_out));
bindec3 shftadd3PG(.bin_in ({shftadd3oG_out[2:0], shftadd3oF_out[3]}), .dec_out(shftadd3PG_out));
bindec3 shftadd3PF(.bin_in ({shftadd3oF_out[2:0], shftadd3oE_out[3]}), .dec_out(shftadd3PF_out));
bindec3 shftadd3PE(.bin_in ({shftadd3oE_out[2:0], shftadd3oD_out[3]}), .dec_out(shftadd3PE_out));
bindec3 shftadd3PD(.bin_in ({shftadd3oD_out[2:0], shftadd3oC_out[3]}), .dec_out(shftadd3PD_out));
bindec3 shftadd3PC(.bin_in ({shftadd3oC_out[2:0], shftadd3oB_out[3]}), .dec_out(shftadd3PC_out));
bindec3 shftadd3PB(.bin_in ({shftadd3oB_out[2:0], shftadd3oA_out[3]}), .dec_out(shftadd3PB_out));
bindec3 shftadd3PA(.bin_in ({shftadd3oA_out[2:0], shftadd3o9_out[3]}), .dec_out(shftadd3PA_out));
bindec3 shftadd3P9(.bin_in ({shftadd3o9_out[2:0], shftadd3o8_out[3]}), .dec_out(shftadd3P9_out));
bindec3 shftadd3P8(.bin_in ({shftadd3o8_out[2:0], shftadd3o7_out[3]}), .dec_out(shftadd3P8_out));
bindec3 shftadd3P7(.bin_in ({shftadd3o7_out[2:0], shftadd3o6_out[3]}), .dec_out(shftadd3P7_out));
bindec3 shftadd3P6(.bin_in ({shftadd3o6_out[2:0], shftadd3o5_out[3]}), .dec_out(shftadd3P6_out));
bindec3 shftadd3P5(.bin_in ({shftadd3o5_out[2:0], shftadd3o4_out[3]}), .dec_out(shftadd3P5_out));
bindec3 shftadd3P4(.bin_in ({shftadd3o4_out[2:0], shftadd3o3_out[3]}), .dec_out(shftadd3P4_out));
bindec3 shftadd3P3(.bin_in ({shftadd3o3_out[2:0], shftadd3o2_out[3]}), .dec_out(shftadd3P3_out));
bindec3 shftadd3P2(.bin_in ({shftadd3o2_out[2:0], shftadd3o1_out[3]}), .dec_out(shftadd3P2_out));
bindec3 shftadd3P1(.bin_in ({shftadd3o1_out[2:0], shftadd3o0_out[3]}), .dec_out(shftadd3P1_out));
bindec3 shftadd3P0(.bin_in ({shftadd3o0_out[2:0], stage6in[10]}),      .dec_out(shftadd3P0_out));

//stage 15
always @(posedge CLK) 
    if (RESET) stage6out <= 0;
    else stage6out <= {shftadd3oI_out[3],
                       shftadd3PI_out,
                       shftadd3PH_out,
                       shftadd3PG_out,
                       shftadd3PF_out,
                       shftadd3PE_out,
                       shftadd3PD_out,
                       shftadd3PC_out,
                       shftadd3PB_out,
                       shftadd3PA_out,
                       shftadd3P9_out,
                       shftadd3P8_out,
                       shftadd3P7_out,
                       shftadd3P6_out,
                       shftadd3P5_out,
                       shftadd3P4_out,
                       shftadd3P3_out,
                       shftadd3P2_out,
                       shftadd3P1_out,
                       shftadd3P0_out,
                       stage6in[9:0]
                       };
                                    
endmodule
