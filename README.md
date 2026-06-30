# 32-bit RISC-V Processor

## Overview

This project implements a **32-bit Single-Cycle RISC-V Processor** in **Verilog HDL** based on the RV32I instruction set architecture. The processor is designed from scratch using modular hardware design principles and verified through simulation using dedicated testbenches.

The project demonstrates the complete datapath and control logic required to fetch, decode, execute, access memory, and write back instructions in a single clock cycle.

---

## Features

* 32-bit RISC-V (RV32I) Architecture
* Modular Verilog Design
* Single-Cycle Datapath
* Arithmetic Logic Unit (ALU)
* Register File
* Program Counter (PC)
* Instruction Memory
* Data Memory
* Immediate Generator
* Control Unit
* Branch and Jump Support
* Individual Testbenches for Verification

---

## Project Structure

```text
32-bit-RISC-V-Processor
│
├── rtl/              # Verilog source files
├── testbench/        # Testbench files
├── simulation/       # Simulation outputs (optional)
├── images/           # Architecture diagrams and waveforms
├── docs/             # Project documentation
└── README.md
```

---

## Processor Modules

* Program Counter (PC)
* Instruction Memory
* Control Unit
* Register File
* Immediate Generator
* ALU
* ALU Control
* Data Memory
* Multiplexers
* Branch Logic
* Top-Level CPU Module

---

## Tools Used

* Verilog HDL
* AMD Xilinx Vivado
* Git
* GitHub

---

## Simulation

Each hardware module has been verified using dedicated testbenches. Functional simulation has been performed to validate the processor's behavior under different instruction sequences.

---

## Learning Outcomes

This project helped in understanding:

* Computer Architecture
* RISC-V ISA
* Digital Logic Design
* RTL Design using Verilog
* Processor Datapath Design
* Control Signal Generation
* Hardware Verification
* FPGA Design Workflow

---

## Future Improvements

* Five-stage pipelined processor
* Hazard Detection Unit
* Data Forwarding
* Branch Prediction
* Instruction Cache
* Data Cache
* CSR Support
* RV32M Extension (Multiply/Divide)
* FPGA Implementation

---

## Author

**Raushan Kumar**

Engineering Student (EE VLSI) | VLSI & Digital Design Enthusiast
JAYPEE INSTITUTE OF INFORMATION TECHNOLOGY, NOIDA 
www.linkedin.com/in/raushan-kumar-a717681b9

---

If you find this project useful, feel free to star the repository and share your feedback.
