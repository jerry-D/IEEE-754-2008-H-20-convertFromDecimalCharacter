//BCD68stage7.v
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

module BCD68stage7(
    CLK,
    RESET,
    stage7in,
    stage7out
);    

input CLK;
input RESET;
input[86:0] stage7in;
output[83:0] stage7out;

reg [80:0] stage7outq;

wire [83:0] stage7out;

wire [3:0] shftadd3QI_out;
wire [3:0] shftadd3QH_out;
wire [3:0] shftadd3QG_out;
wire [3:0] shftadd3QF_out;
wire [3:0] shftadd3QE_out;
wire [3:0] shftadd3QD_out;
wire [3:0] shftadd3QC_out;
wire [3:0] shftadd3QB_out;
wire [3:0] shftadd3QA_out;
wire [3:0] shftadd3Q9_out;
wire [3:0] shftadd3Q8_out;
wire [3:0] shftadd3Q7_out;
wire [3:0] shftadd3Q6_out;
wire [3:0] shftadd3Q5_out;
wire [3:0] shftadd3Q4_out;                               
wire [3:0] shftadd3Q3_out;
wire [3:0] shftadd3Q2_out;
wire [3:0] shftadd3Q1_out;
wire [3:0] shftadd3Q0_out;

wire [3:0] shftadd3RJ_out;
wire [3:0] shftadd3RI_out;
wire [3:0] shftadd3RH_out;
wire [3:0] shftadd3RG_out;
wire [3:0] shftadd3RF_out;
wire [3:0] shftadd3RE_out;
wire [3:0] shftadd3RD_out;
wire [3:0] shftadd3RC_out;
wire [3:0] shftadd3RB_out;
wire [3:0] shftadd3RA_out;
wire [3:0] shftadd3R9_out;
wire [3:0] shftadd3R8_out;
wire [3:0] shftadd3R7_out;
wire [3:0] shftadd3R6_out;
wire [3:0] shftadd3R5_out;
wire [3:0] shftadd3R4_out;                               
wire [3:0] shftadd3R3_out;
wire [3:0] shftadd3R2_out;
wire [3:0] shftadd3R1_out;
wire [3:0] shftadd3R0_out;

wire [3:0] shftadd3SJ_out;
wire [3:0] shftadd3SI_out;
wire [3:0] shftadd3SH_out;
wire [3:0] shftadd3SG_out;
wire [3:0] shftadd3SF_out;
wire [3:0] shftadd3SE_out;
wire [3:0] shftadd3SD_out;
wire [3:0] shftadd3SC_out;
wire [3:0] shftadd3SB_out;
wire [3:0] shftadd3SA_out;
wire [3:0] shftadd3S9_out;
wire [3:0] shftadd3S8_out;
wire [3:0] shftadd3S7_out;
wire [3:0] shftadd3S6_out;
wire [3:0] shftadd3S5_out;
wire [3:0] shftadd3S4_out;                               
wire [3:0] shftadd3S3_out;
wire [3:0] shftadd3S2_out;
wire [3:0] shftadd3S1_out;
wire [3:0] shftadd3S0_out;

wire [3:0] shftadd3TJ_out;
wire [3:0] shftadd3TI_out;
wire [3:0] shftadd3TH_out;
wire [3:0] shftadd3TG_out;
wire [3:0] shftadd3TF_out;
wire [3:0] shftadd3TE_out;
wire [3:0] shftadd3TD_out;
wire [3:0] shftadd3TC_out;
wire [3:0] shftadd3TB_out;
wire [3:0] shftadd3TA_out;
wire [3:0] shftadd3T9_out;
wire [3:0] shftadd3T8_out;
wire [3:0] shftadd3T7_out;
wire [3:0] shftadd3T6_out;
wire [3:0] shftadd3T5_out;
wire [3:0] shftadd3T4_out;                               
wire [3:0] shftadd3T3_out;
wire [3:0] shftadd3T2_out;
wire [3:0] shftadd3T1_out;
wire [3:0] shftadd3T0_out;

wire [3:0] shftadd3UK_out;
wire [3:0] shftadd3UJ_out;
wire [3:0] shftadd3UI_out;
wire [3:0] shftadd3UH_out;
wire [3:0] shftadd3UG_out;
wire [3:0] shftadd3UF_out;
wire [3:0] shftadd3UE_out;
wire [3:0] shftadd3UD_out;
wire [3:0] shftadd3UC_out;
wire [3:0] shftadd3UB_out;
wire [3:0] shftadd3UA_out;
wire [3:0] shftadd3U9_out;
wire [3:0] shftadd3U8_out;
wire [3:0] shftadd3U7_out;
wire [3:0] shftadd3U6_out;
wire [3:0] shftadd3U5_out;
wire [3:0] shftadd3U4_out;                               
wire [3:0] shftadd3U3_out;
wire [3:0] shftadd3U2_out;
wire [3:0] shftadd3U1_out;
wire [3:0] shftadd3U0_out;

