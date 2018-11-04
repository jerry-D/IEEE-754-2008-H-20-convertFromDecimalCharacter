// func_decBinH20.v
 
// Author:  Jerry D. Harthcock
// Version:  1.00  October 23, 2018
// Copyright (C) 2018.  All rights reserved.
//
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
 

 `timescale 1ns/100ps

module func_decBinH20 (
    RESET,
    CLK,
    round_mode_q2,
    Away_q2,
    wren,
    wraddrs,
    wrdata,
    rdenA,
    rdaddrsA,
    rddataA,
    rdenB,
    rdaddrsB,
    rddataB,
    ready
    );

input RESET, CLK, wren, rdenA, rdenB;
input [1:0] round_mode_q2;
input Away_q2;
input [3:0] wraddrs, rdaddrsA, rdaddrsB;   
input [375:0] wrdata;

output [65:0] rddataA, rddataB;
output ready;

                    
reg [15:0] semaphor;  // one for each memory location
reg readyA, readyB;


reg wren_del_0 ,  
    wren_del_1 , 
    wren_del_2 , 
    wren_del_3 , 
    wren_del_4 , 
    wren_del_5 , 
    wren_del_6 , 
    wren_del_7 , 
    wren_del_8 , 
    wren_del_9 , 
    wren_del_10, 
    wren_del_11, 
    wren_del_12, 
    wren_del_13, 
    wren_del_14, 
    wren_del_15, 
    wren_del_16, 
    wren_del_17, 
    wren_del_18, 
    wren_del_19,
    wren_del_20, 
    wren_del_21, 
    wren_del_22; 
    
reg [3:0] wraddrs_del_0,    
    wraddrs_del_1 , 
    wraddrs_del_2 , 
    wraddrs_del_3 , 
    wraddrs_del_4 , 
    wraddrs_del_5 , 
    wraddrs_del_6 , 
    wraddrs_del_7 , 
    wraddrs_del_8 , 
    wraddrs_del_9 , 
    wraddrs_del_10, 
    wraddrs_del_11, 
    wraddrs_del_12, 
    wraddrs_del_13, 
    wraddrs_del_14, 
    wraddrs_del_15, 
    wraddrs_del_16, 
    wraddrs_del_17, 
    wraddrs_del_18, 
    wraddrs_del_19,
    wraddrs_del_20, 
    wraddrs_del_21, 
    wraddrs_del_22; 

wire ready;

wire [65:0] rddataA, rddataB; 

assign ready = readyA && readyB;


wire [65:0] binOut;
decCharToBinH20 decCharToBin(
    .RESET     (RESET),     
    .CLK       (CLK  ),     
    .round_mode(round_mode_q2),
    .Away      (Away_q2),
    .wren      (wren   ),
    .wrdata    (wrdata),
    .binOut    (binOut)
    );

RAM_func #(.ADDRS_WIDTH(4), .DATA_WIDTH(66))
    ram64_decBin(
    .CLK        (CLK     ),
    .wren       (wren_del_22 ),
    .wraddrs    (wraddrs_del_22 ),   
    .wrdata     (binOut  ), 
    .rdenA      (rdenA   ),   
    .rdaddrsA   (rdaddrsA),
    .rddataA    (rddataA ),
    .rdenB      (rdenB   ),
    .rdaddrsB   (rdaddrsB),
    .rddataB    (rddataB )
    );


always @(posedge CLK) begin
    if (RESET) begin
        wren_del_0  <= 1'b0;
        wren_del_1  <= 1'b0;
        wren_del_2  <= 1'b0;
        wren_del_3  <= 1'b0;
        wren_del_4  <= 1'b0;
        wren_del_5  <= 1'b0;
        wren_del_6  <= 1'b0;
        wren_del_7  <= 1'b0;
        wren_del_8  <= 1'b0;
        wren_del_9  <= 1'b0;
        wren_del_10 <= 1'b0;
        wren_del_11 <= 1'b0;
        wren_del_12 <= 1'b0;
        wren_del_13 <= 1'b0;
        wren_del_14 <= 1'b0;
        wren_del_15 <= 1'b0;
        wren_del_16 <= 1'b0;
        wren_del_17 <= 1'b0;
        wren_del_18 <= 1'b0;
        wren_del_19 <= 1'b0;
        wren_del_20 <= 1'b0;
        wren_del_21 <= 1'b0;
        wren_del_22 <= 1'b0;
    end    
    else begin
        wren_del_0  <= wren;
        wren_del_1  <= wren_del_0 ;
        wren_del_2  <= wren_del_1 ;
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
        wren_del_16 <= wren_del_15;
        wren_del_17 <= wren_del_16;
        wren_del_18 <= wren_del_17;
        wren_del_19 <= wren_del_18;
        wren_del_20 <= wren_del_19;
        wren_del_21 <= wren_del_20;
        wren_del_22 <= wren_del_21;
    end                    
end

always @(posedge CLK) begin
    if (RESET) begin
        wraddrs_del_0  <= 4'b0;
        wraddrs_del_1  <= 4'b0;
        wraddrs_del_2  <= 4'b0;
        wraddrs_del_3  <= 4'b0;
        wraddrs_del_4  <= 4'b0;
        wraddrs_del_5  <= 4'b0;
        wraddrs_del_6  <= 4'b0;
        wraddrs_del_7  <= 4'b0;
        wraddrs_del_8  <= 4'b0;
        wraddrs_del_9  <= 4'b0;
        wraddrs_del_10 <= 4'b0;
        wraddrs_del_11 <= 4'b0;
        wraddrs_del_12 <= 4'b0;
        wraddrs_del_13 <= 4'b0;
        wraddrs_del_14 <= 4'b0;
        wraddrs_del_15 <= 4'b0;
        wraddrs_del_16 <= 4'b0;
        wraddrs_del_17 <= 4'b0;
        wraddrs_del_18 <= 4'b0;
        wraddrs_del_19 <= 4'b0;
        wraddrs_del_20 <= 4'b0;
        wraddrs_del_21 <= 4'b0;
        wraddrs_del_22 <= 4'b0;
    end    
    else begin
        wraddrs_del_0  <= wraddrs;
        wraddrs_del_1  <= wraddrs_del_0 ;
        wraddrs_del_2  <= wraddrs_del_1 ;
        wraddrs_del_3  <= wraddrs_del_2 ;
        wraddrs_del_4  <= wraddrs_del_3 ;
        wraddrs_del_5  <= wraddrs_del_4 ;
        wraddrs_del_6  <= wraddrs_del_5 ;
        wraddrs_del_7  <= wraddrs_del_6 ;
        wraddrs_del_8  <= wraddrs_del_7 ;
        wraddrs_del_9  <= wraddrs_del_8 ;
        wraddrs_del_10 <= wraddrs_del_9 ;
        wraddrs_del_11 <= wraddrs_del_10;
        wraddrs_del_12 <= wraddrs_del_11;
        wraddrs_del_13 <= wraddrs_del_12;
        wraddrs_del_14 <= wraddrs_del_13;
        wraddrs_del_15 <= wraddrs_del_14;
        wraddrs_del_16 <= wraddrs_del_15;
        wraddrs_del_17 <= wraddrs_del_16;
        wraddrs_del_18 <= wraddrs_del_17;
        wraddrs_del_19 <= wraddrs_del_18;
        wraddrs_del_20 <= wraddrs_del_19;
        wraddrs_del_21 <= wraddrs_del_20;
        wraddrs_del_22 <= wraddrs_del_21;
    end                    
end
    
always @(posedge CLK or posedge RESET) begin
    if (RESET) semaphor <= 16'hFFFF;
    else begin
        if (wren) semaphor[wraddrs] <= 1'b0;
        if (wren_del_22) semaphor[wraddrs_del_22] <= 1'b1;
    end
end     
  

always @(posedge CLK or posedge RESET) begin
    if (RESET) begin
        readyA <= 1'b1;
        readyB <= 1'b1;
    end  
    else begin
         readyA <= rdenA ? semaphor[rdaddrsA] : 1'b1;
         readyB <= rdenB ? semaphor[rdaddrsB] : 1'b1;
    end   
end

endmodule
