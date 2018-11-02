//BCD68stage4.v
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

module BCD68stage4(
    CLK,
    RESET,
    stage4in,
    stage4out
);    

input RESET;
input CLK;
input[78:0] stage4in;
output[81:0] stage4out;

reg [81:0] stage4out;

wire [3:0] shftadd3030_out;
wire [3:0] shftadd329_out;
wire [3:0] shftadd328_out;
wire [3:0] shftadd327_out;
wire [3:0] shftadd326_out;
wire [3:0] shftadd325_out;
wire [3:0] shftadd324_out;
wire [3:0] shftadd323_out;
wire [3:0] shftadd322_out;
wire [3:0] shftadd321_out;
wire [3:0] shftadd320_out;

wire [3:0] shftadd3041_out;
wire [3:0] shftadd3040_out;
wire [3:0] shftadd339_out;
wire [3:0] shftadd338_out;
wire [3:0] shftadd337_out;
wire [3:0] shftadd336_out;
wire [3:0] shftadd335_out;
wire [3:0] shftadd334_out;
wire [3:0] shftadd333_out;
wire [3:0] shftadd332_out;
wire [3:0] shftadd331_out;
wire [3:0] shftadd330_out;

wire [3:0] shftadd3051_out;
wire [3:0] shftadd3050_out;
wire [3:0] shftadd349_out;
wire [3:0] shftadd348_out;
wire [3:0] shftadd347_out;
wire [3:0] shftadd346_out;
wire [3:0] shftadd345_out;
wire [3:0] shftadd344_out;
wire [3:0] shftadd343_out;
wire [3:0] shftadd342_out;
wire [3:0] shftadd341_out;
wire [3:0] shftadd340_out;

wire [3:0] shftadd3061_out;
wire [3:0] shftadd3060_out;
wire [3:0] shftadd359_out;
wire [3:0] shftadd358_out;
wire [3:0] shftadd357_out;
wire [3:0] shftadd356_out;
wire [3:0] shftadd355_out;
wire [3:0] shftadd354_out;                               
wire [3:0] shftadd353_out;
wire [3:0] shftadd352_out;
wire [3:0] shftadd351_out;
wire [3:0] shftadd350_out;

wire [3:0] shftadd3072_out;
wire [3:0] shftadd3071_out;
wire [3:0] shftadd3070_out;
wire [3:0] shftadd369_out;
wire [3:0] shftadd368_out;
wire [3:0] shftadd367_out;
wire [3:0] shftadd366_out;
wire [3:0] shftadd365_out;
wire [3:0] shftadd364_out;                               
wire [3:0] shftadd363_out;
wire [3:0] shftadd362_out;
wire [3:0] shftadd361_out;
wire [3:0] shftadd360_out;

wire [3:0] shftadd3082_out;
wire [3:0] shftadd3081_out;
wire [3:0] shftadd3080_out;
wire [3:0] shftadd379_out;
wire [3:0] shftadd378_out;
wire [3:0] shftadd377_out;
wire [3:0] shftadd376_out;
wire [3:0] shftadd375_out;
wire [3:0] shftadd374_out;                               
wire [3:0] shftadd373_out;
wire [3:0] shftadd372_out;
wire [3:0] shftadd371_out;
wire [3:0] shftadd370_out;

wire [3:0] shftadd3092_out;
wire [3:0] shftadd3091_out;
wire [3:0] shftadd3090_out;
wire [3:0] shftadd389_out;
wire [3:0] shftadd388_out;
wire [3:0] shftadd387_out;
wire [3:0] shftadd386_out;
wire [3:0] shftadd385_out;
wire [3:0] shftadd384_out;                               
wire [3:0] shftadd383_out;
wire [3:0] shftadd382_out;
wire [3:0] shftadd381_out;
wire [3:0] shftadd380_out;