wire [3:0] shftadd3VK_out;
wire [3:0] shftadd3VJ_out;
wire [3:0] shftadd3VI_out;
wire [3:0] shftadd3VH_out;
wire [3:0] shftadd3VG_out;
wire [3:0] shftadd3VF_out;
wire [3:0] shftadd3VE_out;
wire [3:0] shftadd3VD_out;
wire [3:0] shftadd3VC_out;
wire [3:0] shftadd3VB_out;
wire [3:0] shftadd3VA_out;
wire [3:0] shftadd3V9_out;
wire [3:0] shftadd3V8_out;
wire [3:0] shftadd3V7_out;
wire [3:0] shftadd3V6_out;
wire [3:0] shftadd3V5_out;
wire [3:0] shftadd3V4_out;                               
wire [3:0] shftadd3V3_out;
wire [3:0] shftadd3V2_out;
wire [3:0] shftadd3V1_out;
wire [3:0] shftadd3V0_out;

wire [3:0] shftadd3WK_out;
wire [3:0] shftadd3WJ_out;
wire [3:0] shftadd3WI_out;
wire [3:0] shftadd3WH_out;
wire [3:0] shftadd3WG_out;
wire [3:0] shftadd3WF_out;
wire [3:0] shftadd3WE_out;
wire [3:0] shftadd3WD_out;
wire [3:0] shftadd3WC_out;
wire [3:0] shftadd3WB_out;
wire [3:0] shftadd3WA_out;
wire [3:0] shftadd3W9_out;
wire [3:0] shftadd3W8_out;
wire [3:0] shftadd3W7_out;
wire [3:0] shftadd3W6_out;
wire [3:0] shftadd3W5_out;
wire [3:0] shftadd3W4_out;                               
wire [3:0] shftadd3W3_out;
wire [3:0] shftadd3W2_out;
wire [3:0] shftadd3W1_out;
wire [3:0] shftadd3W0_out;

wire [3:0] shftadd3XL_out;
wire [3:0] shftadd3XK_out;
wire [3:0] shftadd3XJ_out;
wire [3:0] shftadd3XI_out;
wire [3:0] shftadd3XH_out;
wire [3:0] shftadd3XG_out;
wire [3:0] shftadd3XF_out;
wire [3:0] shftadd3XE_out;
wire [3:0] shftadd3XD_out;
wire [3:0] shftadd3XC_out;
wire [3:0] shftadd3XB_out;
wire [3:0] shftadd3XA_out;
wire [3:0] shftadd3X9_out;
wire [3:0] shftadd3X8_out;
wire [3:0] shftadd3X7_out;
wire [3:0] shftadd3X6_out;
wire [3:0] shftadd3X5_out;
wire [3:0] shftadd3X4_out;
wire [3:0] shftadd3X3_out;
wire [3:0] shftadd3X2_out;
wire [3:0] shftadd3X1_out;
wire [3:0] shftadd3X0_out;

wire [3:0] shftadd3YJ_out;
wire [3:0] shftadd3YI_out;
wire [3:0] shftadd3YH_out;
wire [3:0] shftadd3YG_out;
wire [3:0] shftadd3YF_out;
wire [3:0] shftadd3YE_out;
wire [3:0] shftadd3YD_out;
wire [3:0] shftadd3YC_out;
wire [3:0] shftadd3YB_out;
wire [3:0] shftadd3YA_out;
wire [3:0] shftadd3Y9_out;
wire [3:0] shftadd3Y8_out;
wire [3:0] shftadd3Y7_out;
wire [3:0] shftadd3Y6_out;
wire [3:0] shftadd3Y5_out;
wire [3:0] shftadd3Y4_out;                               
wire [3:0] shftadd3Y3_out;
wire [3:0] shftadd3Y2_out;
wire [3:0] shftadd3Y1_out;
wire [3:0] shftadd3Y0_out;

