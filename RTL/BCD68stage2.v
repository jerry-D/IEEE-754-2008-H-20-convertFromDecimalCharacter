//BCD68stage2.v
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

module BCD68stage2(
    CLK,
    RESET,
    stage2in,
    stage2out
);    

input RESET;
input CLK;
input[73:0] stage2in;
output[75:0] stage2out;

reg [75:0] stage2out;

wire [3:0] shftadd165_out;
wire [3:0] shftadd164_out;
wire [3:0] shftadd163_out;
wire [3:0] shftadd162_out;
wire [3:0] shftadd161_out;
wire [3:0] shftadd160_out;

wire [3:0] shftadd175_out;
wire [3:0] shftadd174_out;
wire [3:0] shftadd173_out;
wire [3:0] shftadd172_out;
wire [3:0] shftadd171_out;
wire [3:0] shftadd170_out;

wire [3:0] shftadd186_out;
wire [3:0] shftadd185_out;
wire [3:0] shftadd184_out;
wire [3:0] shftadd183_out;
wire [3:0] shftadd182_out;
wire [3:0] shftadd181_out;
wire [3:0] shftadd180_out;

wire [3:0] shftadd196_out;
wire [3:0] shftadd195_out;
wire [3:0] shftadd194_out;
wire [3:0] shftadd193_out;
wire [3:0] shftadd192_out;
wire [3:0] shftadd191_out;
wire [3:0] shftadd190_out;

wire [3:0] shftadd206_out;
wire [3:0] shftadd205_out;
wire [3:0] shftadd204_out;
wire [3:0] shftadd203_out;
wire [3:0] shftadd202_out;
wire [3:0] shftadd201_out;
wire [3:0] shftadd200_out;

wire [3:0] shftadd217_out;
wire [3:0] shftadd216_out;
wire [3:0] shftadd215_out;
wire [3:0] shftadd214_out;
wire [3:0] shftadd213_out;
wire [3:0] shftadd212_out;
wire [3:0] shftadd211_out;
wire [3:0] shftadd210_out;

wire [3:0] shftadd227_out;
wire [3:0] shftadd226_out;
wire [3:0] shftadd225_out;
wire [3:0] shftadd224_out;
wire [3:0] shftadd223_out;
wire [3:0] shftadd222_out;
wire [3:0] shftadd221_out;
wire [3:0] shftadd220_out;

wire [3:0] shftadd237_out;
wire [3:0] shftadd236_out;
wire [3:0] shftadd235_out;
wire [3:0] shftadd234_out;
wire [3:0] shftadd233_out;
wire [3:0] shftadd232_out;
wire [3:0] shftadd231_out;
wire [3:0] shftadd230_out;

bindec3 shftadd165(.bin_in (stage2in[72:69]), .dec_out(shftadd165_out));
bindec3 shftadd164(.bin_in (stage2in[68:65]), .dec_out(shftadd164_out));
bindec3 shftadd163(.bin_in (stage2in[64:61]), .dec_out(shftadd163_out));
bindec3 shftadd162(.bin_in (stage2in[60:57]), .dec_out(shftadd162_out));
bindec3 shftadd161(.bin_in (stage2in[56:53]), .dec_out(shftadd161_out));
bindec3 shftadd160(.bin_in (stage2in[52:49]), .dec_out(shftadd160_out));

bindec3 shftadd175(.bin_in ({shftadd165_out[2:0], shftadd164_out[3]}), .dec_out(shftadd175_out));
bindec3 shftadd174(.bin_in ({shftadd164_out[2:0], shftadd163_out[3]}), .dec_out(shftadd174_out));
bindec3 shftadd173(.bin_in ({shftadd163_out[2:0], shftadd162_out[3]}), .dec_out(shftadd173_out));
bindec3 shftadd172(.bin_in ({shftadd162_out[2:0], shftadd161_out[3]}), .dec_out(shftadd172_out));
bindec3 shftadd171(.bin_in ({shftadd161_out[2:0], shftadd160_out[3]}), .dec_out(shftadd171_out));
bindec3 shftadd170(.bin_in ({shftadd160_out[2:0], stage2in[48]}), .dec_out(shftadd170_out));

