//bindecH20_tb.v
 `timescale 1ns/100ps
// Author:  Jerry D. Harthcock
// Version:  1.00  September 14, 2018
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

module test_bindecH20_tb();


reg [3:0] wraddrs;    
reg [3:0] rdaddrs;
reg  rden ;

reg [63:0] wrdata;
reg wren; 
reg Away;
reg [1:0] Src_Size;
reg [1:0] round_mode;
reg reset;
reg clk;

reg wren_t1;    
reg [271:0] wrdata_t1;  
reg rdenA_t1;    
reg [3:0] rdaddrsA_t1;
reg rdenB_t1;   
reg [3:0]rdaddrsB_t1; 

wire [63:0] rddataA_t1; 
wire [63:0] rddataB_t1; 
wire ready_t1;   


reg [271:0] result[15:0];

wire [271:0] rddata;
wire [1:0] exceptCode;
wire ready;
wire [1:0] exceptCodeA_t1;
wire [1:0] exceptCodeB_t1;


// exception codes for two MSBs of rddata
parameter _no_excpt_   = 2'b00;  
parameter _underFlowExact_ = 2'b01;
parameter _underFlowInexact_  = 2'b10;  
parameter _inexact_    = 2'b11;                     

func_decBinH20 t1(                                               
    .RESET         (reset      ),                            
    .CLK           (clk        ),                             
    .round_mode_q2 (round_mode ),                             
    .Away_q2       (Away       ),                             
    .wren          (wren_t1    ),                            
    .wraddrs       (wraddrs    ),                            
    .wrdata        (wrdata_t1  ),                            
    .rdenA         (rdenA_t1   ),                            
    .rdaddrsA      (rdaddrs    ),
    .rddataA       ({exceptCodeA_t1, rddataA_t1}),
    .rdenB         (1'b0       ),
    .rdaddrsB      (4'b0       ),
    .rddataB       ({exceptCodeB_t1, rddataB_t1} ), 
    .ready         (ready_t1   )
    );

func_binDecH20 t(                                 
    .RESET         (reset     ),               
    .CLK           (clk       ),               
    .round_mode_q2 (round_mode),               
    .Away_q2       (Away      ),
    .Src_Size_q2   (Src_Size  ),               
    .wren          (wren      ),               
    .wraddrs       (wraddrs   ),               
    .wrdata        (wrdata    ),               
    .rden          (rden      ),               
    .rdaddrs       (rdaddrs   ),               
    .rddata        (rddata    ), 
    .exceptCode    (exceptCode),              
    .ready         (ready     )                
    );                                            
                                                             

   initial begin
      clk = 0;
   end
   always #5 clk = !clk;

   initial begin
      wren = 0;
      reset = 1;
      wraddrs = 4'h0;
      wrdata = 64'b0;
      Away = 1'b0;
      round_mode = 2'b00;
      Src_Size = 2'b11;
      rden = 1'b0;
      rdaddrs = 4'b0;
      rdaddrsA_t1 = 0;
      rdaddrsB_t1 = 0;
      wren = 1'b0;
      wren_t1 = 0;
      rdenA_t1 = 0;
      rdenB_t1 = 0;
      wrdata_t1 = 0;
      
      #22
      @(posedge clk);
      reset = 1'b0;
      #1 wrdata = {1'b0, 11'h7FF, 1'b1, 51'h0_C001_FEED_C0DE}; //qNaN with payload
      wraddrs = 4'h0;
      wren = 1'b1;      
      @(posedge clk);
     #1 wrdata =  64'h0000_0000_0000_0001;  //smallest (subnormal) number   
//     #1 wrdata =  32'h0000_0001;  //smallest (subnormal) number   
//     #1 wrdata =  16'h0001;  //smallest (subnormal) number   
      Src_Size = 2'b11;
      wraddrs = 4'h1;
      @(posedge clk);
     #1 wrdata = {1'b0, 11'h7FF, 1'b0, 51'h0_BAAD_FEED_C0DE}; //sNaN with payload
      Src_Size = 2'b11;
      wraddrs = 4'h2;
      @(posedge clk);                      
     #1 wrdata = 64'h43B203AF9EE75616;   //1298074214633707008
//     #1 wrdata = 64'h43B2038F9EE75616;   //1298074214633707008
      wraddrs = 4'h3;
      @(posedge clk);
     #1 wrdata = 64'h52FB5E7E08CA3A8F;   //55751862996326554871e+072
      wraddrs = 4'h4;
      @(posedge clk);
     #1 wrdata = 64'hFFF0000000000000;  //-infinity
      wraddrs = 4'h5;
      @(posedge clk);
     #1 wrdata = 64'h323546DB9A6A41D7;  //78919994320999994169e-086
      wraddrs = 4'h6;
      @(posedge clk);
     #1 wrdata = 64'h8000000000000000;   //-0
      wraddrs = 4'h7;
      @(posedge clk);
//     #1 wrdata = 64'h3FF8000000000000;   //+1.5
//     #1 wrdata = 64'h3FF0000000000000;   //+1.0
     #1 wrdata = 64'h0010000000000000;   //smallest normal
      wraddrs = 4'h8;
      @(posedge clk);
     #1 wrdata = 64'hFBFF000000000001;  //-1.88815458970875003819e250
      wraddrs = 4'h9;
      @(posedge clk);
     #1 wrdata = 64'h4410000000000000; // =73786976294838206464
      wraddrs = 4'hA;
      @(posedge clk);
     #1 wrdata = 64'h000FFFFFFFFFFFFF; //largest subnormal
      wraddrs = 4'hB;
      @(posedge clk);
     #1 wrdata = 64'hBFF8000000000000;   //-1.5
//     #1 wrdata = 64'hBFF0000000000000;   //-1.0
      wraddrs = 4'hC;
      @(posedge clk);
     #1 wrdata = 64'h7FF0000000000000;  //+infinity
      wraddrs = 4'hD;
      @(posedge clk);
     #1 wrdata = 64'h7FEFFFFFFFFFFFFF;  //largest integer
      wraddrs = 4'hE;
      @(posedge clk);
     #1 wrdata = 64'h417FFFFFFF135DDD;  //33554431942281687558174133e-20
      wraddrs = 4'hF;
      @(posedge clk); 
      #1 wren = 1'b0;      
      wraddrs = 4'h0;                                                            
      @(posedge clk);                                                            
      @(posedge clk);                                                            
      #1 rden = 1'b1;
      #1  rdaddrs = 4'h0;  
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'h0;                                                            
         wren_t1 = 1'b1;
      #1 rdaddrs = 4'h1;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'h1;                                                            
      #1 rdaddrs = 4'h2;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'h2;                                                            
      #1 rdaddrs = 4'h3;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'h3;                                                            
      #1 rdaddrs = 4'h4;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'h4;                                                            
      #1 rdaddrs = 4'h5;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'h5;                                                            
      #1 rdaddrs = 4'h6;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'h6;                                                            
      #1 rdaddrs = 4'h7;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'h7;                                                            
      #1 rdaddrs = 4'h8;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'h8;                                                            
      #1 rdaddrs = 4'h9;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'h9;                                                            
      #1 rdaddrs = 4'hA;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'hA;                                                            
      #1 rdaddrs = 4'hB;     
      @(posedge clk);    
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'hB;                                                            
      #1 rdaddrs = 4'hC;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'hC;                                                            
      #1 rdaddrs = 4'hD;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'hD;                                                            
      #1 rdaddrs = 4'hE;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'hE;                                                            
      #1 rdaddrs = 4'hF;     
      @(posedge clk);
      #1 result[rdaddrs] = rddata;
         wrdata_t1 = rddata;
         wraddrs = 4'hF;                                                            
      #1 rden = 1'b0;
      @(posedge clk);
      #1 wren_t1 = 0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);      
                   
      #1 reset = 1'b1;
       $finish;
   end




endmodule

        