bindec3 shftadd3QI(.bin_in (stage7in[84:81]), .dec_out(shftadd3QI_out));
bindec3 shftadd3QH(.bin_in (stage7in[80:77]), .dec_out(shftadd3QH_out));
bindec3 shftadd3QG(.bin_in (stage7in[76:73]), .dec_out(shftadd3QG_out));
bindec3 shftadd3QF(.bin_in (stage7in[72:69]), .dec_out(shftadd3QF_out));
bindec3 shftadd3QE(.bin_in (stage7in[68:65]), .dec_out(shftadd3QE_out));
bindec3 shftadd3QD(.bin_in (stage7in[64:61]), .dec_out(shftadd3QD_out));
bindec3 shftadd3QC(.bin_in (stage7in[60:57]), .dec_out(shftadd3QC_out));
bindec3 shftadd3QB(.bin_in (stage7in[56:53]), .dec_out(shftadd3QB_out));
bindec3 shftadd3QA(.bin_in (stage7in[52:49]), .dec_out(shftadd3QA_out));
bindec3 shftadd3Q9(.bin_in (stage7in[48:45]), .dec_out(shftadd3Q9_out));
bindec3 shftadd3Q8(.bin_in (stage7in[44:41]), .dec_out(shftadd3Q8_out));
bindec3 shftadd3Q7(.bin_in (stage7in[40:37]), .dec_out(shftadd3Q7_out));
bindec3 shftadd3Q6(.bin_in (stage7in[36:33]), .dec_out(shftadd3Q6_out));
bindec3 shftadd3Q5(.bin_in (stage7in[32:29]), .dec_out(shftadd3Q5_out));
bindec3 shftadd3Q4(.bin_in (stage7in[28:25]), .dec_out(shftadd3Q4_out));
bindec3 shftadd3Q3(.bin_in (stage7in[24:21]), .dec_out(shftadd3Q3_out));
bindec3 shftadd3Q2(.bin_in (stage7in[20:17]), .dec_out(shftadd3Q2_out));
bindec3 shftadd3Q1(.bin_in (stage7in[16:13]), .dec_out(shftadd3Q1_out));
bindec3 shftadd3Q0(.bin_in (stage7in[12:9]),  .dec_out(shftadd3Q0_out));

