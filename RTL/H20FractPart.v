// H20FractPart.v
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


module H20FractPart (
    CLK          , 
    RESET        , 
    roundMode    ,  
    Away         ,
    wren         ,  
    wrdata       ,  
    bcdFractOut  ,
    fractInexact ,
    fractMask,
    subnLeadZeros,
    subnAddrs   
    );

input CLK;
input RESET;
input [1:0] roundMode;
input Away;
input wren;
input [63:0]  wrdata;
output [67:0] bcdFractOut;
output        fractInexact;
input  [51:0] fractMask;
output [5:0] subnLeadZeros;
output [5:0] subnAddrs;

//rounding mode encodings
parameter NEAREST = 2'b00;
parameter POSINF  = 2'b01;
parameter NEGINF  = 2'b10;
parameter ZERO    = 2'b11;


reg [67:0] fractD52_fractD51; 
reg [67:0] fractD50_fractD49;
reg [67:0] fractD48_fractD47; 
reg [67:0] fractD46_fractD45;
reg [67:0] fractD44_fractD43; 
reg [67:0] fractD42_fractD41;
reg [67:0] fractD40_fractD39; 
reg [67:0] fractD38_fractD37;
reg [67:0] fractD36_fractD35; 
reg [67:0] fractD34_fractD33;
reg [67:0] fractD32_fractD31; 
reg [67:0] fractD30_fractD29;
reg [67:0] fractD28_fractD27; 
reg [67:0] fractD26_fractD25;
reg [67:0] fractD24_fractD23; 
reg [67:0] fractD22_fractD21;
reg [67:0] fractD20_fractD19; 
reg [67:0] fractD18_fractD17;
reg [67:0] fractD16_fractD15;                                                         
reg [67:0] fractD14_fractD13;                                                         
reg [67:0] fractD12_fractD11; 
reg [67:0] fractD10_fractD9;
reg [67:0] fractD8_fractD7;   
reg [67:0] fractD6_fractD5;
reg [67:0] fractD4_fractD3;   
reg [67:0] fractD2_fractD1;
reg [67:0] fractD0_0;

reg [67:0] fractD52_fractD51__fractD50_fractD49;
reg [67:0] fractD48_fractD47__fractD46_fractD45;
reg [67:0] fractD44_fractD43__fractD42_fractD41;
reg [67:0] fractD40_fractD39__fractD38_fractD37;
reg [67:0] fractD36_fractD35__fractD34_fractD33;
reg [67:0] fractD32_fractD31__fractD30_fractD29;
reg [67:0] fractD28_fractD27__fractD26_fractD25;
reg [67:0] fractD24_fractD23__fractD22_fractD21;
reg [67:0] fractD20_fractD19__fractD18_fractD17;
reg [67:0] fractD16_fractD15__fractD14_fractD13;
reg [67:0] fractD12_fractD11__fractD10_fractD9; 
reg [67:0] fractD8_fractD7__fractD6_fractD5;
reg [67:0] fractD4_fractD3__fractD2_fractD1; 
reg [67:0] fractD0_0__0;

reg [67:0] fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45; 
reg [67:0] fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37;
reg [67:0] fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29; 
reg [67:0] fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21;
reg [67:0] fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13; 
reg [67:0] fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5;
reg [67:0] fractD4_fractD3__fractD2_fractD1____fractD0_0__0;
   
reg [67:0] fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45______fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37;
reg [67:0] fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29______fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21;
reg [67:0] fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13______fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5;
reg [67:0] fractD4_fractD3__fractD2_fractD1____fractD0_0__0______0;

reg [67:0] fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45______fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37________fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29______fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21;
reg [67:0] fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13______fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5_________fractD4_fractD3__fractD2_fractD1____fractD0_0__0______0;


reg [67:0] fractFinal;
reg [67:0] fractFinalq;

wire [67:0] bcdFractOut;


reg [57:0] chafD52_chafD51; 
reg [57:0] chafD50_chafD49;
reg [57:0] chafD48_chafD47; 
reg [57:0] chafD46_chafD45;
reg [57:0] chafD44_chafD43; 
reg [57:0] chafD42_chafD41;
reg [57:0] chafD40_chafD39; 
reg [57:0] chafD38_chafD37;
reg [57:0] chafD36_chafD35; 
reg [57:0] chafD34_chafD33;
reg [57:0] chafD32_chafD31; 
reg [57:0] chafD30_chafD29;
reg [57:0] chafD28_chafD27; 
reg [57:0] chafD26_chafD25;
reg [57:0] chafD24_chafD23; 
reg [57:0] chafD22_chafD21;
reg [57:0] chafD20_chafD19; 
reg [57:0] chafD18_chafD17;
reg [57:0] chafD16_chafD15;                                                         
reg [57:0] chafD14_chafD13;                                                         
reg [57:0] chafD12_chafD11; 
reg [57:0] chafD10_chafD9;
reg [57:0] chafD8_chafD7;   
reg [57:0] chafD6_chafD5;
reg [57:0] chafD4_chafD3;   
reg [57:0] chafD2_chafD1;
reg [57:0] chafD0_0;

reg [57:0] chafD52_chafD51__chafD50_chafD49;
reg [57:0] chafD48_chafD47__chafD46_chafD45;
reg [57:0] chafD44_chafD43__chafD42_chafD41;
reg [57:0] chafD40_chafD39__chafD38_chafD37;
reg [57:0] chafD36_chafD35__chafD34_chafD33;
reg [57:0] chafD32_chafD31__chafD30_chafD29;
reg [57:0] chafD28_chafD27__chafD26_chafD25;
reg [57:0] chafD24_chafD23__chafD22_chafD21;
reg [57:0] chafD20_chafD19__chafD18_chafD17;
reg [57:0] chafD16_chafD15__chafD14_chafD13;
reg [57:0] chafD12_chafD11__chafD10_chafD9; 
reg [57:0] chafD8_chafD7__chafD6_chafD5;
reg [57:0] chafD4_chafD3__chafD2_chafD1; 
reg [57:0] chafD0_0__0;

reg [57:0] chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45; 
reg [57:0] chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37;
reg [57:0] chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29; 
reg [57:0] chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21;
reg [57:0] chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13; 
reg [57:0] chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5;
reg [57:0] chafD4_chafD3__chafD2_chafD1____chafD0_0__0;
   