wire [3:0] shftadd3103_out;
wire [3:0] shftadd3102_out;
wire [3:0] shftadd3101_out;
wire [3:0] shftadd3100_out;
wire [3:0] shftadd399_out;
wire [3:0] shftadd398_out;
wire [3:0] shftadd397_out;
wire [3:0] shftadd396_out;
wire [3:0] shftadd395_out;
wire [3:0] shftadd394_out;                               
wire [3:0] shftadd393_out;
wire [3:0] shftadd392_out;
wire [3:0] shftadd391_out;
wire [3:0] shftadd390_out;

bindec3 shftadd3030(.bin_in (stage4in[76:73]), .dec_out(shftadd3030_out));
bindec3 shftadd329 (.bin_in (stage4in[72:69]), .dec_out(shftadd329_out));
bindec3 shftadd328 (.bin_in (stage4in[68:65]), .dec_out(shftadd328_out));
bindec3 shftadd327 (.bin_in (stage4in[64:61]), .dec_out(shftadd327_out));
bindec3 shftadd326 (.bin_in (stage4in[60:57]), .dec_out(shftadd326_out));
bindec3 shftadd325 (.bin_in (stage4in[56:53]), .dec_out(shftadd325_out));
bindec3 shftadd324 (.bin_in (stage4in[52:49]), .dec_out(shftadd324_out));
bindec3 shftadd323 (.bin_in (stage4in[48:45]), .dec_out(shftadd323_out));
bindec3 shftadd322 (.bin_in (stage4in[44:41]), .dec_out(shftadd322_out));
bindec3 shftadd321 (.bin_in (stage4in[40:37]), .dec_out(shftadd321_out));
bindec3 shftadd320 (.bin_in (stage4in[36:33]), .dec_out(shftadd320_out));