bindec3 shftadd3RJ(.bin_in ({1'b0, stage7in[86:85], shftadd3QI_out[3]}), .dec_out(shftadd3RJ_out));
bindec3 shftadd3RI(.bin_in ({shftadd3QI_out[2:0], shftadd3QH_out[3]}), .dec_out(shftadd3RI_out));
bindec3 shftadd3RH(.bin_in ({shftadd3QH_out[2:0], shftadd3QG_out[3]}), .dec_out(shftadd3RH_out));
bindec3 shftadd3RG(.bin_in ({shftadd3QG_out[2:0], shftadd3QF_out[3]}), .dec_out(shftadd3RG_out));
bindec3 shftadd3RF(.bin_in ({shftadd3QF_out[2:0], shftadd3QE_out[3]}), .dec_out(shftadd3RF_out));
bindec3 shftadd3RE(.bin_in ({shftadd3QE_out[2:0], shftadd3QD_out[3]}), .dec_out(shftadd3RE_out));
bindec3 shftadd3RD(.bin_in ({shftadd3QD_out[2:0], shftadd3QC_out[3]}), .dec_out(shftadd3RD_out));
bindec3 shftadd3RC(.bin_in ({shftadd3QC_out[2:0], shftadd3QB_out[3]}), .dec_out(shftadd3RC_out));
bindec3 shftadd3RB(.bin_in ({shftadd3QB_out[2:0], shftadd3QA_out[3]}), .dec_out(shftadd3RB_out));
bindec3 shftadd3RA(.bin_in ({shftadd3QA_out[2:0], shftadd3Q9_out[3]}), .dec_out(shftadd3RA_out));
bindec3 shftadd3R9(.bin_in ({shftadd3Q9_out[2:0], shftadd3Q8_out[3]}), .dec_out(shftadd3R9_out));
bindec3 shftadd3R8(.bin_in ({shftadd3Q8_out[2:0], shftadd3Q7_out[3]}), .dec_out(shftadd3R8_out));
bindec3 shftadd3R7(.bin_in ({shftadd3Q7_out[2:0], shftadd3Q6_out[3]}), .dec_out(shftadd3R7_out));
bindec3 shftadd3R6(.bin_in ({shftadd3Q6_out[2:0], shftadd3Q5_out[3]}), .dec_out(shftadd3R6_out));
bindec3 shftadd3R5(.bin_in ({shftadd3Q5_out[2:0], shftadd3Q4_out[3]}), .dec_out(shftadd3R5_out));
bindec3 shftadd3R4(.bin_in ({shftadd3Q4_out[2:0], shftadd3Q3_out[3]}), .dec_out(shftadd3R4_out));
bindec3 shftadd3R3(.bin_in ({shftadd3Q3_out[2:0], shftadd3Q2_out[3]}), .dec_out(shftadd3R3_out));
bindec3 shftadd3R2(.bin_in ({shftadd3Q2_out[2:0], shftadd3Q1_out[3]}), .dec_out(shftadd3R2_out));
bindec3 shftadd3R1(.bin_in ({shftadd3Q1_out[2:0], shftadd3Q0_out[3]}), .dec_out(shftadd3R1_out));
bindec3 shftadd3R0(.bin_in ({shftadd3Q0_out[2:0], stage7in[8]}),      .dec_out(shftadd3R0_out));

bindec3 shftadd3SJ(.bin_in ({shftadd3RJ_out[2:0], shftadd3RI_out[3]}), .dec_out(shftadd3SJ_out));
bindec3 shftadd3SI(.bin_in ({shftadd3RI_out[2:0], shftadd3RH_out[3]}), .dec_out(shftadd3SI_out));
bindec3 shftadd3SH(.bin_in ({shftadd3RH_out[2:0], shftadd3RG_out[3]}), .dec_out(shftadd3SH_out));
bindec3 shftadd3SG(.bin_in ({shftadd3RG_out[2:0], shftadd3RF_out[3]}), .dec_out(shftadd3SG_out));
bindec3 shftadd3SF(.bin_in ({shftadd3RF_out[2:0], shftadd3RE_out[3]}), .dec_out(shftadd3SF_out));
bindec3 shftadd3SE(.bin_in ({shftadd3RE_out[2:0], shftadd3RD_out[3]}), .dec_out(shftadd3SE_out));
bindec3 shftadd3SD(.bin_in ({shftadd3RD_out[2:0], shftadd3RC_out[3]}), .dec_out(shftadd3SD_out));
bindec3 shftadd3SC(.bin_in ({shftadd3RC_out[2:0], shftadd3RB_out[3]}), .dec_out(shftadd3SC_out));
bindec3 shftadd3SB(.bin_in ({shftadd3RB_out[2:0], shftadd3RA_out[3]}), .dec_out(shftadd3SB_out));
bindec3 shftadd3SA(.bin_in ({shftadd3RA_out[2:0], shftadd3R9_out[3]}), .dec_out(shftadd3SA_out));
bindec3 shftadd3S9(.bin_in ({shftadd3R9_out[2:0], shftadd3R8_out[3]}), .dec_out(shftadd3S9_out));
bindec3 shftadd3S8(.bin_in ({shftadd3R8_out[2:0], shftadd3R7_out[3]}), .dec_out(shftadd3S8_out));
bindec3 shftadd3S7(.bin_in ({shftadd3R7_out[2:0], shftadd3R6_out[3]}), .dec_out(shftadd3S7_out));
bindec3 shftadd3S6(.bin_in ({shftadd3R6_out[2:0], shftadd3R5_out[3]}), .dec_out(shftadd3S6_out));
bindec3 shftadd3S5(.bin_in ({shftadd3R5_out[2:0], shftadd3R4_out[3]}), .dec_out(shftadd3S5_out));
bindec3 shftadd3S4(.bin_in ({shftadd3R4_out[2:0], shftadd3R3_out[3]}), .dec_out(shftadd3S4_out));
bindec3 shftadd3S3(.bin_in ({shftadd3R3_out[2:0], shftadd3R2_out[3]}), .dec_out(shftadd3S3_out));
bindec3 shftadd3S2(.bin_in ({shftadd3R2_out[2:0], shftadd3R1_out[3]}), .dec_out(shftadd3S2_out));
bindec3 shftadd3S1(.bin_in ({shftadd3R1_out[2:0], shftadd3R0_out[3]}), .dec_out(shftadd3S1_out));
bindec3 shftadd3S0(.bin_in ({shftadd3R0_out[2:0], stage7in[7]}),      .dec_out(shftadd3S0_out));

bindec3 shftadd3TJ(.bin_in ({shftadd3SJ_out[2:0], shftadd3SI_out[3]}), .dec_out(shftadd3TJ_out));
bindec3 shftadd3TI(.bin_in ({shftadd3SI_out[2:0], shftadd3SH_out[3]}), .dec_out(shftadd3TI_out));
bindec3 shftadd3TH(.bin_in ({shftadd3SH_out[2:0], shftadd3SG_out[3]}), .dec_out(shftadd3TH_out));
bindec3 shftadd3TG(.bin_in ({shftadd3SG_out[2:0], shftadd3SF_out[3]}), .dec_out(shftadd3TG_out));
bindec3 shftadd3TF(.bin_in ({shftadd3SF_out[2:0], shftadd3SE_out[3]}), .dec_out(shftadd3TF_out));
bindec3 shftadd3TE(.bin_in ({shftadd3SE_out[2:0], shftadd3SD_out[3]}), .dec_out(shftadd3TE_out));
bindec3 shftadd3TD(.bin_in ({shftadd3SD_out[2:0], shftadd3SC_out[3]}), .dec_out(shftadd3TD_out));
bindec3 shftadd3TC(.bin_in ({shftadd3SC_out[2:0], shftadd3SB_out[3]}), .dec_out(shftadd3TC_out));
bindec3 shftadd3TB(.bin_in ({shftadd3SB_out[2:0], shftadd3SA_out[3]}), .dec_out(shftadd3TB_out));
bindec3 shftadd3TA(.bin_in ({shftadd3SA_out[2:0], shftadd3S9_out[3]}), .dec_out(shftadd3TA_out));
bindec3 shftadd3T9(.bin_in ({shftadd3S9_out[2:0], shftadd3S8_out[3]}), .dec_out(shftadd3T9_out));
bindec3 shftadd3T8(.bin_in ({shftadd3S8_out[2:0], shftadd3S7_out[3]}), .dec_out(shftadd3T8_out));
bindec3 shftadd3T7(.bin_in ({shftadd3S7_out[2:0], shftadd3S6_out[3]}), .dec_out(shftadd3T7_out));
bindec3 shftadd3T6(.bin_in ({shftadd3S6_out[2:0], shftadd3S5_out[3]}), .dec_out(shftadd3T6_out));
bindec3 shftadd3T5(.bin_in ({shftadd3S5_out[2:0], shftadd3S4_out[3]}), .dec_out(shftadd3T5_out));
bindec3 shftadd3T4(.bin_in ({shftadd3S4_out[2:0], shftadd3S3_out[3]}), .dec_out(shftadd3T4_out));
bindec3 shftadd3T3(.bin_in ({shftadd3S3_out[2:0], shftadd3S2_out[3]}), .dec_out(shftadd3T3_out));
bindec3 shftadd3T2(.bin_in ({shftadd3S2_out[2:0], shftadd3S1_out[3]}), .dec_out(shftadd3T2_out));
bindec3 shftadd3T1(.bin_in ({shftadd3S1_out[2:0], shftadd3S0_out[3]}), .dec_out(shftadd3T1_out));
bindec3 shftadd3T0(.bin_in ({shftadd3S0_out[2:0], stage7in[6]}),      .dec_out(shftadd3T0_out));

bindec3 shftadd3UJ(.bin_in ({shftadd3TJ_out[2:0], shftadd3TI_out[3]}), .dec_out(shftadd3UJ_out));
bindec3 shftadd3UI(.bin_in ({shftadd3TI_out[2:0], shftadd3TH_out[3]}), .dec_out(shftadd3UI_out));
bindec3 shftadd3UH(.bin_in ({shftadd3TH_out[2:0], shftadd3TG_out[3]}), .dec_out(shftadd3UH_out));
bindec3 shftadd3UG(.bin_in ({shftadd3TG_out[2:0], shftadd3TF_out[3]}), .dec_out(shftadd3UG_out));
bindec3 shftadd3UF(.bin_in ({shftadd3TF_out[2:0], shftadd3TE_out[3]}), .dec_out(shftadd3UF_out));
bindec3 shftadd3UE(.bin_in ({shftadd3TE_out[2:0], shftadd3TD_out[3]}), .dec_out(shftadd3UE_out));
bindec3 shftadd3UD(.bin_in ({shftadd3TD_out[2:0], shftadd3TC_out[3]}), .dec_out(shftadd3UD_out));
bindec3 shftadd3UC(.bin_in ({shftadd3TC_out[2:0], shftadd3TB_out[3]}), .dec_out(shftadd3UC_out));
bindec3 shftadd3UB(.bin_in ({shftadd3TB_out[2:0], shftadd3TA_out[3]}), .dec_out(shftadd3UB_out));
bindec3 shftadd3UA(.bin_in ({shftadd3TA_out[2:0], shftadd3T9_out[3]}), .dec_out(shftadd3UA_out));
bindec3 shftadd3U9(.bin_in ({shftadd3T9_out[2:0], shftadd3T8_out[3]}), .dec_out(shftadd3U9_out));
bindec3 shftadd3U8(.bin_in ({shftadd3T8_out[2:0], shftadd3T7_out[3]}), .dec_out(shftadd3U8_out));
bindec3 shftadd3U7(.bin_in ({shftadd3T7_out[2:0], shftadd3T6_out[3]}), .dec_out(shftadd3U7_out));
bindec3 shftadd3U6(.bin_in ({shftadd3T6_out[2:0], shftadd3T5_out[3]}), .dec_out(shftadd3U6_out));
bindec3 shftadd3U5(.bin_in ({shftadd3T5_out[2:0], shftadd3T4_out[3]}), .dec_out(shftadd3U5_out));
bindec3 shftadd3U4(.bin_in ({shftadd3T4_out[2:0], shftadd3T3_out[3]}), .dec_out(shftadd3U4_out));
bindec3 shftadd3U3(.bin_in ({shftadd3T3_out[2:0], shftadd3T2_out[3]}), .dec_out(shftadd3U3_out));
bindec3 shftadd3U2(.bin_in ({shftadd3T2_out[2:0], shftadd3T1_out[3]}), .dec_out(shftadd3U2_out));
bindec3 shftadd3U1(.bin_in ({shftadd3T1_out[2:0], shftadd3T0_out[3]}), .dec_out(shftadd3U1_out));
bindec3 shftadd3U0(.bin_in ({shftadd3T0_out[2:0], stage7in[5]}),      .dec_out(shftadd3U0_out));

bindec3 shftadd3VJ(.bin_in ({shftadd3UJ_out[2:0], shftadd3UI_out[3]}), .dec_out(shftadd3VJ_out));
bindec3 shftadd3VI(.bin_in ({shftadd3UI_out[2:0], shftadd3UH_out[3]}), .dec_out(shftadd3VI_out));
bindec3 shftadd3VH(.bin_in ({shftadd3UH_out[2:0], shftadd3UG_out[3]}), .dec_out(shftadd3VH_out));
bindec3 shftadd3VG(.bin_in ({shftadd3UG_out[2:0], shftadd3UF_out[3]}), .dec_out(shftadd3VG_out));
bindec3 shftadd3VF(.bin_in ({shftadd3UF_out[2:0], shftadd3UE_out[3]}), .dec_out(shftadd3VF_out));
bindec3 shftadd3VE(.bin_in ({shftadd3UE_out[2:0], shftadd3UD_out[3]}), .dec_out(shftadd3VE_out));
bindec3 shftadd3VD(.bin_in ({shftadd3UD_out[2:0], shftadd3UC_out[3]}), .dec_out(shftadd3VD_out));
bindec3 shftadd3VC(.bin_in ({shftadd3UC_out[2:0], shftadd3UB_out[3]}), .dec_out(shftadd3VC_out));
bindec3 shftadd3VB(.bin_in ({shftadd3UB_out[2:0], shftadd3UA_out[3]}), .dec_out(shftadd3VB_out));
bindec3 shftadd3VA(.bin_in ({shftadd3UA_out[2:0], shftadd3U9_out[3]}), .dec_out(shftadd3VA_out));
bindec3 shftadd3V9(.bin_in ({shftadd3U9_out[2:0], shftadd3U8_out[3]}), .dec_out(shftadd3V9_out));
bindec3 shftadd3V8(.bin_in ({shftadd3U8_out[2:0], shftadd3U7_out[3]}), .dec_out(shftadd3V8_out));
bindec3 shftadd3V7(.bin_in ({shftadd3U7_out[2:0], shftadd3U6_out[3]}), .dec_out(shftadd3V7_out));
bindec3 shftadd3V6(.bin_in ({shftadd3U6_out[2:0], shftadd3U5_out[3]}), .dec_out(shftadd3V6_out));
bindec3 shftadd3V5(.bin_in ({shftadd3U5_out[2:0], shftadd3U4_out[3]}), .dec_out(shftadd3V5_out));
bindec3 shftadd3V4(.bin_in ({shftadd3U4_out[2:0], shftadd3U3_out[3]}), .dec_out(shftadd3V4_out));
bindec3 shftadd3V3(.bin_in ({shftadd3U3_out[2:0], shftadd3U2_out[3]}), .dec_out(shftadd3V3_out));
bindec3 shftadd3V2(.bin_in ({shftadd3U2_out[2:0], shftadd3U1_out[3]}), .dec_out(shftadd3V2_out));
bindec3 shftadd3V1(.bin_in ({shftadd3U1_out[2:0], shftadd3U0_out[3]}), .dec_out(shftadd3V1_out));
bindec3 shftadd3V0(.bin_in ({shftadd3U0_out[2:0], stage7in[4]}),      .dec_out(shftadd3V0_out));

bindec3 shftadd3WJ(.bin_in ({shftadd3VJ_out[2:0], shftadd3VI_out[3]}), .dec_out(shftadd3WJ_out));
bindec3 shftadd3WI(.bin_in ({shftadd3VI_out[2:0], shftadd3VH_out[3]}), .dec_out(shftadd3WI_out));
bindec3 shftadd3WH(.bin_in ({shftadd3VH_out[2:0], shftadd3VG_out[3]}), .dec_out(shftadd3WH_out));
bindec3 shftadd3WG(.bin_in ({shftadd3VG_out[2:0], shftadd3VF_out[3]}), .dec_out(shftadd3WG_out));
bindec3 shftadd3WF(.bin_in ({shftadd3VF_out[2:0], shftadd3VE_out[3]}), .dec_out(shftadd3WF_out));
bindec3 shftadd3WE(.bin_in ({shftadd3VE_out[2:0], shftadd3VD_out[3]}), .dec_out(shftadd3WE_out));
bindec3 shftadd3WD(.bin_in ({shftadd3VD_out[2:0], shftadd3VC_out[3]}), .dec_out(shftadd3WD_out));
bindec3 shftadd3WC(.bin_in ({shftadd3VC_out[2:0], shftadd3VB_out[3]}), .dec_out(shftadd3WC_out));
bindec3 shftadd3WB(.bin_in ({shftadd3VB_out[2:0], shftadd3VA_out[3]}), .dec_out(shftadd3WB_out));
bindec3 shftadd3WA(.bin_in ({shftadd3VA_out[2:0], shftadd3V9_out[3]}), .dec_out(shftadd3WA_out));
bindec3 shftadd3W9(.bin_in ({shftadd3V9_out[2:0], shftadd3V8_out[3]}), .dec_out(shftadd3W9_out));
bindec3 shftadd3W8(.bin_in ({shftadd3V8_out[2:0], shftadd3V7_out[3]}), .dec_out(shftadd3W8_out));
bindec3 shftadd3W7(.bin_in ({shftadd3V7_out[2:0], shftadd3V6_out[3]}), .dec_out(shftadd3W7_out));
bindec3 shftadd3W6(.bin_in ({shftadd3V6_out[2:0], shftadd3V5_out[3]}), .dec_out(shftadd3W6_out));
bindec3 shftadd3W5(.bin_in ({shftadd3V5_out[2:0], shftadd3V4_out[3]}), .dec_out(shftadd3W5_out));
bindec3 shftadd3W4(.bin_in ({shftadd3V4_out[2:0], shftadd3V3_out[3]}), .dec_out(shftadd3W4_out));
bindec3 shftadd3W3(.bin_in ({shftadd3V3_out[2:0], shftadd3V2_out[3]}), .dec_out(shftadd3W3_out));
bindec3 shftadd3W2(.bin_in ({shftadd3V2_out[2:0], shftadd3V1_out[3]}), .dec_out(shftadd3W2_out));
bindec3 shftadd3W1(.bin_in ({shftadd3V1_out[2:0], shftadd3V0_out[3]}), .dec_out(shftadd3W1_out));
bindec3 shftadd3W0(.bin_in ({shftadd3V0_out[2:0], stage7in[3]}),      .dec_out(shftadd3W0_out));

bindec3 shftadd3XJ(.bin_in ({shftadd3WJ_out[2:0], shftadd3WI_out[3]}), .dec_out(shftadd3XJ_out));
bindec3 shftadd3XI(.bin_in ({shftadd3WI_out[2:0], shftadd3WH_out[3]}), .dec_out(shftadd3XI_out));
bindec3 shftadd3XH(.bin_in ({shftadd3WH_out[2:0], shftadd3WG_out[3]}), .dec_out(shftadd3XH_out));
bindec3 shftadd3XG(.bin_in ({shftadd3WG_out[2:0], shftadd3WF_out[3]}), .dec_out(shftadd3XG_out));
bindec3 shftadd3XF(.bin_in ({shftadd3WF_out[2:0], shftadd3WE_out[3]}), .dec_out(shftadd3XF_out));
bindec3 shftadd3XE(.bin_in ({shftadd3WE_out[2:0], shftadd3WD_out[3]}), .dec_out(shftadd3XE_out));
bindec3 shftadd3XD(.bin_in ({shftadd3WD_out[2:0], shftadd3WC_out[3]}), .dec_out(shftadd3XD_out));
bindec3 shftadd3XC(.bin_in ({shftadd3WC_out[2:0], shftadd3WB_out[3]}), .dec_out(shftadd3XC_out));
bindec3 shftadd3XB(.bin_in ({shftadd3WB_out[2:0], shftadd3WA_out[3]}), .dec_out(shftadd3XB_out));
bindec3 shftadd3XA(.bin_in ({shftadd3WA_out[2:0], shftadd3W9_out[3]}), .dec_out(shftadd3XA_out));
bindec3 shftadd3X9(.bin_in ({shftadd3W9_out[2:0], shftadd3W8_out[3]}), .dec_out(shftadd3X9_out));
bindec3 shftadd3X8(.bin_in ({shftadd3W8_out[2:0], shftadd3W7_out[3]}), .dec_out(shftadd3X8_out));
bindec3 shftadd3X7(.bin_in ({shftadd3W7_out[2:0], shftadd3W6_out[3]}), .dec_out(shftadd3X7_out));
bindec3 shftadd3X6(.bin_in ({shftadd3W6_out[2:0], shftadd3W5_out[3]}), .dec_out(shftadd3X6_out));
bindec3 shftadd3X5(.bin_in ({shftadd3W5_out[2:0], shftadd3W4_out[3]}), .dec_out(shftadd3X5_out));
bindec3 shftadd3X4(.bin_in ({shftadd3W4_out[2:0], shftadd3W3_out[3]}), .dec_out(shftadd3X4_out));
bindec3 shftadd3X3(.bin_in ({shftadd3W3_out[2:0], shftadd3W2_out[3]}), .dec_out(shftadd3X3_out));
bindec3 shftadd3X2(.bin_in ({shftadd3W2_out[2:0], shftadd3W1_out[3]}), .dec_out(shftadd3X2_out));
bindec3 shftadd3X1(.bin_in ({shftadd3W1_out[2:0], shftadd3W0_out[3]}), .dec_out(shftadd3X1_out));
bindec3 shftadd3X0(.bin_in ({shftadd3W0_out[2:0], stage7in[2]}),      .dec_out(shftadd3X0_out));

//stage 16
always @(posedge CLK) 
    if (RESET) stage7outq <= 0;
    else stage7outq <= {shftadd3XJ_out[2:0],
                        shftadd3XI_out,
                        shftadd3XH_out,
                        shftadd3XG_out,
                        shftadd3XF_out,
                        shftadd3XE_out,
                        shftadd3XD_out,
                        shftadd3XC_out,
                        shftadd3XB_out,
                        shftadd3XA_out,
                        shftadd3X9_out,
                        shftadd3X8_out,
                        shftadd3X7_out,
                        shftadd3X6_out,
                        shftadd3X5_out,
                        shftadd3X4_out,
                        shftadd3X3_out,
                        shftadd3X2_out,
                        shftadd3X1_out,
                        shftadd3X0_out,
                        stage7in[1:0]              
                        };
                                    

bindec3 shftadd3YJ(.bin_in (stage7outq[80:77]), .dec_out(shftadd3YJ_out));
bindec3 shftadd3YI(.bin_in (stage7outq[76:73]), .dec_out(shftadd3YI_out));
bindec3 shftadd3YH(.bin_in (stage7outq[72:69]), .dec_out(shftadd3YH_out));
bindec3 shftadd3YG(.bin_in (stage7outq[68:65]), .dec_out(shftadd3YG_out));
bindec3 shftadd3YF(.bin_in (stage7outq[64:61]), .dec_out(shftadd3YF_out));
bindec3 shftadd3YE(.bin_in (stage7outq[60:57]), .dec_out(shftadd3YE_out));
bindec3 shftadd3YD(.bin_in (stage7outq[56:53]), .dec_out(shftadd3YD_out));
bindec3 shftadd3YC(.bin_in (stage7outq[52:49]), .dec_out(shftadd3YC_out));
bindec3 shftadd3YB(.bin_in (stage7outq[48:45]), .dec_out(shftadd3YB_out));
bindec3 shftadd3YA(.bin_in (stage7outq[44:41]), .dec_out(shftadd3YA_out));
bindec3 shftadd3Y9(.bin_in (stage7outq[40:37]), .dec_out(shftadd3Y9_out));
bindec3 shftadd3Y8(.bin_in (stage7outq[36:33]), .dec_out(shftadd3Y8_out));
bindec3 shftadd3Y7(.bin_in (stage7outq[32:29]), .dec_out(shftadd3Y7_out));
bindec3 shftadd3Y6(.bin_in (stage7outq[28:25]), .dec_out(shftadd3Y6_out));
bindec3 shftadd3Y5(.bin_in (stage7outq[24:21]), .dec_out(shftadd3Y5_out));
bindec3 shftadd3Y4(.bin_in (stage7outq[20:17]), .dec_out(shftadd3Y4_out));
bindec3 shftadd3Y3(.bin_in (stage7outq[16:13]), .dec_out(shftadd3Y3_out));
bindec3 shftadd3Y2(.bin_in (stage7outq[12: 9]), .dec_out(shftadd3Y2_out));
bindec3 shftadd3Y1(.bin_in (stage7outq[ 8: 5]), .dec_out(shftadd3Y1_out));
bindec3 shftadd3Y0(.bin_in (stage7outq[ 4: 1]), .dec_out(shftadd3Y0_out));

assign stage7out = {3'b000,
                    shftadd3YJ_out,
                    shftadd3YI_out,
                    shftadd3YH_out,
                    shftadd3YG_out,
                    shftadd3YF_out,
                    shftadd3YE_out,
                    shftadd3YD_out,
                    shftadd3YC_out,
                    shftadd3YB_out,
                    shftadd3YA_out,
                    shftadd3Y9_out,
                    shftadd3Y8_out,
                    shftadd3Y7_out,
                    shftadd3Y6_out,
                    shftadd3Y5_out,
                    shftadd3Y4_out,
                    shftadd3Y3_out,
                    shftadd3Y2_out,
                    shftadd3Y1_out,
                    shftadd3Y0_out,
                    stage7outq[0]
                    };

endmodule