bindec3 shftadd186(.bin_in ({1'b0, stage2in[73], shftadd165_out[3], shftadd175_out[3]}), .dec_out(shftadd186_out));
bindec3 shftadd185(.bin_in ({shftadd175_out[2:0], shftadd174_out[3]}), .dec_out(shftadd185_out));
bindec3 shftadd184(.bin_in ({shftadd174_out[2:0], shftadd173_out[3]}), .dec_out(shftadd184_out));
bindec3 shftadd183(.bin_in ({shftadd173_out[2:0], shftadd172_out[3]}), .dec_out(shftadd183_out));
bindec3 shftadd182(.bin_in ({shftadd172_out[2:0], shftadd171_out[3]}), .dec_out(shftadd182_out));
bindec3 shftadd181(.bin_in ({shftadd171_out[2:0], shftadd170_out[3]}), .dec_out(shftadd181_out));
bindec3 shftadd180(.bin_in ({shftadd170_out[2:0], stage2in[47]}), .dec_out(shftadd180_out));

bindec3 shftadd196(.bin_in ({shftadd186_out[2:0], shftadd185_out[3]}), .dec_out(shftadd196_out));
bindec3 shftadd195(.bin_in ({shftadd185_out[2:0], shftadd184_out[3]}), .dec_out(shftadd195_out));
bindec3 shftadd194(.bin_in ({shftadd184_out[2:0], shftadd183_out[3]}), .dec_out(shftadd194_out));
bindec3 shftadd193(.bin_in ({shftadd183_out[2:0], shftadd182_out[3]}), .dec_out(shftadd193_out));
bindec3 shftadd192(.bin_in ({shftadd182_out[2:0], shftadd181_out[3]}), .dec_out(shftadd192_out));
bindec3 shftadd191(.bin_in ({shftadd181_out[2:0], shftadd180_out[3]}), .dec_out(shftadd191_out));
bindec3 shftadd190(.bin_in ({shftadd180_out[2:0], stage2in[46]}), .dec_out(shftadd190_out));

bindec3 shftadd206(.bin_in ({shftadd196_out[2:0], shftadd195_out[3]}), .dec_out(shftadd206_out));
bindec3 shftadd205(.bin_in ({shftadd195_out[2:0], shftadd194_out[3]}), .dec_out(shftadd205_out));
bindec3 shftadd204(.bin_in ({shftadd194_out[2:0], shftadd193_out[3]}), .dec_out(shftadd204_out));
bindec3 shftadd203(.bin_in ({shftadd193_out[2:0], shftadd192_out[3]}), .dec_out(shftadd203_out));
bindec3 shftadd202(.bin_in ({shftadd192_out[2:0], shftadd191_out[3]}), .dec_out(shftadd202_out));
bindec3 shftadd201(.bin_in ({shftadd191_out[2:0], shftadd190_out[3]}), .dec_out(shftadd201_out));
bindec3 shftadd200(.bin_in ({shftadd190_out[2:0], stage2in[45]}), .dec_out(shftadd200_out));


bindec3 shftadd217(.bin_in ({1'b0, shftadd186_out[3], shftadd196_out[3], shftadd206_out[3]}), .dec_out(shftadd217_out));
bindec3 shftadd216(.bin_in ({shftadd206_out[2:0], shftadd205_out[3]}), .dec_out(shftadd216_out));
bindec3 shftadd215(.bin_in ({shftadd205_out[2:0], shftadd204_out[3]}), .dec_out(shftadd215_out));
bindec3 shftadd214(.bin_in ({shftadd204_out[2:0], shftadd203_out[3]}), .dec_out(shftadd214_out));
bindec3 shftadd213(.bin_in ({shftadd203_out[2:0], shftadd202_out[3]}), .dec_out(shftadd213_out));
bindec3 shftadd212(.bin_in ({shftadd202_out[2:0], shftadd201_out[3]}), .dec_out(shftadd212_out));
bindec3 shftadd211(.bin_in ({shftadd201_out[2:0], shftadd200_out[3]}), .dec_out(shftadd211_out));
bindec3 shftadd210(.bin_in ({shftadd200_out[2:0], stage2in[44]}), .dec_out(shftadd210_out));

bindec3 shftadd227(.bin_in ({shftadd217_out[2:0], shftadd216_out[3]}), .dec_out(shftadd227_out));
bindec3 shftadd226(.bin_in ({shftadd216_out[2:0], shftadd215_out[3]}), .dec_out(shftadd226_out));
bindec3 shftadd225(.bin_in ({shftadd215_out[2:0], shftadd214_out[3]}), .dec_out(shftadd225_out));
bindec3 shftadd224(.bin_in ({shftadd214_out[2:0], shftadd213_out[3]}), .dec_out(shftadd224_out));
bindec3 shftadd223(.bin_in ({shftadd213_out[2:0], shftadd212_out[3]}), .dec_out(shftadd223_out));
bindec3 shftadd222(.bin_in ({shftadd212_out[2:0], shftadd211_out[3]}), .dec_out(shftadd222_out));
bindec3 shftadd221(.bin_in ({shftadd211_out[2:0], shftadd210_out[3]}), .dec_out(shftadd221_out));
bindec3 shftadd220(.bin_in ({shftadd210_out[2:0], stage2in[43]}), .dec_out(shftadd220_out));

bindec3 shftadd237(.bin_in ({shftadd227_out[2:0], shftadd226_out[3]}), .dec_out(shftadd237_out));
bindec3 shftadd236(.bin_in ({shftadd226_out[2:0], shftadd225_out[3]}), .dec_out(shftadd236_out));
bindec3 shftadd235(.bin_in ({shftadd225_out[2:0], shftadd224_out[3]}), .dec_out(shftadd235_out));
bindec3 shftadd234(.bin_in ({shftadd224_out[2:0], shftadd223_out[3]}), .dec_out(shftadd234_out));
bindec3 shftadd233(.bin_in ({shftadd223_out[2:0], shftadd222_out[3]}), .dec_out(shftadd233_out));
bindec3 shftadd232(.bin_in ({shftadd222_out[2:0], shftadd221_out[3]}), .dec_out(shftadd232_out));
bindec3 shftadd231(.bin_in ({shftadd221_out[2:0], shftadd220_out[3]}), .dec_out(shftadd231_out));
bindec3 shftadd230(.bin_in ({shftadd220_out[2:0], stage2in[42]}), .dec_out(shftadd230_out));

//stage 11
always @(posedge CLK)
    if (RESET) stage2out <= 0;
    else stage2out <= {shftadd217_out[3], 
                       shftadd227_out[3],
                       shftadd237_out[3:0], 
                       shftadd236_out[3:0],
                       shftadd235_out[3:0],
                       shftadd234_out[3:0],
                       shftadd233_out[3:0],
                       shftadd232_out[3:0],
                       shftadd231_out[3:0],
                       shftadd230_out[3:0],
                       stage2in[41:0]
                       };

endmodule
