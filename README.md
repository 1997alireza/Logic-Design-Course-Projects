# Logic-Design-Course-Projects

The projects created by Verilog for logic design course in university

## [16bit Adder](https://github.com/1997alireza/Logic-Design-Course-Projects/tree/master/16bit%20Adder)
#####The logic design midterm project
Here are two waves to implement the 16bit Adder. First [Ripple Carry Adder](https://en.wikipedia.org/wiki/Adder_(electronics)#Ripple-carry_adder) as `module Adder1_16bit` implemented by 16 `module FullAdder` and second [Carry Lookahead Adder](https://en.wikipedia.org/wiki/Lookahead_carry_unit#16-bit_adder) as `module Adder2_16bit` implemented by 4 `module Adder4_CarryLookahead` that combined together.
I tested it by `module Adder16_TB` and you can see the [result waveform](https://github.com/1997alireza/Logic-Design-Course-Projects/blob/master/16bit%20Adder/waveform/waveform.jpg)

## [Traffic Light](https://github.com/1997alireza/Logic-Design-Course-Projects/tree/master/Traffic%20Light)
#####The logic design final project

It's a traffic light for a crossroad with the ability for policeman to control it directly by `A`, `B` and `R` switchs. There is two sensors , `A_Traffic` and `B_Traffic` detects the traffic in the A street and B street and it can stop the counters according to the traffics.
I tested it by `module TestBench` and you can see the [result waveform](https://github.com/1997alireza/Logic-Design-Course-Projects/blob/master/Traffic%20Light/waveform/waveform.png). 
I've implemented a [SR FlipFlop](https://en.wikipedia.org/wiki/Flip-flop_(electronics)) and a 4-bit counter with a synchronized reset for this project.
  