bindec3 shftadd3041(.bin_in ({1'b0, stage4in[78:77], shftadd3030_out[3]}), .dec_out(shftadd3041_out));
bindec3 shftadd3040(.bin_in ({shftadd3030_out[2:0], shftadd329_out[3]}), .dec_out(shftadd3040_out));
bindec3 shftadd339 (.bin_in ({shftadd329_out[2:0],  shftadd328_out[3]}), .dec_out(shftadd339_out));
bindec3 shftadd338 (.bin_in ({shftadd328_out[2:0],  shftadd327_out[3]}), .dec_out(shftadd338_out));
bindec3 shftadd337 (.bin_in ({shftadd327_out[2:0],  shftadd326_out[3]}), .dec_out(shftadd337_out));
bindec3 shftadd336 (.bin_in ({shftadd326_out[2:0],  shftadd325_out[3]}), .dec_out(shftadd336_out));
bindec3 shftadd335 (.bin_in ({shftadd325_out[2:0],  shftadd324_out[3]}), .dec_out(shftadd335_out));
bindec3 shftadd334 (.bin_in ({shftadd324_out[2:0],  shftadd323_out[3]}), .dec_out(shftadd334_out));
bindec3 shftadd333 (.bin_in ({shftadd323_out[2:0],  shftadd322_out[3]}), .dec_out(shftadd333_out));
bindec3 shftadd332 (.bin_in ({shftadd322_out[2:0],  shftadd321_out[3]}), .dec_out(shftadd332_out));
bindec3 shftadd331 (.bin_in ({shftadd321_out[2:0],  shftadd320_out[3]}), .dec_out(shftadd331_out));
bindec3 shftadd330 (.bin_in ({shftadd320_out[2:0],  stage4in[32]}),    .dec_out(shftadd330_out));

bindec3 shftadd3051(.bin_in ({shftadd3041_out[2:0], shftadd3040_out[3]}), .dec_out(shftadd3051_out));
bindec3 shftadd3050(.bin_in ({shftadd3040_out[2:0], shftadd339_out[3]}), .dec_out(shftadd3050_out));
bindec3 shftadd349 (.bin_in ({shftadd339_out[2:0],  shftadd338_out[3]}), .dec_out(shftadd349_out));
bindec3 shftadd348 (.bin_in ({shftadd338_out[2:0],  shftadd337_out[3]}), .dec_out(shftadd348_out));
bindec3 shftadd347 (.bin_in ({shftadd337_out[2:0],  shftadd336_out[3]}), .dec_out(shftadd347_out));
bindec3 shftadd346 (.bin_in ({shftadd336_out[2:0],  shftadd335_out[3]}), .dec_out(shftadd346_out));
bindec3 shftadd345 (.bin_in ({shftadd335_out[2:0],  shftadd334_out[3]}), .dec_out(shftadd345_out));
bindec3 shftadd344 (.bin_in ({shftadd334_out[2:0],  shftadd333_out[3]}), .dec_out(shftadd344_out));
bindec3 shftadd343 (.bin_in ({shftadd333_out[2:0],  shftadd332_out[3]}), .dec_out(shftadd343_out));
bindec3 shftadd342 (.bin_in ({shftadd332_out[2:0],  shftadd331_out[3]}), .dec_out(shftadd342_out));
bindec3 shftadd341 (.bin_in ({shftadd331_out[2:0],  shftadd330_out[3]}), .dec_out(shftadd341_out));
bindec3 shftadd340 (.bin_in ({shftadd330_out[2:0],  stage4in[31]}),    .dec_out(shftadd340_out));

bindec3 shftadd3061(.bin_in ({shftadd3051_out[2:0], shftadd3050_out[3]}), .dec_out(shftadd3061_out));
bindec3 shftadd3060(.bin_in ({shftadd3050_out[2:0], shftadd349_out[3]}), .dec_out(shftadd3060_out));
bindec3 shftadd359 (.bin_in ({shftadd349_out[2:0],  shftadd348_out[3]}), .dec_out(shftadd359_out));
bindec3 shftadd358 (.bin_in ({shftadd348_out[2:0],  shftadd347_out[3]}), .dec_out(shftadd358_out));
bindec3 shftadd357 (.bin_in ({shftadd347_out[2:0],  shftadd346_out[3]}), .dec_out(shftadd357_out));
bindec3 shftadd356 (.bin_in ({shftadd346_out[2:0],  shftadd345_out[3]}), .dec_out(shftadd356_out));
bindec3 shftadd355 (.bin_in ({shftadd345_out[2:0],  shftadd344_out[3]}), .dec_out(shftadd355_out));
bindec3 shftadd354 (.bin_in ({shftadd344_out[2:0],  shftadd343_out[3]}), .dec_out(shftadd354_out));
bindec3 shftadd353 (.bin_in ({shftadd343_out[2:0],  shftadd342_out[3]}), .dec_out(shftadd353_out));
bindec3 shftadd352 (.bin_in ({shftadd342_out[2:0],  shftadd341_out[3]}), .dec_out(shftadd352_out));
bindec3 shftadd351 (.bin_in ({shftadd341_out[2:0],  shftadd340_out[3]}), .dec_out(shftadd351_out));
bindec3 shftadd350 (.bin_in ({shftadd340_out[2:0],  stage4in[30]}),    .dec_out(shftadd350_out));

bindec3 shftadd3072(.bin_in ({1'b0, shftadd3041_out[3], shftadd3051_out[3], shftadd3061_out[3]}), .dec_out(shftadd3072_out));
bindec3 shftadd3071(.bin_in ({shftadd3061_out[2:0], shftadd3060_out[3]}), .dec_out(shftadd3071_out));
bindec3 shftadd3070(.bin_in ({shftadd3060_out[2:0], shftadd359_out[3]}), .dec_out(shftadd3070_out));
bindec3 shftadd369 (.bin_in ({shftadd359_out[2:0], shftadd358_out[3]}), .dec_out(shftadd369_out)) ;
bindec3 shftadd368 (.bin_in ({shftadd358_out[2:0], shftadd357_out[3]}), .dec_out(shftadd368_out)) ;
bindec3 shftadd367 (.bin_in ({shftadd357_out[2:0], shftadd356_out[3]}), .dec_out(shftadd367_out)) ;
bindec3 shftadd366 (.bin_in ({shftadd356_out[2:0], shftadd355_out[3]}), .dec_out(shftadd366_out)) ;
bindec3 shftadd365 (.bin_in ({shftadd355_out[2:0], shftadd354_out[3]}), .dec_out(shftadd365_out)) ;
bindec3 shftadd364 (.bin_in ({shftadd354_out[2:0], shftadd353_out[3]}), .dec_out(shftadd364_out)) ;
bindec3 shftadd363 (.bin_in ({shftadd353_out[2:0], shftadd352_out[3]}), .dec_out(shftadd363_out)) ;
bindec3 shftadd362 (.bin_in ({shftadd352_out[2:0], shftadd351_out[3]}), .dec_out(shftadd362_out)) ;
bindec3 shftadd361 (.bin_in ({shftadd351_out[2:0], shftadd350_out[3]}), .dec_out(shftadd361_out)) ;
bindec3 shftadd360 (.bin_in ({shftadd350_out[2:0], stage4in[29]}),       .dec_out(shftadd360_out)) ;

bindec3 shftadd3082(.bin_in ({shftadd3072_out[2:0], shftadd3071_out[3]}), .dec_out(shftadd3082_out));
bindec3 shftadd3081(.bin_in ({shftadd3071_out[2:0], shftadd3070_out[3]}), .dec_out(shftadd3081_out));
bindec3 shftadd3080(.bin_in ({shftadd3070_out[2:0], shftadd369_out[3]}),  .dec_out(shftadd3080_out));
bindec3 shftadd379 (.bin_in ({shftadd369_out[2:0],  shftadd368_out[3]}),  .dec_out(shftadd379_out));
bindec3 shftadd378 (.bin_in ({shftadd368_out[2:0],  shftadd367_out[3]}),  .dec_out(shftadd378_out));
bindec3 shftadd377 (.bin_in ({shftadd367_out[2:0],  shftadd366_out[3]}),  .dec_out(shftadd377_out));
bindec3 shftadd376 (.bin_in ({shftadd366_out[2:0],  shftadd365_out[3]}),  .dec_out(shftadd376_out));
bindec3 shftadd375 (.bin_in ({shftadd365_out[2:0],  shftadd364_out[3]}),  .dec_out(shftadd375_out));
bindec3 shftadd374 (.bin_in ({shftadd364_out[2:0],  shftadd363_out[3]}),  .dec_out(shftadd374_out));
bindec3 shftadd373 (.bin_in ({shftadd363_out[2:0],  shftadd362_out[3]}),  .dec_out(shftadd373_out));
bindec3 shftadd372 (.bin_in ({shftadd362_out[2:0],  shftadd361_out[3]}),  .dec_out(shftadd372_out));
bindec3 shftadd371 (.bin_in ({shftadd361_out[2:0],  shftadd360_out[3]}),  .dec_out(shftadd371_out));
bindec3 shftadd370 (.bin_in ({shftadd360_out[2:0],  stage4in[28]}),     .dec_out(shftadd370_out));

bindec3 shftadd3092(.bin_in ({shftadd3082_out[2:0], shftadd3081_out[3]}), .dec_out(shftadd3092_out));
bindec3 shftadd3091(.bin_in ({shftadd3081_out[2:0], shftadd3080_out[3]}), .dec_out(shftadd3091_out));
bindec3 shftadd3090(.bin_in ({shftadd3080_out[2:0], shftadd379_out[3]}),  .dec_out(shftadd3090_out));
bindec3 shftadd389 (.bin_in ({shftadd379_out[2:0],  shftadd378_out[3]}),  .dec_out(shftadd389_out));
bindec3 shftadd388 (.bin_in ({shftadd378_out[2:0],  shftadd377_out[3]}),  .dec_out(shftadd388_out));
bindec3 shftadd387 (.bin_in ({shftadd377_out[2:0],  shftadd376_out[3]}),  .dec_out(shftadd387_out));
bindec3 shftadd386 (.bin_in ({shftadd376_out[2:0],  shftadd375_out[3]}),  .dec_out(shftadd386_out));
bindec3 shftadd385 (.bin_in ({shftadd375_out[2:0],  shftadd374_out[3]}),  .dec_out(shftadd385_out));
bindec3 shftadd384 (.bin_in ({shftadd374_out[2:0],  shftadd373_out[3]}),  .dec_out(shftadd384_out));
bindec3 shftadd383 (.bin_in ({shftadd373_out[2:0],  shftadd372_out[3]}),  .dec_out(shftadd383_out));
bindec3 shftadd382 (.bin_in ({shftadd372_out[2:0],  shftadd371_out[3]}),  .dec_out(shftadd382_out));
bindec3 shftadd381 (.bin_in ({shftadd371_out[2:0],  shftadd370_out[3]}),  .dec_out(shftadd381_out));
bindec3 shftadd380 (.bin_in ({shftadd370_out[2:0],  stage4in[27]}),     .dec_out(shftadd380_out));

bindec3  shftadd3103(.bin_in ({1'b0, shftadd3072_out[3], shftadd3082_out[3], shftadd3092_out[3]}), .dec_out(shftadd3103_out));
bindec3  shftadd3102(.bin_in ({shftadd3092_out[2:0], shftadd3091_out[3]}), .dec_out(shftadd3102_out));
bindec3  shftadd3101(.bin_in ({shftadd3091_out[2:0], shftadd3090_out[3]}), .dec_out(shftadd3101_out));
bindec3  shftadd3100(.bin_in ({shftadd3090_out[2:0], shftadd389_out[3]}),  .dec_out(shftadd3100_out));
bindec3  shftadd399 (.bin_in ({shftadd389_out[2:0],  shftadd388_out[3]}),  .dec_out(shftadd399_out));
bindec3  shftadd398 (.bin_in ({shftadd388_out[2:0],  shftadd387_out[3]}),  .dec_out(shftadd398_out));
bindec3  shftadd397 (.bin_in ({shftadd387_out[2:0],  shftadd386_out[3]}),  .dec_out(shftadd397_out));
bindec3  shftadd396 (.bin_in ({shftadd386_out[2:0],  shftadd385_out[3]}),  .dec_out(shftadd396_out));
bindec3  shftadd395 (.bin_in ({shftadd385_out[2:0],  shftadd384_out[3]}),  .dec_out(shftadd395_out));
bindec3  shftadd394 (.bin_in ({shftadd384_out[2:0],  shftadd383_out[3]}),  .dec_out(shftadd394_out));
bindec3  shftadd393 (.bin_in ({shftadd383_out[2:0],  shftadd382_out[3]}),  .dec_out(shftadd393_out));
bindec3  shftadd392 (.bin_in ({shftadd382_out[2:0],  shftadd381_out[3]}),  .dec_out(shftadd392_out));
bindec3  shftadd391 (.bin_in ({shftadd381_out[2:0],  shftadd380_out[3]}),  .dec_out(shftadd391_out));
bindec3  shftadd390 (.bin_in ({shftadd380_out[2:0],  stage4in[26]}),     .dec_out(shftadd390_out));
                                      
//stage 13
always @(posedge CLK) 
    if (RESET) stage4out <= 0;
    else stage4out <= {shftadd3103_out[3:0],
                       shftadd3102_out[3:0],
                       shftadd3101_out[3:0],
                       shftadd3100_out[3:0],
                       shftadd399_out[3:0],
                       shftadd398_out[3:0],
                       shftadd397_out[3:0],
                       shftadd396_out[3:0],
                       shftadd395_out[3:0],
                       shftadd394_out[3:0],
                       shftadd393_out[3:0],
                       shftadd392_out[3:0],
                       shftadd391_out[3:0],
                       shftadd390_out[3:0],
                       stage4in[25:0]
                       };

endmodule
