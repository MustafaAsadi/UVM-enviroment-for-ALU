UVM-Based ALU Verification Project
==================================

This project presents a complete Universal Verification Methodology (UVM) testbench for verifying an Arithmetic Logic Unit (ALU) written in SystemVerilog. The testbench is modular, reusable, and demonstrates constrained-random and directed testing, functional coverage, and a self-checking mechanism.

Key Features:
-------------
- Full UVM environment: driver, input and output monitors, sequencer, sequences, sequence item, scoreboard, input active and output passive agents, environment, and test classes
- Constrained-random and directed sequences for stimulus generation
- Functional coverage model focused on ALU opcodes and operand combinations
- Scoreboard for self-checking and DUT output validation
- Configurable via the UVM configuration database
- Designed for high functional coverage and thorough verification

Verified Design:
----------------
- ALU module written in SystemVerilog
- Supports operations: ADD, SUB, AND, OR, MUL, DIV

Tools Used:
-----------
- Language: SystemVerilog (UVM)
- Simulator: Synopsys VCS
- coverage and log-based validation

Results:
--------
- Achieved 99% functional coverage across all ALU operations
- Verified both randomized and edge-case scenarios using constrained and directed sequences
