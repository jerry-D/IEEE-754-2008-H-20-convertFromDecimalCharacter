![](https://github.com/jerry-D/IEEE-754-2008_ISA_CPU/blob/master/images/SYMPL_CPU_LOGO.png)

## IEEE 754-2008  H=20 "convertFromDecimalCharacter"  
### Double-Precision FLoating-Point Operator for Xilinx UltraScale and UltraScale+ FPGAs

(November 1, 2018) Written in Verilog RTL for implementation in Xilinx UltraScale and UltraScale+ brand FPGAs, this is probably the world's only synthesizable IEEE 754-2008 compliant, H=20 binary64 format "convertFromDecimalCharacter" floating-point operator.  It is designed for ready incorporation into the new 64-bit, IEEE 754-2008 Floating-Point Instruction Set Architecture (ISA) CPU presently in development.

Its pipeline is 24 clocks deep, meaning that up to sixteen 64-bit results will be available for reading after 24 clocks from the first write of a 47-byte floating-point character string into each of this operator's sixteen 47-byte memory-mapped inputs.  

Since the new IEEE 754-2008 ISA CPU design includes new instructions that can read and write a 16-byte, 32-byte, 64-byte, 128-byte or 256-byte "gob" every clock cycle, up to sixteen binary64 results can be computed and written back out to system memory in as few as 40 clocks, which includes pushing each 41-byte character string into each operator input and reading each result out from their corresponding memory-mapped input/output address.

Stated another way, this design features sixteen memory-mapped inputs with corresponding result buffers that the binary-64 results automatically spill into.  When used with the SYMPL CPU "REPEAT" instruction, the effective/apparent latency is roughly 1.5 clocks per conversion.  This is because by the time the CPU has written each of the sixteen operands, the results from the first writes are already available for reading only eight clocks after the first write.

This design anticipates that the implementor will either pre-format/construct the string in software or additional hardware prior to the push.  

Here is some example code written in SYMPL Intermediate Language (IL) that computes sixteen, correctly rounded, binary64 format results "from" decimalCharacterSequences and writes the computed results out to byte-addressable system memory.  To simplify testing, the test-bench includes a H=20 binaryToDecimalCharacterSequence operator wherein binary64 format numbers are pushed into it it, such that immediately after the 16th push, the character sequences are read out in the same order and pushed into the binaryFromDecimalCharacterSequence operator.  Unless the CPU has something else to do, it will stall for eight clocks until the first results become available.

This repository contains the required synthesizable Verilog RTL and test bench to produce the results shown below.
```
    uw AR0 = uw:#listStart           ;load read pointer with starting address of list of binary64 format numbers
    uw AR1 = uw:#cnvTDCS.0           ;load write pointer with address of first operator input buffer
       REPEAT uw:#15                 ;load repeat counter with number of extra times the following instruction is to be executed              
    ud *AR1++[8]  = convertToDecimalCharacter:(ud:*AR0++[8], ub:#0)      ;push sixteen binary64 numbers into the operator

    uw AR2 = uw:#cnvTDCS.0           ;load read pointer with address of first binaryToCharacterSequence operator result buffer
    uw AR3 = uw:#cnvTFCS.0           ;load write pointer with first input address of the binaryFromCharacterSequence operator
       REPEAT uw:#15                 ;load repeat counter with number results to read out   
       
    g64 *AR3++[64] = convertFromDecimalCharacter:(g64:*AR2++[64])   ;pull sixteen 47-byte character sequences from their respective   
                                     ;result buffers and write them to the corresponding input of the binaryFromCharacterSequence
```
The above example SYMPL IL code performs 16 binaryToCharacterSequence conversions and 16 binaryFromCharacterSequence conversions in as few as 41 clocks.

Below are actual results of sixteen consecutive pushes into the binaryToCharacterSequence operator, one every clock, followed by 16 pushes of those results back into the binaryFromCharacterSequence operator, as demonstrated in the Verilog test bench provided in this repository.  The easiest way to see results for yourself is to run the simulation on the "free" version of Xilinx Vivado using the files provided at this repository.  Then, in the Vivado simulation environment, simply click on the two RAM modules in the design and scroll down to the first sixteen locations.  Set radix to ASCII to read the contents.

It should be noted that the binaryFromCharacterSequence results are actually 66 bits in length.  The two MSBs (not shown) hold an encoded exception (if any) that can be directly tested by the CPU and are automatically copied into the CPU's Status Register upon reading.

Also note that the binaryToCharacterSequence operator can accept binary16, binary32 and binary64 formated numbers directly, without having to explicitly convert them before pushing them in.
```
      34-byte Character Sequence Input                      Binary64 Result     Comment

      +00000000000003355443194222818687558174133e-020       417FFFFFFF135DDD   //33554431.94222818687558174133
      
      +17976931348623157081500000000000000000000e+268       7FEFFFFFFFFFFFFF   //largest integer

                                +nan 0 C001 FEED C0DE       7FF8C001FEEDC0DE   //quiet NaN with payload
                   
      +00000000000000000000049406564584124654418e-343       0000000000000001   //smallest (subnormal) number 
        
                               +snan 0 FEE1 600D C0DE       7FF0FEE1600DC0DE   //sNaN with payload
                  
      +00129807421463370700800000000000000000000e-020       43B203AF9EE75616   //1298074214633707008

      +05575186299632655487100000000000000000000e+072       52FB5E7E08CA3A8F   //5.5751862996326554871e91

                                                 -inf       FFF0000000000000   //-infinity
                                    
      +00000000000000000000078919994320999994169e-086       323546DB9A6A41D7   //78919994321e-77

      -00000000000000000000000000000000000000000e+000       8000000000000000   //-0

      +00000000000000000000150000000000000000000e-020       3FF8000000000000   //+1.5

      -18881545897087500382100000000000000000000e+249       FBFF000000000001   //-1.88815458970875003821e250

      +07378697629483820646400000000000000000000e-020       4410000000000000   //73786976294838206464

      +00000000000000000000022250738585072008890e-327       000FFFFFFFFFFFFF   //largest (subnormal)

      -00000000000000000000150000000000000000000e-020       BFF8000000000000   //-1.5

                                                 +inf       7FF0000000000000   //+infinity
                                    

```

