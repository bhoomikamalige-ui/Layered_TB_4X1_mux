# 4:1 MUX – Layered Testbench

## Project Overview
Verification of a 4:1 Multiplexer using a layered testbench architecture implemented in SystemVerilog.

## Design
- 4 input lines
- 2 select lines
- 1 output

## Testbench Components
- Transaction
- Generator
- Driver
- Monitor 1 and Monitor 2
- Scoreboard
- Environment
- Test
- Testbench Top

## Verification Methodology
Randomized stimulus is generated and applied to the DUT through a virtual interface. The monitors collect input and output signals, while the scoreboard calculates the expected output and compares it against the actual output.

## Tools Used
- SystemVerilog
- EDA Playground
- Siemens Questa Simulator

## Simulation Result
The simulation completed successfully with zero compilation errors. The waveform and scoreboard results verified the functionality of the 4:1 MUX.