reg [57:0] chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45______chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37;
reg [57:0] chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29______chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21;
reg [57:0] chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13______chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5;
reg [57:0] chafD4_chafD3__chafD2_chafD1____chafD0_0__0______0;

reg [57:0] chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45______chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37________chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29______chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21;
reg [57:0] chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13______chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5_________chafD4_chafD3__chafD2_chafD1____chafD0_0__0______0;

reg [57:0] chafFinal;

reg [74:0] truncD52_truncD51; 
reg [74:0] truncD50_truncD49;
reg [74:0] truncD48_truncD47; 
reg [74:0] truncD46_truncD45;
reg [74:0] truncD44_truncD43; 
reg [74:0] truncD42_truncD41;
reg [74:0] truncD40_truncD39; 
reg [74:0] truncD38_truncD37;
reg [74:0] truncD36_truncD35; 
reg [74:0] truncD34_truncD33;
reg [74:0] truncD32_truncD31; 
reg [74:0] truncD30_truncD29;
reg [74:0] truncD28_truncD27; 
reg [74:0] truncD26_truncD25;
reg [74:0] truncD24_truncD23; 
reg [74:0] truncD22_truncD21;
reg [74:0] truncD20_truncD19; 
reg [74:0] truncD18_truncD17;
reg [74:0] truncD16_truncD15;                                                         
reg [74:0] truncD14_truncD13;                                                         
reg [74:0] truncD12_truncD11; 
reg [74:0] truncD10_truncD9;
reg [74:0] truncD8_truncD7;   
reg [74:0] truncD6_truncD5;
reg [74:0] truncD4_truncD3;   
reg [74:0] truncD2_truncD1;
reg [74:0] truncD0_0;

reg [74:0] truncD52_truncD51__truncD50_truncD49;
reg [74:0] truncD48_truncD47__truncD46_truncD45;
reg [74:0] truncD44_truncD43__truncD42_truncD41;
reg [74:0] truncD40_truncD39__truncD38_truncD37;
reg [74:0] truncD36_truncD35__truncD34_truncD33;
reg [74:0] truncD32_truncD31__truncD30_truncD29;
reg [74:0] truncD28_truncD27__truncD26_truncD25;
reg [74:0] truncD24_truncD23__truncD22_truncD21;
reg [74:0] truncD20_truncD19__truncD18_truncD17;
reg [74:0] truncD16_truncD15__truncD14_truncD13;
reg [74:0] truncD12_truncD11__truncD10_truncD9; 
reg [74:0] truncD8_truncD7__truncD6_truncD5;
reg [74:0] truncD4_truncD3__truncD2_truncD1; 
reg [74:0] truncD0_0__0;

reg [74:0] truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45; 
reg [74:0] truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37;
reg [74:0] truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29; 
reg [74:0] truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21;
reg [74:0] truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13; 
reg [74:0] truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5;
reg [74:0] truncD4_truncD3__truncD2_truncD1____truncD0_0__0;
   
reg [74:0] truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45______truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37;
reg [74:0] truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29______truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21;
reg [74:0] truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13______truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5;
reg [74:0] truncD4_truncD3__truncD2_truncD1____truncD0_0__0______0;

reg [74:0] truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45______truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37________truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29______truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21;
reg [74:0] truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13______truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5_________truncD4_truncD3__truncD2_truncD1____truncD0_0__0______0;

reg [74:0] truncFinal;

wire fractInexact;   
reg roundit;

reg [1:0] roundMode_del_1,
          roundMode_del_2,
          roundMode_del_3,
          roundMode_del_4,
          roundMode_del_5,
          roundMode_del_6,
          roundMode_del_7;

reg sign_del_1,
    sign_del_2,
    sign_del_3,
    sign_del_4,
    sign_del_5,
    sign_del_6,
    sign_del_7;

reg Away_del_1,
    Away_del_2,
    Away_del_3,
    Away_del_4,
    Away_del_5,
    Away_del_6,
    Away_del_7;
    

reg roundit_q;

wire [51:0] mant;
wire [10:0] biasedExp;
wire zeroIn;

assign biasedExp = wrdata[62:52];
assign mant = fractMask;
assign zeroIn = ~|wrdata[62:0];

//-----stage 0 
wire [66:0] FractWeight;
wire [73:0] FractTrunc;
wire [5:0]  subnLeadZeros;
wire [5:0] subnAddrs;
ROMweightsFract fractROM(
    .CLK    (CLK  ),
    .RESET  (RESET),
    .rden   (wren ),
    .rdaddrs(biasedExp[10:0]),
    .mantissa  (wrdata[51:0]),
    .FractWeight (FractWeight),
    .FractTrunc  (FractTrunc),
    .zeroIn (zeroIn),
    .subnLeadZeros(subnLeadZeros),
    .subnAddrs(subnAddrs)
    );    
        

