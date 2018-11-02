//BCD68stage1.v
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

module BCD68stage1(
    CLK,
    RESET,
    stage1in,
    stage1out
);    

input RESET;
input CLK;
input[70:0] stage1in;
output[73:0] stage1out;

reg [73:0] stage1out;

wire [3:0] shftadd82_out;
wire [3:0] shftadd81_out;
wire [3:0] shftadd80_out;

wire [3:0] shftadd93_out;
wire [3:0] shftadd92_out;
wire [3:0] shftadd91_out;
wire [3:0] shftadd90_out;

wire [3:0] shftadd103_out;
wire [3:0] shftadd102_out;
wire [3:0] shftadd101_out;
wire [3:0] shftadd100_out;

wire [3:0] shftadd113_out;
wire [3:0] shftadd112_out;
wire [3:0] shftadd111_out;
wire [3:0] shftadd110_out;

wire [3:0] shftadd124_out;
wire [3:0] shftadd123_out;
wire [3:0] shftadd122_out;
wire [3:0] shftadd121_out;
wire [3:0] shftadd120_out;

wire [3:0] shftadd134_out;
wire [3:0] shftadd133_out;
wire [3:0] shftadd132_out;
wire [3:0] shftadd131_out;
wire [3:0] shftadd130_out;

wire [3:0] shftadd144_out;
wire [3:0] shftadd143_out;
wire [3:0] shftadd142_out;
wire [3:0] shftadd141_out;
wire [3:0] shftadd140_out;

wire [3:0] shftadd155_out;
wire [3:0] shftadd154_out;
wire [3:0] shftadd153_out;
wire [3:0] shftadd152_out;
wire [3:0] shftadd151_out;
wire [3:0] shftadd150_out;


bindec3 shftadd82(.bin_in (stage1in[68:65]), .dec_out(shftadd82_out));
bindec3 shftadd81(.bin_in (stage1in[64:61]), .dec_out(shftadd81_out));
bindec3 shftadd80(.bin_in (stage1in[60:57]), .dec_out(shftadd80_out));

bindec3 shftadd93(.bin_in ({1'b0, stage1in[70:69], shftadd82_out[3]}), .dec_out(shftadd93_out));
bindec3 shftadd92(.bin_in ({shftadd82_out[2:0], shftadd81_out[3]}), .dec_out(shftadd92_out));
bindec3 shftadd91(.bin_in ({shftadd81_out[2:0], shftadd80_out[3]}), .dec_out(shftadd91_out));
bindec3 shftadd90(.bin_in ({shftadd80_out[2:0], stage1in[56]}), .dec_out(shftadd90_out));

bindec3 shftadd103(.bin_in ({shftadd93_out[2:0], shftadd92_out[3]}), .dec_out(shftadd103_out));
bindec3 shftadd102(.bin_in ({shftadd92_out[2:0], shftadd91_out[3]}), .dec_out(shftadd102_out));
bindec3 shftadd101(.bin_in ({shftadd91_out[2:0], shftadd90_out[3]}  ), .dec_out(shftadd101_out));
bindec3 shftadd100(.bin_in ({shftadd90_out[2:0], stage1in[55]}), .dec_out(shftadd100_out));

bindec3 shftadd113(.bin_in ({shftadd103_out[2:0], shftadd102_out[3]}), .dec_out(shftadd113_out));
bindec3 shftadd112(.bin_in ({shftadd102_out[2:0], shftadd101_out[3]}), .dec_out(shftadd112_out));
bindec3 shftadd111(.bin_in ({shftadd101_out[2:0], shftadd100_out[3]}  ), .dec_out(shftadd111_out));
bindec3 shftadd110(.bin_in ({shftadd100_out[2:0], stage1in[54]}), .dec_out(shftadd110_out));

bindec3 shftadd124(.bin_in ({1'b0, shftadd93_out[3], shftadd103_out[3], shftadd113_out[3]}), .dec_out(shftadd124_out));
bindec3 shftadd123(.bin_in ({shftadd113_out[2:0], shftadd112_out[3]}), .dec_out(shftadd123_out));
bindec3 shftadd122(.bin_in ({shftadd112_out[2:0], shftadd111_out[3]}), .dec_out(shftadd122_out));
bindec3 shftadd121(.bin_in ({shftadd111_out[2:0], shftadd110_out[3]}), .dec_out(shftadd121_out));
bindec3 shftadd120(.bin_in ({shftadd110_out[2:0], stage1in[53]}), .dec_out(shftadd120_out));

bindec3 shftadd134(.bin_in ({shftadd124_out[2:0], shftadd123_out[3]}), .dec_out(shftadd134_out));
bindec3 shftadd133(.bin_in ({shftadd123_out[2:0], shftadd122_out[3]}), .dec_out(shftadd133_out));
bindec3 shftadd132(.bin_in ({shftadd122_out[2:0], shftadd121_out[3]}), .dec_out(shftadd132_out));
bindec3 shftadd131(.bin_in ({shftadd121_out[2:0], shftadd120_out[3]}), .dec_out(shftadd131_out));
bindec3 shftadd130(.bin_in ({shftadd120_out[2:0], stage1in[52]}), .dec_out(shftadd130_out));

bindec3 shftadd144(.bin_in ({shftadd134_out[2:0], shftadd133_out[3]}), .dec_out(shftadd144_out));
bindec3 shftadd143(.bin_in ({shftadd133_out[2:0], shftadd132_out[3]}), .dec_out(shftadd143_out));
bindec3 shftadd142(.bin_in ({shftadd132_out[2:0], shftadd131_out[3]}), .dec_out(shftadd142_out));
bindec3 shftadd141(.bin_in ({shftadd131_out[2:0], shftadd130_out[3]}), .dec_out(shftadd141_out));
bindec3 shftadd140(.bin_in ({shftadd130_out[2:0], stage1in[51]}), .dec_out(shftadd140_out));

bindec3 shftadd155(.bin_in ({1'b0, shftadd124_out[3], shftadd134_out[3], shftadd144_out[3]}), .dec_out(shftadd155_out));
bindec3 shftadd154(.bin_in ({shftadd144_out[2:0], shftadd143_out[3]}), .dec_out(shftadd154_out));
bindec3 shftadd153(.bin_in ({shftadd143_out[2:0], shftadd142_out[3]}), .dec_out(shftadd153_out));
bindec3 shftadd152(.bin_in ({shftadd142_out[2:0], shftadd141_out[3]}), .dec_out(shftadd152_out));
bindec3 shftadd151(.bin_in ({shftadd141_out[2:0], shftadd140_out[3]}), .dec_out(shftadd151_out));
bindec3 shftadd150(.bin_in ({shftadd140_out[2:0], stage1in[50]}), .dec_out(shftadd150_out));

//stage 10
always @(posedge CLK) 
    if (RESET) stage1out <= 0;
    else stage1out <= {shftadd155_out[3:0], 
                       shftadd154_out[3:0], 
                       shftadd153_out[3:0],
                       shftadd152_out[3:0],
                       shftadd151_out[3:0],
                       shftadd150_out[3:0],
                       stage1in[49:0]    };

endmodule
