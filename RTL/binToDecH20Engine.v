//binToDecH20Engine.v
 `timescale 1ns/100ps
 // Author:  Jerry D. Harthcock
 // Version:  1.00  Sept. 25, 2018
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

module binToDecH20Engine(
    CLK           ,
    RESET         ,
    round_mode    ,
    Away          ,
    wren          ,
    wrdata        ,
    intDigit20    ,
    intDigit19    ,
    intDigit18    ,
    intDigit17    ,
    intDigit16    ,
    intDigit15    ,
    intDigit14    ,
    intDigit13    ,
    intDigit12    ,
    intDigit11    ,
    intDigit10    ,
    intDigit9     ,
    intDigit8     ,
    intDigit7     ,
    intDigit6     ,
    intDigit5     ,
    intDigit4     ,
    intDigit3     ,
    intDigit2     ,
    intDigit1     ,
    intDigit0     ,
    fractDigit19  ,
    fractDigit18  ,
    fractDigit17  ,
    fractDigit16  ,
    fractDigit15  ,
    fractDigit14  ,
    fractDigit13  ,
    fractDigit12  ,
    fractDigit11  ,
    fractDigit10  ,
    fractDigit9   ,
    fractDigit8   ,
    fractDigit7   ,
    fractDigit6   ,
    fractDigit5   ,
    fractDigit4   ,
    fractDigit3   ,
    fractDigit2   ,
    fractDigit1   ,
    fractDigit0   ,
    expDigit2     ,
    expDigit1     ,
    expDigit0     ,
    fractInexact  ,
    intInexact    ,
    fractionOnly  ,
    resultExponent,
    baseExp       
);

input CLK;
input RESET;
input [1:0] round_mode;
input Away;
input wren;
input [63:0] wrdata;
input [8:0] resultExponent;

output [3:0] intDigit20;
output [3:0] intDigit19;
output [3:0] intDigit18;
output [3:0] intDigit17;
output [3:0] intDigit16;
output [3:0] intDigit15;
output [3:0] intDigit14;
output [3:0] intDigit13;
output [3:0] intDigit12;
output [3:0] intDigit11;
output [3:0] intDigit10;
output [3:0] intDigit9;
output [3:0] intDigit8;
output [3:0] intDigit7;
output [3:0] intDigit6;
output [3:0] intDigit5;
output [3:0] intDigit4;
output [3:0] intDigit3;
output [3:0] intDigit2;
output [3:0] intDigit1;
output [3:0] intDigit0;
output [3:0] fractDigit19;
output [3:0] fractDigit18;
output [3:0] fractDigit17;
output [3:0] fractDigit16;
output [3:0] fractDigit15;
output [3:0] fractDigit14;
output [3:0] fractDigit13;
output [3:0] fractDigit12;
output [3:0] fractDigit11;
output [3:0] fractDigit10;
output [3:0] fractDigit9;
output [3:0] fractDigit8;
output [3:0] fractDigit7;
output [3:0] fractDigit6;
output [3:0] fractDigit5;
output [3:0] fractDigit4;
output [3:0] fractDigit3;
output [3:0] fractDigit2;
output [3:0] fractDigit1;
output [3:0] fractDigit0;
output [3:0] expDigit2;
output [3:0] expDigit1;
output [3:0] expDigit0;
output fractInexact;
output intInexact  ;
output fractionOnly;
output [8:0] baseExp;

reg [10:0] exp_del_1,
           exp_del_2,
           exp_del_3,
           exp_del_4,
           exp_del_5,
           exp_del_6,
           exp_del_7,
           exp_del_8,
           exp_del_9,
           exp_del_10,
           exp_del_11,
           exp_del_12,
           exp_del_13,
           exp_del_14,
           exp_del_15;

reg        wren_del_1,
           wren_del_2,
           wren_del_3,
           wren_del_4,
           wren_del_5,
           wren_del_6,
           wren_del_7,
           wren_del_8,
           wren_del_9,
           wren_del_10,
           wren_del_11,
           wren_del_12,
           wren_del_13,
           wren_del_14,
           wren_del_15;
           
reg fractionOnly_del_2,
    fractionOnly_del_3,
    fractionOnly_del_4,
    fractionOnly_del_5,
    fractionOnly_del_6,
    fractionOnly_del_7,
    fractionOnly_del_8,
    fractionOnly_del_9,
    fractionOnly_del_10,
    fractionOnly_del_11,
    fractionOnly_del_12,
    fractionOnly_del_13,
    fractionOnly_del_14,
    fractionOnly_del_15,
    fractionOnly_del_16;           

wire [3:0] intDigit20;
wire [3:0] intDigit19;
wire [3:0] intDigit18;
wire [3:0] intDigit17;
wire [3:0] intDigit16;
wire [3:0] intDigit15;
wire [3:0] intDigit14;
wire [3:0] intDigit13;
wire [3:0] intDigit12;
wire [3:0] intDigit11;
wire [3:0] intDigit10;
wire [3:0] intDigit9;
wire [3:0] intDigit8;
wire [3:0] intDigit7;
wire [3:0] intDigit6;
wire [3:0] intDigit5;
wire [3:0] intDigit4;
wire [3:0] intDigit3;
wire [3:0] intDigit2;
wire [3:0] intDigit1;
wire [3:0] intDigit0;
wire [3:0] fractDigit19;
wire [3:0] fractDigit18;
wire [3:0] fractDigit17;
wire [3:0] fractDigit16;
wire [3:0] fractDigit15;
wire [3:0] fractDigit14;
wire [3:0] fractDigit13;
wire [3:0] fractDigit12;
wire [3:0] fractDigit11;
wire [3:0] fractDigit10;
wire [3:0] fractDigit9;
wire [3:0] fractDigit8;
wire [3:0] fractDigit7;
wire [3:0] fractDigit6;
wire [3:0] fractDigit5;
wire [3:0] fractDigit4;
wire [3:0] fractDigit3;
wire [3:0] fractDigit2;
wire [3:0] fractDigit1;
wire [3:0] fractDigit0;
wire [3:0] expDigit2;
wire [3:0] expDigit1;
wire [3:0] expDigit0;
wire fractInexact  ;
wire intInexact    ;
wire fractionOnly  ;
wire [8:0] baseExp ;

wire [67:0] bcdIntOut;
wire [67:0] bcdFractOut;
wire [51:0] fractMask;

wire fractionOnly_del_1;

assign fractionOnly = fractionOnly_del_16;

binToBCD10 h20exp(   
    .binIn    ({1'b0, resultExponent}),   
    .decDigit2(expDigit2),
    .decDigit1(expDigit1),
    .decDigit0(expDigit0)
    );

wire [5:0] subnLeadZeros;
wire [5:0] subnAddrs;
H20IntegerPart h20int(      //this is 8 clocks deep
    .CLK          (CLK            ),  
    .RESET        (RESET          ),
    .roundMode    (round_mode     ),  
    .Away         (Away           ), 
    .wren         (wren           ), 
    .wrdata       (wrdata         ),  
    .bcdIntegerOut(bcdIntOut      ),  
    .intInexact   (intInexact     ),
    .fractMask    (fractMask      ),
    .fractionOnly (fractionOnly_del_1 ),
    .subnLeadZeros(subnLeadZeros )
    );

binToBCD68 bcdInt(     //this is 8 clocks deep
    .CLK       (CLK       ),
    .RESET     (RESET     ),
    .binIn     (bcdIntOut ),   
    .decDigit20(intDigit20),
    .decDigit19(intDigit19),
    .decDigit18(intDigit18),
    .decDigit17(intDigit17),
    .decDigit16(intDigit16),
    .decDigit15(intDigit15),
    .decDigit14(intDigit14),
    .decDigit13(intDigit13),
    .decDigit12(intDigit12),
    .decDigit11(intDigit11),
    .decDigit10(intDigit10),
    .decDigit9 (intDigit9 ),
    .decDigit8 (intDigit8 ),
    .decDigit7 (intDigit7 ),          
    .decDigit6 (intDigit6 ),
    .decDigit5 (intDigit5 ),
    .decDigit4 (intDigit4 ),
    .decDigit3 (intDigit3 ),
    .decDigit2 (intDigit2 ),
    .decDigit1 (intDigit1 ),
    .decDigit0 (intDigit0 )
    );

H20FractPart h20fract(      //this is 8 clocks deep
    .CLK          (CLK          ),
    .RESET        (RESET        ),
    .roundMode    (round_mode   ),   
    .Away         (Away         ),
    .wren         (wren         ),
    .wrdata       (wrdata       ),
    .bcdFractOut  (bcdFractOut  ),
    .fractInexact (fractInexact ),
    .fractMask    (fractMask    ),
    .subnLeadZeros(subnLeadZeros),
    .subnAddrs    (subnAddrs    )
    );     
                          
binToBCD68 bcdFract(       //this is 8 clocks deep
    .CLK       (CLK         ),
    .RESET     (RESET       ),
    .binIn     (bcdFractOut ),
    .decDigit20(),  
    .decDigit19(fractDigit19),  
    .decDigit18(fractDigit18),  
    .decDigit17(fractDigit17),  
    .decDigit16(fractDigit16),  
    .decDigit15(fractDigit15),  
    .decDigit14(fractDigit14),  
    .decDigit13(fractDigit13),  
    .decDigit12(fractDigit12),  
    .decDigit11(fractDigit11),
    .decDigit10(fractDigit10),
    .decDigit9 (fractDigit9 ),
    .decDigit8 (fractDigit8 ),
    .decDigit7 (fractDigit7 ),
    .decDigit6 (fractDigit6 ),
    .decDigit5 (fractDigit5 ),
    .decDigit4 (fractDigit4 ),
    .decDigit3 (fractDigit3 ),
    .decDigit2 (fractDigit2 ),
    .decDigit1 (fractDigit1 ),
    .decDigit0 (fractDigit0 )
    );
    
baseExpROM ExpROM(
    .CLK    (CLK    ),
    .RESET  (RESET  ),
    .rden   (wren_del_15),
    .rdaddrs(exp_del_15),
    .baseExp(baseExp),
    .subnAddrs(subnAddrs)
    );    

always @(posedge CLK) begin
    if (RESET) begin
       exp_del_1  <= 0;
       exp_del_2  <= 0;
       exp_del_3  <= 0;
       exp_del_4  <= 0;
       exp_del_5  <= 0; 
       exp_del_6  <= 0;
       exp_del_7  <= 0;
       exp_del_8  <= 0;
       exp_del_9  <= 0;
       exp_del_10 <= 0;
       exp_del_11 <= 0;
       exp_del_12 <= 0;
       exp_del_13 <= 0;
       exp_del_14 <= 0;
       exp_del_15 <= 0;
    end      
   else begin
       exp_del_1  <= wrdata[62:52];
       exp_del_2  <= exp_del_1;
       exp_del_3  <= exp_del_2 ;
       exp_del_4  <= exp_del_3 ;
       exp_del_5  <= exp_del_4 ; 
       exp_del_6  <= exp_del_5 ;
       exp_del_7  <= exp_del_6 ;
       exp_del_8  <= exp_del_7 ;
       exp_del_9  <= exp_del_8 ;
       exp_del_10 <= exp_del_9 ;
       exp_del_11 <= exp_del_10;
       exp_del_12 <= exp_del_11;
       exp_del_13 <= exp_del_12;
       exp_del_14 <= exp_del_13;
       exp_del_15 <= exp_del_14;
   end
end 

always @(posedge CLK) begin
    if (RESET) begin
       wren_del_1  <= 0;
       wren_del_2  <= 0;
       wren_del_3  <= 0;
       wren_del_4  <= 0;
       wren_del_5  <= 0; 
       wren_del_6  <= 0;
       wren_del_7  <= 0;
       wren_del_8  <= 0;
       wren_del_9  <= 0;
       wren_del_10 <= 0;
       wren_del_11 <= 0;
       wren_del_12 <= 0;
       wren_del_13 <= 0;
       wren_del_14 <= 0;
       wren_del_15 <= 0;
    end      
   else begin
       wren_del_1  <= wren;
       wren_del_2  <= wren_del_1;
       wren_del_3  <= wren_del_2 ;
       wren_del_4  <= wren_del_3 ;
       wren_del_5  <= wren_del_4 ; 
       wren_del_6  <= wren_del_5 ;
       wren_del_7  <= wren_del_6 ;
       wren_del_8  <= wren_del_7 ;
       wren_del_9  <= wren_del_8 ;
       wren_del_10 <= wren_del_9 ;
       wren_del_11 <= wren_del_10;
       wren_del_12 <= wren_del_11;
       wren_del_13 <= wren_del_12;
       wren_del_14 <= wren_del_13;
       wren_del_15 <= wren_del_14;
   end
end 

always @(posedge CLK) begin
    if (RESET) begin
       fractionOnly_del_2  <= 0;
       fractionOnly_del_3  <= 0;
       fractionOnly_del_4  <= 0;
       fractionOnly_del_5  <= 0; 
       fractionOnly_del_6  <= 0;
       fractionOnly_del_7  <= 0;
       fractionOnly_del_8  <= 0;
       fractionOnly_del_9  <= 0;
       fractionOnly_del_10 <= 0;
       fractionOnly_del_11 <= 0;
       fractionOnly_del_12 <= 0;
       fractionOnly_del_13 <= 0;
       fractionOnly_del_14 <= 0;
       fractionOnly_del_15 <= 0;
       fractionOnly_del_16 <= 0;
    end      
   else begin
       fractionOnly_del_2  <= fractionOnly_del_1;
       fractionOnly_del_3  <= fractionOnly_del_2 ;
       fractionOnly_del_4  <= fractionOnly_del_3 ;
       fractionOnly_del_5  <= fractionOnly_del_4 ; 
       fractionOnly_del_6  <= fractionOnly_del_5 ;
       fractionOnly_del_7  <= fractionOnly_del_6 ;
       fractionOnly_del_8  <= fractionOnly_del_7 ;
       fractionOnly_del_9  <= fractionOnly_del_8 ;
       fractionOnly_del_10 <= fractionOnly_del_9 ;
       fractionOnly_del_11 <= fractionOnly_del_10;
       fractionOnly_del_12 <= fractionOnly_del_11;
       fractionOnly_del_13 <= fractionOnly_del_12;
       fractionOnly_del_14 <= fractionOnly_del_13;
       fractionOnly_del_15 <= fractionOnly_del_14;
       fractionOnly_del_16 <= fractionOnly_del_15;
   end
end 

endmodule