wire [79:0] truncFinalAdj;
assign truncFinalAdj = {5'b0, truncFinal[74:0]};
wire [79:0] chafFinalPad;
assign chafFinalPad = {chafFinal[57:0], 22'b0};
wire [79:0] chafTruncFinal;
assign chafTruncFinal = truncFinalAdj + chafFinalPad;
wire [5:0] carries;
assign carries = chafTruncFinal[79:74];
wire [73:0] remaining;
assign remaining = chafTruncFinal[73:0];

always @(posedge CLK) begin
    if (RESET) begin
        fractD52_fractD51 <= 0; 
        fractD50_fractD49 <= 0;
        fractD48_fractD47 <= 0; 
        fractD46_fractD45 <= 0;
        fractD44_fractD43 <= 0; 
        fractD42_fractD41 <= 0;
        fractD40_fractD39 <= 0; 
        fractD38_fractD37 <= 0;
        fractD36_fractD35 <= 0; 
        fractD34_fractD33 <= 0;
        fractD32_fractD31 <= 0; 
        fractD30_fractD29 <= 0;
        fractD28_fractD27 <= 0; 
        fractD26_fractD25 <= 0;
        fractD24_fractD23 <= 0; 
        fractD22_fractD21 <= 0;
        fractD20_fractD19 <= 0; 
        fractD18_fractD17 <= 0;
        fractD16_fractD15 <= 0;                                                         
        fractD14_fractD13 <= 0;                                                         
        fractD12_fractD11 <= 0; 
        fractD10_fractD9 <= 0;
        fractD8_fractD7 <= 0;   
        fractD6_fractD5 <= 0;
        fractD4_fractD3 <= 0;   
        fractD2_fractD1 <= 0;
        fractD0_0 <= 0;

        fractD52_fractD51__fractD50_fractD49 <= 0;
        fractD48_fractD47__fractD46_fractD45 <= 0;
        fractD44_fractD43__fractD42_fractD41 <= 0;
        fractD40_fractD39__fractD38_fractD37 <= 0;
        fractD36_fractD35__fractD34_fractD33 <= 0;
        fractD32_fractD31__fractD30_fractD29 <= 0;
        fractD28_fractD27__fractD26_fractD25 <= 0;
        fractD24_fractD23__fractD22_fractD21 <= 0;
        fractD20_fractD19__fractD18_fractD17 <= 0;
        fractD16_fractD15__fractD14_fractD13 <= 0;
        fractD12_fractD11__fractD10_fractD9 <= 0; 
        fractD8_fractD7__fractD6_fractD5 <= 0;
        fractD4_fractD3__fractD2_fractD1 <= 0; 
        fractD0_0__0 <= 0;

        fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45 <= 0; 
        fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37 <= 0;
        fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29 <= 0; 
        fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21 <= 0;
        fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13 <= 0; 
        fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5 <= 0;
        fractD4_fractD3__fractD2_fractD1____fractD0_0__0 <= 0;

        fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45______fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37 <= 0;
        fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29______fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21 <= 0;
        fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13______fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5 <= 0;
        fractD4_fractD3__fractD2_fractD1____fractD0_0__0______0 <= 0;

        fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45______fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37________fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29______fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21 <= 0;
        fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13______fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5_________fractD4_fractD3__fractD2_fractD1____fractD0_0__0______0 <= 0;

        fractFinal <= 0;
        fractFinalq <= 0;
    end
    else begin
    //-----stage 2
        fractD52_fractD51 <=                      FractWeight              + (mant[51] ? { 1'b0, FractWeight[66: 1]} : 0);  
        fractD50_fractD49 <= ((mant[50] ? { 2'b0, FractWeight[66: 2]} : 0) + (mant[49] ? { 3'b0, FractWeight[66: 3]} : 0));
        fractD48_fractD47 <= ((mant[48] ? { 4'b0, FractWeight[66: 4]} : 0) + (mant[47] ? { 5'b0, FractWeight[66: 5]} : 0));
        fractD46_fractD45 <= ((mant[46] ? { 6'b0, FractWeight[66: 6]} : 0) + (mant[45] ? { 7'b0, FractWeight[66: 7]} : 0));
        fractD44_fractD43 <= ((mant[44] ? { 8'b0, FractWeight[66: 8]} : 0) + (mant[43] ? { 9'b0, FractWeight[66: 9]} : 0));
        fractD42_fractD41 <= ((mant[42] ? {10'b0, FractWeight[66:10]} : 0) + (mant[41] ? {11'b0, FractWeight[66:11]} : 0));
        fractD40_fractD39 <= ((mant[40] ? {12'b0, FractWeight[66:12]} : 0) + (mant[39] ? {13'b0, FractWeight[66:13]} : 0));
        fractD38_fractD37 <= ((mant[38] ? {14'b0, FractWeight[66:14]} : 0) + (mant[37] ? {15'b0, FractWeight[66:15]} : 0));
        fractD36_fractD35 <= ((mant[36] ? {16'b0, FractWeight[66:16]} : 0) + (mant[35] ? {17'b0, FractWeight[66:17]} : 0));
        fractD34_fractD33 <= ((mant[34] ? {18'b0, FractWeight[66:18]} : 0) + (mant[33] ? {19'b0, FractWeight[66:19]} : 0));
        fractD32_fractD31 <= ((mant[32] ? {20'b0, FractWeight[66:20]} : 0) + (mant[31] ? {21'b0, FractWeight[66:21]} : 0));
        fractD30_fractD29 <= ((mant[30] ? {22'b0, FractWeight[66:22]} : 0) + (mant[29] ? {23'b0, FractWeight[66:23]} : 0));
        fractD28_fractD27 <= ((mant[28] ? {24'b0, FractWeight[66:24]} : 0) + (mant[27] ? {25'b0, FractWeight[66:25]} : 0));
        fractD26_fractD25 <= ((mant[26] ? {26'b0, FractWeight[66:26]} : 0) + (mant[25] ? {27'b0, FractWeight[66:27]} : 0));
        fractD24_fractD23 <= ((mant[24] ? {28'b0, FractWeight[66:28]} : 0) + (mant[23] ? {29'b0, FractWeight[66:29]} : 0));
        fractD22_fractD21 <= ((mant[22] ? {30'b0, FractWeight[66:30]} : 0) + (mant[21] ? {31'b0, FractWeight[66:31]} : 0));
        fractD20_fractD19 <= ((mant[20] ? {32'b0, FractWeight[66:32]} : 0) + (mant[19] ? {33'b0, FractWeight[66:33]} : 0));
        fractD18_fractD17 <= ((mant[18] ? {34'b0, FractWeight[66:34]} : 0) + (mant[17] ? {35'b0, FractWeight[66:35]} : 0));
        fractD16_fractD15 <= ((mant[16] ? {36'b0, FractWeight[66:36]} : 0) + (mant[15] ? {37'b0, FractWeight[66:37]} : 0));
        fractD14_fractD13 <= ((mant[14] ? {38'b0, FractWeight[66:38]} : 0) + (mant[13] ? {39'b0, FractWeight[66:39]} : 0));
        fractD12_fractD11 <= ((mant[12] ? {40'b0, FractWeight[66:40]} : 0) + (mant[11] ? {41'b0, FractWeight[66:41]} : 0));
        fractD10_fractD9  <= ((mant[10] ? {42'b0, FractWeight[66:42]} : 0) + (mant[ 9] ? {43'b0, FractWeight[66:43]} : 0));
        fractD8_fractD7   <= ((mant[ 8] ? {44'b0, FractWeight[66:44]} : 0) + (mant[ 7] ? {45'b0, FractWeight[66:45]} : 0));  
        fractD6_fractD5   <= ((mant[ 6] ? {46'b0, FractWeight[66:46]} : 0) + (mant[ 5] ? {47'b0, FractWeight[66:47]} : 0));
        fractD4_fractD3   <= ((mant[ 4] ? {48'b0, FractWeight[66:48]} : 0) + (mant[ 3] ? {49'b0, FractWeight[66:49]} : 0));  
        fractD2_fractD1   <= ((mant[ 2] ? {50'b0, FractWeight[66:50]} : 0) + (mant[ 1] ? {51'b0, FractWeight[66:51]} : 0));
        fractD0_0         <= ((mant[ 0] ? {52'b0, FractWeight[66:52]} : 0)) ;                                                  
                                                                                                                                   
    //-----stage 3
        
        fractD52_fractD51__fractD50_fractD49 <= fractD52_fractD51 + fractD50_fractD49;
        fractD48_fractD47__fractD46_fractD45 <= fractD48_fractD47 + fractD46_fractD45;
        fractD44_fractD43__fractD42_fractD41 <= fractD44_fractD43 + fractD42_fractD41;
        fractD40_fractD39__fractD38_fractD37 <= fractD40_fractD39 + fractD38_fractD37;
        fractD36_fractD35__fractD34_fractD33 <= fractD36_fractD35 + fractD34_fractD33;
        fractD32_fractD31__fractD30_fractD29 <= fractD32_fractD31 + fractD30_fractD29;
        fractD28_fractD27__fractD26_fractD25 <= fractD28_fractD27 + fractD26_fractD25;
        fractD24_fractD23__fractD22_fractD21 <= fractD24_fractD23 + fractD22_fractD21;
        fractD20_fractD19__fractD18_fractD17 <= fractD20_fractD19 + fractD18_fractD17;
        fractD16_fractD15__fractD14_fractD13 <= fractD16_fractD15 + fractD14_fractD13;
        fractD12_fractD11__fractD10_fractD9  <= fractD12_fractD11 + fractD10_fractD9; 
        fractD8_fractD7__fractD6_fractD5     <= fractD8_fractD7   + fractD6_fractD5;
        fractD4_fractD3__fractD2_fractD1     <= fractD4_fractD3   + fractD2_fractD1;
        fractD0_0__0                         <= fractD0_0;
         
    //-----stage 4
        
        fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45 <= fractD52_fractD51__fractD50_fractD49 + fractD48_fractD47__fractD46_fractD45;
        fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37 <= fractD44_fractD43__fractD42_fractD41 + fractD40_fractD39__fractD38_fractD37;
        fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29 <= fractD36_fractD35__fractD34_fractD33 + fractD32_fractD31__fractD30_fractD29;
        fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21 <= fractD28_fractD27__fractD26_fractD25 + fractD24_fractD23__fractD22_fractD21;
        fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13 <= fractD20_fractD19__fractD18_fractD17 + fractD16_fractD15__fractD14_fractD13;
        fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5      <= fractD12_fractD11__fractD10_fractD9  + fractD8_fractD7__fractD6_fractD5;
        fractD4_fractD3__fractD2_fractD1____fractD0_0__0                             <= fractD4_fractD3__fractD2_fractD1     + fractD0_0__0;
        
    //-----stage 5
        
        fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45______fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37 <= 
                                                                          fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45 +
                                                                          fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37;
                                                                          
        fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29______fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21 <=
                                                                          fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29 +
                                                                          fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21;
        
        fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13______fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5      <=
                                                                          fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13 +
                                                                          fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5;
                                                                          
        fractD4_fractD3__fractD2_fractD1____fractD0_0__0______0  <= fractD4_fractD3__fractD2_fractD1____fractD0_0__0;                                                                 
                                                                          
                                                                          
    //-----stage 6
        
        fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45______fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37________fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29______fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21 <=
                                                                                                                                              fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45______fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37 +
                                                                                                                                              fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29______fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21;
                                                                                                                                              
        fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13______fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5_________fractD4_fractD3__fractD2_fractD1____fractD0_0__0______0 <= 
                                                                                                                                          fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13______fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5 + 
                                                                                                                                          fractD4_fractD3__fractD2_fractD1____fractD0_0__0______0;
    //-----stage 7

        fractFinal <= fractD52_fractD51__fractD50_fractD49____fractD48_fractD47__fractD46_fractD45______fractD44_fractD43__fractD42_fractD41____fractD40_fractD39__fractD38_fractD37________fractD36_fractD35__fractD34_fractD33____fractD32_fractD31__fractD30_fractD29______fractD28_fractD27__fractD26_fractD25____fractD24_fractD23__fractD22_fractD21 +
                    fractD20_fractD19__fractD18_fractD17____fractD16_fractD15__fractD14_fractD13______fractD12_fractD11__fractD10_fractD9____fractD8_fractD7__fractD6_fractD5_________fractD4_fractD3__fractD2_fractD1____fractD0_0__0______0 ;

    //-----stage 8
    
        fractFinalq <= fractFinal + carries + roundit;
    end             
end


assign  fractInexact = roundit_q;
assign bcdFractOut = fractFinalq;

always @(posedge CLK) begin
    if (RESET) begin
        chafD52_chafD51 <= 0; 
        chafD50_chafD49 <= 0;
        chafD48_chafD47 <= 0; 
        chafD46_chafD45 <= 0;
        chafD44_chafD43 <= 0; 
        chafD42_chafD41 <= 0;
        chafD40_chafD39 <= 0; 
        chafD38_chafD37 <= 0;
        chafD36_chafD35 <= 0; 
        chafD34_chafD33 <= 0;
        chafD32_chafD31 <= 0; 
        chafD30_chafD29 <= 0;
        chafD28_chafD27 <= 0; 
        chafD26_chafD25 <= 0;
        chafD24_chafD23 <= 0; 
        chafD22_chafD21 <= 0;
        chafD20_chafD19 <= 0; 
        chafD18_chafD17 <= 0;
        chafD16_chafD15 <= 0;                                                         
        chafD14_chafD13 <= 0;                                                         
        chafD12_chafD11 <= 0; 
        chafD10_chafD9 <= 0;
        chafD8_chafD7 <= 0;   
        chafD6_chafD5 <= 0;
        chafD4_chafD3 <= 0;   
        chafD2_chafD1 <= 0;
        chafD0_0 <= 0;

        chafD52_chafD51__chafD50_chafD49 <= 0;
        chafD48_chafD47__chafD46_chafD45 <= 0;
        chafD44_chafD43__chafD42_chafD41 <= 0;
        chafD40_chafD39__chafD38_chafD37 <= 0;
        chafD36_chafD35__chafD34_chafD33 <= 0;
        chafD32_chafD31__chafD30_chafD29 <= 0;
        chafD28_chafD27__chafD26_chafD25 <= 0;
        chafD24_chafD23__chafD22_chafD21 <= 0;
        chafD20_chafD19__chafD18_chafD17 <= 0;
        chafD16_chafD15__chafD14_chafD13 <= 0;
        chafD12_chafD11__chafD10_chafD9 <= 0; 
        chafD8_chafD7__chafD6_chafD5 <= 0;
        chafD4_chafD3__chafD2_chafD1 <= 0; 
        chafD0_0__0 <= 0;

        chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45 <= 0; 
        chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37 <= 0;
        chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29 <= 0; 
        chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21 <= 0;
        chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13 <= 0; 
        chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5 <= 0;
        chafD4_chafD3__chafD2_chafD1____chafD0_0__0 <= 0;

        chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45______chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37 <= 0;
        chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29______chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21 <= 0;
        chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13______chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5 <= 0;
        chafD4_chafD3__chafD2_chafD1____chafD0_0__0______0 <= 0;

        chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45______chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37________chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29______chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21 <= 0;
        chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13______chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5_________chafD4_chafD3__chafD2_chafD1____chafD0_0__0______0 <= 0;

        chafFinal <= 0;
    end
    else begin

    //-----stage 2
        chafD52_chafD51 <=                                                mant[51] ? {FractWeight[   0], 51'b0} : 0; 
        chafD50_chafD49 <= (mant[50] ? {FractWeight[ 1:0], 50'b0} : 0) + (mant[49] ? {FractWeight[ 2:0], 49'b0} : 0);
        chafD48_chafD47 <= (mant[48] ? {FractWeight[ 3:0], 48'b0} : 0) + (mant[47] ? {FractWeight[ 4:0], 47'b0} : 0);
        chafD46_chafD45 <= (mant[46] ? {FractWeight[ 5:0], 46'b0} : 0) + (mant[45] ? {FractWeight[ 6:0], 45'b0} : 0);
        chafD44_chafD43 <= (mant[44] ? {FractWeight[ 7:0], 44'b0} : 0) + (mant[43] ? {FractWeight[ 8:0], 43'b0} : 0);
        chafD42_chafD41 <= (mant[42] ? {FractWeight[ 9:0], 42'b0} : 0) + (mant[41] ? {FractWeight[10:0], 41'b0} : 0);
        chafD40_chafD39 <= (mant[40] ? {FractWeight[11:0], 40'b0} : 0) + (mant[39] ? {FractWeight[12:0], 39'b0} : 0);
        chafD38_chafD37 <= (mant[38] ? {FractWeight[13:0], 38'b0} : 0) + (mant[37] ? {FractWeight[14:0], 37'b0} : 0);
        chafD36_chafD35 <= (mant[36] ? {FractWeight[15:0], 36'b0} : 0) + (mant[35] ? {FractWeight[16:0], 35'b0} : 0);
        chafD34_chafD33 <= (mant[34] ? {FractWeight[17:0], 34'b0} : 0) + (mant[33] ? {FractWeight[18:0], 33'b0} : 0);
        chafD32_chafD31 <= (mant[32] ? {FractWeight[19:0], 32'b0} : 0) + (mant[31] ? {FractWeight[20:0], 31'b0} : 0);
        chafD30_chafD29 <= (mant[30] ? {FractWeight[21:0], 30'b0} : 0) + (mant[29] ? {FractWeight[22:0], 29'b0} : 0);
        chafD28_chafD27 <= (mant[28] ? {FractWeight[23:0], 28'b0} : 0) + (mant[27] ? {FractWeight[24:0], 27'b0} : 0);
        chafD26_chafD25 <= (mant[26] ? {FractWeight[25:0], 26'b0} : 0) + (mant[25] ? {FractWeight[26:0], 25'b0} : 0);
        chafD24_chafD23 <= (mant[24] ? {FractWeight[27:0], 24'b0} : 0) + (mant[23] ? {FractWeight[28:0], 23'b0} : 0);
        chafD22_chafD21 <= (mant[22] ? {FractWeight[29:0], 22'b0} : 0) + (mant[21] ? {FractWeight[30:0], 21'b0} : 0);
        chafD20_chafD19 <= (mant[20] ? {FractWeight[31:0], 20'b0} : 0) + (mant[19] ? {FractWeight[32:0], 19'b0} : 0);
        chafD18_chafD17 <= (mant[18] ? {FractWeight[33:0], 18'b0} : 0) + (mant[17] ? {FractWeight[34:0], 17'b0} : 0);
        chafD16_chafD15 <= (mant[16] ? {FractWeight[35:0], 16'b0} : 0) + (mant[15] ? {FractWeight[36:0], 15'b0} : 0);
        chafD14_chafD13 <= (mant[14] ? {FractWeight[37:0], 14'b0} : 0) + (mant[13] ? {FractWeight[38:0], 13'b0} : 0);
        chafD12_chafD11 <= (mant[12] ? {FractWeight[39:0], 12'b0} : 0) + (mant[11] ? {FractWeight[40:0], 11'b0} : 0);
        chafD10_chafD9  <= (mant[10] ? {FractWeight[41:0], 10'b0} : 0) + (mant[ 9] ? {FractWeight[42:0],  9'b0} : 0);
        chafD8_chafD7   <= (mant[ 8] ? {FractWeight[43:0],  8'b0} : 0) + (mant[ 7] ? {FractWeight[44:0],  7'b0} : 0);  
        chafD6_chafD5   <= (mant[ 6] ? {FractWeight[45:0],  6'b0} : 0) + (mant[ 5] ? {FractWeight[46:0],  5'b0} : 0);
        chafD4_chafD3   <= (mant[ 4] ? {FractWeight[47:0],  4'b0} : 0) + (mant[ 3] ? {FractWeight[48:0],  3'b0} : 0);  
        chafD2_chafD1   <= (mant[ 2] ? {FractWeight[49:0],  2'b0} : 0) + (mant[ 1] ? {FractWeight[50:0],  1'b0} : 0);
        chafD0_0        <=  mant[ 0] ? {FractWeight[51:0]} : 0 ;
        
    //-----stage 3
        
        chafD52_chafD51__chafD50_chafD49 <= chafD52_chafD51 + chafD50_chafD49;
        chafD48_chafD47__chafD46_chafD45 <= chafD48_chafD47 + chafD46_chafD45;
        chafD44_chafD43__chafD42_chafD41 <= chafD44_chafD43 + chafD42_chafD41;
        chafD40_chafD39__chafD38_chafD37 <= chafD40_chafD39 + chafD38_chafD37;
        chafD36_chafD35__chafD34_chafD33 <= chafD36_chafD35 + chafD34_chafD33;
        chafD32_chafD31__chafD30_chafD29 <= chafD32_chafD31 + chafD30_chafD29;
        chafD28_chafD27__chafD26_chafD25 <= chafD28_chafD27 + chafD26_chafD25;
        chafD24_chafD23__chafD22_chafD21 <= chafD24_chafD23 + chafD22_chafD21;
        chafD20_chafD19__chafD18_chafD17 <= chafD20_chafD19 + chafD18_chafD17;
        chafD16_chafD15__chafD14_chafD13 <= chafD16_chafD15 + chafD14_chafD13;
        chafD12_chafD11__chafD10_chafD9  <= chafD12_chafD11 + chafD10_chafD9; 
        chafD8_chafD7__chafD6_chafD5     <= chafD8_chafD7   + chafD6_chafD5;
        chafD4_chafD3__chafD2_chafD1     <= chafD4_chafD3   + chafD2_chafD1;
        chafD0_0__0                      <= chafD0_0;
         
    //-----stage 4
        
        chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45 <= chafD52_chafD51__chafD50_chafD49 + chafD48_chafD47__chafD46_chafD45;
        chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37 <= chafD44_chafD43__chafD42_chafD41 + chafD40_chafD39__chafD38_chafD37;
        chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29 <= chafD36_chafD35__chafD34_chafD33 + chafD32_chafD31__chafD30_chafD29;
        chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21 <= chafD28_chafD27__chafD26_chafD25 + chafD24_chafD23__chafD22_chafD21;
        chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13 <= chafD20_chafD19__chafD18_chafD17 + chafD16_chafD15__chafD14_chafD13;
        chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5      <= chafD12_chafD11__chafD10_chafD9  + chafD8_chafD7__chafD6_chafD5;
        chafD4_chafD3__chafD2_chafD1____chafD0_0__0                          <= chafD4_chafD3__chafD2_chafD1     + chafD0_0__0;
        
    //-----stage 5
        
        chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45______chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37 <= 
                                                                          chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45 +
                                                                          chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37;
                                                                          
        chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29______chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21 <=
                                                                          chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29 +
                                                                          chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21;
        
        chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13______chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5 <=
                                                                          chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13 +
                                                                          chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5;
                                                                          
        chafD4_chafD3__chafD2_chafD1____chafD0_0__0______0  <= chafD4_chafD3__chafD2_chafD1____chafD0_0__0;                                                                 
                                                                          
                                                                          
    //-----stage 6
        
        chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45______chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37________chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29______chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21 <=
                                                                                                                                              chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45______chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37 +
                                                                                                                                              chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29______chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21;
                                                                                                                                              
        chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13______chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5_________chafD4_chafD3__chafD2_chafD1____chafD0_0__0______0 <= 
                                                                                                                                          chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13______chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5 + 
                                                                                                                                          chafD4_chafD3__chafD2_chafD1____chafD0_0__0______0;
    //-----stage 7

        chafFinal <= chafD52_chafD51__chafD50_chafD49____chafD48_chafD47__chafD46_chafD45______chafD44_chafD43__chafD42_chafD41____chafD40_chafD39__chafD38_chafD37________chafD36_chafD35__chafD34_chafD33____chafD32_chafD31__chafD30_chafD29______chafD28_chafD27__chafD26_chafD25____chafD24_chafD23__chafD22_chafD21 +
                     chafD20_chafD19__chafD18_chafD17____chafD16_chafD15__chafD14_chafD13______chafD12_chafD11__chafD10_chafD9____chafD8_chafD7__chafD6_chafD5_________chafD4_chafD3__chafD2_chafD1____chafD0_0__0______0;
        
    end                                                                                             
end

always @(posedge CLK) begin
    if (RESET) begin
        truncD52_truncD51 <= 0; 
        truncD50_truncD49 <= 0;
        truncD48_truncD47 <= 0; 
        truncD46_truncD45 <= 0;
        truncD44_truncD43 <= 0; 
        truncD42_truncD41 <= 0;
        truncD40_truncD39 <= 0; 
        truncD38_truncD37 <= 0;
        truncD36_truncD35 <= 0; 
        truncD34_truncD33 <= 0;
        truncD32_truncD31 <= 0; 
        truncD30_truncD29 <= 0;
        truncD28_truncD27 <= 0; 
        truncD26_truncD25 <= 0;
        truncD24_truncD23 <= 0; 
        truncD22_truncD21 <= 0;
        truncD20_truncD19 <= 0; 
        truncD18_truncD17 <= 0;
        truncD16_truncD15 <= 0;                                                         
        truncD14_truncD13 <= 0;                                                         
        truncD12_truncD11 <= 0; 
        truncD10_truncD9 <= 0;
        truncD8_truncD7 <= 0;   
        truncD6_truncD5 <= 0;
        truncD4_truncD3 <= 0;   
        truncD2_truncD1 <= 0;
        truncD0_0 <= 0;

        truncD52_truncD51__truncD50_truncD49 <= 0;
        truncD48_truncD47__truncD46_truncD45 <= 0;
        truncD44_truncD43__truncD42_truncD41 <= 0;
        truncD40_truncD39__truncD38_truncD37 <= 0;
        truncD36_truncD35__truncD34_truncD33 <= 0;
        truncD32_truncD31__truncD30_truncD29 <= 0;
        truncD28_truncD27__truncD26_truncD25 <= 0;
        truncD24_truncD23__truncD22_truncD21 <= 0;
        truncD20_truncD19__truncD18_truncD17 <= 0;
        truncD16_truncD15__truncD14_truncD13 <= 0;
        truncD12_truncD11__truncD10_truncD9 <= 0; 
        truncD8_truncD7__truncD6_truncD5 <= 0;
        truncD4_truncD3__truncD2_truncD1 <= 0; 
        truncD0_0__0 <= 0;

        truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45 <= 0; 
        truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37 <= 0;
        truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29 <= 0; 
        truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21 <= 0;
        truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13 <= 0; 
        truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5 <= 0;
        truncD4_truncD3__truncD2_truncD1____truncD0_0__0 <= 0;

        truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45______truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37 <= 0;
        truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29______truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21 <= 0;
        truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13______truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5 <= 0;
        truncD4_truncD3__truncD2_truncD1____truncD0_0__0______0 <= 0;

        truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45______truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37________truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29______truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21 <= 0;
        truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13______truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5_________truncD4_truncD3__truncD2_truncD1____truncD0_0__0______0 <= 0;

        truncFinal <= 0;
    end
    else begin
    //-----stage 2
        truncD52_truncD51 <=                      FractTrunc              + (mant[51] ? { 1'b0, FractTrunc[73: 1]} : 0); 
        truncD50_truncD49 <= ((mant[50] ? { 2'b0, FractTrunc[73: 2]} : 0) + (mant[49] ? { 3'b0, FractTrunc[73: 3]} : 0));
        truncD48_truncD47 <= ((mant[48] ? { 4'b0, FractTrunc[73: 4]} : 0) + (mant[47] ? { 5'b0, FractTrunc[73: 5]} : 0));
        truncD46_truncD45 <= ((mant[46] ? { 6'b0, FractTrunc[73: 6]} : 0) + (mant[45] ? { 7'b0, FractTrunc[73: 7]} : 0));
        truncD44_truncD43 <= ((mant[44] ? { 8'b0, FractTrunc[73: 8]} : 0) + (mant[43] ? { 9'b0, FractTrunc[73: 9]} : 0));
        truncD42_truncD41 <= ((mant[42] ? {10'b0, FractTrunc[73:10]} : 0) + (mant[41] ? {11'b0, FractTrunc[73:11]} : 0));
        truncD40_truncD39 <= ((mant[40] ? {12'b0, FractTrunc[73:12]} : 0) + (mant[39] ? {13'b0, FractTrunc[73:13]} : 0));
        truncD38_truncD37 <= ((mant[38] ? {14'b0, FractTrunc[73:14]} : 0) + (mant[37] ? {15'b0, FractTrunc[73:15]} : 0));
        truncD36_truncD35 <= ((mant[36] ? {16'b0, FractTrunc[73:16]} : 0) + (mant[35] ? {17'b0, FractTrunc[73:17]} : 0));
        truncD34_truncD33 <= ((mant[34] ? {18'b0, FractTrunc[73:18]} : 0) + (mant[33] ? {19'b0, FractTrunc[73:19]} : 0));
        truncD32_truncD31 <= ((mant[32] ? {20'b0, FractTrunc[73:20]} : 0) + (mant[31] ? {21'b0, FractTrunc[73:21]} : 0));
        truncD30_truncD29 <= ((mant[30] ? {22'b0, FractTrunc[73:22]} : 0) + (mant[29] ? {23'b0, FractTrunc[73:23]} : 0));
        truncD28_truncD27 <= ((mant[28] ? {24'b0, FractTrunc[73:24]} : 0) + (mant[27] ? {25'b0, FractTrunc[73:25]} : 0));
        truncD26_truncD25 <= ((mant[26] ? {26'b0, FractTrunc[73:26]} : 0) + (mant[25] ? {27'b0, FractTrunc[73:27]} : 0));
        truncD24_truncD23 <= ((mant[24] ? {28'b0, FractTrunc[73:28]} : 0) + (mant[23] ? {29'b0, FractTrunc[73:29]} : 0));
        truncD22_truncD21 <= ((mant[22] ? {30'b0, FractTrunc[73:30]} : 0) + (mant[21] ? {31'b0, FractTrunc[73:31]} : 0));
        truncD20_truncD19 <= ((mant[20] ? {32'b0, FractTrunc[73:32]} : 0) + (mant[19] ? {33'b0, FractTrunc[73:33]} : 0));
        truncD18_truncD17 <= ((mant[18] ? {34'b0, FractTrunc[73:34]} : 0) + (mant[17] ? {35'b0, FractTrunc[73:35]} : 0));
        truncD16_truncD15 <= ((mant[16] ? {36'b0, FractTrunc[73:36]} : 0) + (mant[15] ? {37'b0, FractTrunc[73:37]} : 0));
        truncD14_truncD13 <= ((mant[14] ? {38'b0, FractTrunc[73:38]} : 0) + (mant[13] ? {39'b0, FractTrunc[73:39]} : 0));
        truncD12_truncD11 <= ((mant[12] ? {40'b0, FractTrunc[73:40]} : 0) + (mant[11] ? {41'b0, FractTrunc[73:41]} : 0));
        truncD10_truncD9  <= ((mant[10] ? {42'b0, FractTrunc[73:42]} : 0) + (mant[ 9] ? {43'b0, FractTrunc[73:43]} : 0));
        truncD8_truncD7   <= ((mant[ 8] ? {44'b0, FractTrunc[73:44]} : 0) + (mant[ 7] ? {45'b0, FractTrunc[73:45]} : 0));  
        truncD6_truncD5   <= ((mant[ 6] ? {46'b0, FractTrunc[73:46]} : 0) + (mant[ 5] ? {47'b0, FractTrunc[73:47]} : 0));
        truncD4_truncD3   <= ((mant[ 4] ? {48'b0, FractTrunc[73:48]} : 0) + (mant[ 3] ? {49'b0, FractTrunc[73:49]} : 0));  
        truncD2_truncD1   <= ((mant[ 2] ? {50'b0, FractTrunc[73:50]} : 0) + (mant[ 1] ? {51'b0, FractTrunc[73:51]} : 0));
        truncD0_0         <= ((mant[ 0] ? {52'b0, FractTrunc[73:52]} : 0)) ;
                                                                 
    //-----stage 3
        
        truncD52_truncD51__truncD50_truncD49 <= truncD52_truncD51 + truncD50_truncD49;
        truncD48_truncD47__truncD46_truncD45 <= truncD48_truncD47 + truncD46_truncD45;
        truncD44_truncD43__truncD42_truncD41 <= truncD44_truncD43 + truncD42_truncD41;
        truncD40_truncD39__truncD38_truncD37 <= truncD40_truncD39 + truncD38_truncD37;
        truncD36_truncD35__truncD34_truncD33 <= truncD36_truncD35 + truncD34_truncD33;
        truncD32_truncD31__truncD30_truncD29 <= truncD32_truncD31 + truncD30_truncD29;
        truncD28_truncD27__truncD26_truncD25 <= truncD28_truncD27 + truncD26_truncD25;
        truncD24_truncD23__truncD22_truncD21 <= truncD24_truncD23 + truncD22_truncD21;
        truncD20_truncD19__truncD18_truncD17 <= truncD20_truncD19 + truncD18_truncD17;
        truncD16_truncD15__truncD14_truncD13 <= truncD16_truncD15 + truncD14_truncD13;
        truncD12_truncD11__truncD10_truncD9  <= truncD12_truncD11 + truncD10_truncD9; 
        truncD8_truncD7__truncD6_truncD5     <= truncD8_truncD7   + truncD6_truncD5;
        truncD4_truncD3__truncD2_truncD1     <= truncD4_truncD3   + truncD2_truncD1;
        truncD0_0__0                         <= truncD0_0;
         
    //-----stage 4
        
        truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45 <= truncD52_truncD51__truncD50_truncD49 + truncD48_truncD47__truncD46_truncD45;
        truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37 <= truncD44_truncD43__truncD42_truncD41 + truncD40_truncD39__truncD38_truncD37;
        truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29 <= truncD36_truncD35__truncD34_truncD33 + truncD32_truncD31__truncD30_truncD29;
        truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21 <= truncD28_truncD27__truncD26_truncD25 + truncD24_truncD23__truncD22_truncD21;
        truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13 <= truncD20_truncD19__truncD18_truncD17 + truncD16_truncD15__truncD14_truncD13;
        truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5      <= truncD12_truncD11__truncD10_truncD9  + truncD8_truncD7__truncD6_truncD5;
        truncD4_truncD3__truncD2_truncD1____truncD0_0__0                             <= truncD4_truncD3__truncD2_truncD1     + truncD0_0__0;
        
    //-----stage 5
        
        truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45______truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37 <= 
                                                                          truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45 +
                                                                          truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37;
                                                                          
        truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29______truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21 <=
                                                                          truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29 +
                                                                          truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21;
        
        truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13______truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5      <=
                                                                          truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13 +
                                                                          truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5;
                                                                          
        truncD4_truncD3__truncD2_truncD1____truncD0_0__0______0  <= truncD4_truncD3__truncD2_truncD1____truncD0_0__0;                                                                 
                                                                          
                                                                          
    //-----stage 6
        
        truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45______truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37________truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29______truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21 <=
                                                                                                                                              truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45______truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37 +
                                                                                                                                              truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29______truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21;
                                                                                                                                              
        truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13______truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5_________truncD4_truncD3__truncD2_truncD1____truncD0_0__0______0 <= 
                                                                                                                                          truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13______truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5 + 
                                                                                                                                          truncD4_truncD3__truncD2_truncD1____truncD0_0__0______0;
    //-----stage 7

        truncFinal <= truncD52_truncD51__truncD50_truncD49____truncD48_truncD47__truncD46_truncD45______truncD44_truncD43__truncD42_truncD41____truncD40_truncD39__truncD38_truncD37________truncD36_truncD35__truncD34_truncD33____truncD32_truncD31__truncD30_truncD29______truncD28_truncD27__truncD26_truncD25____truncD24_truncD23__truncD22_truncD21 +
                      truncD20_truncD19__truncD18_truncD17____truncD16_truncD15__truncD14_truncD13______truncD12_truncD11__truncD10_truncD9____truncD8_truncD7__truncD6_truncD5_________truncD4_truncD3__truncD2_truncD1____truncD0_0__0______0;
    end
end



always @(posedge CLK) begin 
    if (RESET) begin
        roundMode_del_1 <= roundMode;
        roundMode_del_2 <= 0;
        roundMode_del_3 <= 0;
        roundMode_del_4 <= 0;
        roundMode_del_5 <= 0;
        roundMode_del_6 <= 0;
        roundMode_del_7 <= 0;
    end    
    else begin
        roundMode_del_1 <= roundMode;
        roundMode_del_2 <= roundMode_del_1;
        roundMode_del_3 <= roundMode_del_2;
        roundMode_del_4 <= roundMode_del_3;
        roundMode_del_5 <= roundMode_del_4;
        roundMode_del_6 <= roundMode_del_5;
        roundMode_del_7 <= roundMode_del_6;
    end    
end

always @(posedge CLK) begin
    if (RESET) begin
        sign_del_1 <= 0;
        sign_del_2 <= 0;
        sign_del_3 <= 0;
        sign_del_4 <= 0;
        sign_del_5 <= 0;
        sign_del_6 <= 0;
        sign_del_7 <= 0;
    end
    else begin
        sign_del_1 <= wrdata[63];
        sign_del_2 <= sign_del_1;
        sign_del_3 <= sign_del_2;
        sign_del_4 <= sign_del_3;
        sign_del_5 <= sign_del_4;
        sign_del_6 <= sign_del_5;
        sign_del_7 <= sign_del_6;
    end
end

always @(posedge CLK) begin 
    if (RESET) begin
        Away_del_1 <= 0;
        Away_del_2 <= 0;
        Away_del_3 <= 0;
        Away_del_4 <= 0;
        Away_del_5 <= 0;
        Away_del_6 <= 0;
        Away_del_7 <= 0;
    end
    else begin
        Away_del_1 <= Away;
        Away_del_2 <= Away_del_1;
        Away_del_3 <= Away_del_2;
        Away_del_4 <= Away_del_3;
        Away_del_5 <= Away_del_4;
        Away_del_6 <= Away_del_5;
        Away_del_7 <= Away_del_6;
    end    
end                                                                            

always @(posedge CLK)
    if (RESET) roundit_q <= 0;
    else roundit_q <= roundit;  
    
always @(*)
        case(roundMode_del_7)
            NEAREST : if (|truncFinal[73:72] || (Away_del_7 && ~|truncFinal[73:0])) roundit = 1'b1;    
                      else roundit = 1'b0;
            POSINF  : if (~sign_del_7 && |truncFinal[73:0]) roundit = 1'b1;
                      else roundit = 1'b0;
            NEGINF  : if (sign_del_7 && |truncFinal[73:0]) roundit = 1'b1;
                      else roundit = 1'b0;
            ZERO    : roundit = 1'b0;
        endcase


endmodule






