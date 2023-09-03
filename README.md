![image](https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/33403244-c9dd-4aef-a022-da52e2eef51c)

Welcome to my GitHub repository dedicated to VLSI Physical Design for ASICs using open-source tools.

**Course Name** : VLSI Physical Design for ASICs  
**Instructor** : Kunal Ghosh 


# COURSE CONTENT



The course "VLSI Physical Design with ASIC" focuses on the practical aspects of designing and implementing integrated circuits using Application-Specific Integrated Circuits (ASICs). The course covers various stages of the physical design process, from logic synthesis to layout, with a focus on optimizing for performance, power efficiency, and manufacturability


## Installation

Install my-project using the run.sh 


```bash
 https://github.com/kunalg123/riscv_workshop_collaterals/blob/master/run.sh#L13
```

 Introduction
### Flow : HLL -> ALP -> Binary -> (HDL) -> GDS
#### 1. HLL -> High level language (c , c++) 
- A high-level programming language is a type of programming language that is designed to be more human-readable and user-friendly compared to low-level languages like assembly or machine code.

#### 2. ALP -> Assembly level program
- Assembly language is a low-level programming language that is closely related to the architecture of a specific computer's central processing unit (CPU). Assembly language programs are written using mnemonic codes that represent specific machine instructions which the machine can understand.

#### 3. HDL -> Hardware Description Language
- It is a specialized programming language used for designing and describing digital hardware circuits. HDLs allow engineers to model and simulate complex digital systems before physical implementation, aiding in the design and verification of integrated circuits and FPGA configurations.
- Verilog, System Verilog, VHDL

#### 4. GDS -> Graphic Data System (l

## Errors faced
sudo apt update

sudo apt upgrade

NOTE: if the config does not seem to function try locating the path and executing again

## Concept  
RISC-V (pronounced "RISC Five") is an open and free instruction set architecture (ISA) designed for computer processors.

Several companies and organizations have embraced RISC-V for their processor designs, including both general-purpose processors and specialized accelerators. Some companies have released RISC-V-based processors for commercial use.

RISC-V processors operate by fetching, decoding, and executing instructions according to the RISC-V instruction set architecture. The simplicity and modularity of RISC-V instructions, along with the open nature of the architecture, make it a versatile choice for a wide range of processor implementations, from simple embedded devices to high-performance servers.

## asic

# COURSE 
<details>
<summary>DAY 1: Introduction to RISCV ISA and GNU Compiler Toolchain</summary>
<br>

## Introduction to Risc-v Basic Keywords
- **Instruction Set Architecture(ISA)**
  - An Instruction Set Architecture (ISA) refers to the set of instructions that a computer's central processing unit (CPU) can understand and execute. It defines the interface between software and hardware, specifying the operations that a CPU can perform, the data types it can manipulate, and the memory addressing modes it supports.

- **Risc-V ISA**
  - Risc-V ISA is an open-source ISA that has simpler and fixed length instructions that allows us to create custom processors for specific needs without being tied to proprietary architectures
 
- **Tools Used for the flow**
  - As we are aware of the flow, we will be using Risc-v ISA ALP and the RTL used will be picorv32a (We will be using rv64i during initial stages)

# Goal : Any High level Program that is written should be able to get executed in our CHIP

### List of well-known extensions present in Risc-V ISA

``` rv32i``` ``` rv64i``` ```rv32imc``` ```rv64imc``` ```rv32imafdc``` ```rv64imafdc``` ```rv32imcb``` ```rv64imcb``` ```rv32imc_sv32``` ```rv64gcv```

### Extensions and their Applications

- **I (Integer)** :The I set includes the base integer instruction set for RISC-V. It provides fundamental integer arithmetic and logical operations, data movement, and control flow instructions.
  - ADD, SUB, AND, OR, XOR, ADDI, SLTI, JAL, BEQ, LW

- **M (Multiply and Divide)** : The M set adds integer multiplication and division instructions to the base integer set. These instructions are particularly useful for arithmetic-heavy computations.
  - MUL, MULH, DIV, REM
  
- **A (Atomic)** : The A set introduces atomic memory access instructions. These instructions enable multiple operations on memory locations to be performed atomically, ensuring that other processors or threads cannot observe intermediate states.
  - LR (Load-Reserved), SC (Store-Conditional), AMO (Atomic Memory Operation)
  
- **F (Single-Precision Floating-Point)**: The F set adds single-precision floating-point instructions. These instructions enable arithmetic operations on 32-bit floating-point numbers.
  - FADD.S, FSUB.S, FMUL.S, FDIV.S, FCVT.W.S, FCVT.S.W

- **D (Double-Precision Floating-Point)** : The D set includes double-precision floating-point instructions. These instructions allow arithmetic operations on 64-bit floating-point numbers.
  - FADD.D, FSUB.D, FMUL.D, FDIV.D, FCVT.W.D, FCVT.D.W

- **C (Compressed)** : The C set introduces a compressed instruction format that reduces the size of code. Compressed instructions maintain the same functionality as their non-compressed counterparts but use shorter encodings.
  - C.ADDI4SPN, C.LWSP, C.ADDI, C.SW, C.JALR, C.BEQZ

- **G (Atomic and Lock-Free Operations)** : The G set, also known as the "GAS Set," is an alternative to the A set. It focuses on providing atomic and lock-free instructions to simplify hardware implementation.
  - LRV (Load-Reserved Variant), SCV (Store-Conditional Variant), AMO (Atomic Memory Operation Variants)

- **V (Vector)** :The V set adds vector instructions to the ISA, enabling Single Instruction, Multiple Data (SIMD) operations. These instructions allow efficient parallel processing of data elements in vectors.
  - VADD, VMUL, VFMADD, VLW, VSW

- **S (Supervisor)** : The S set, often used in privileged modes, includes instructions for managing and interacting with the supervisor-level operations of the system, such as handling exceptions and interrupts.
  - ECALL, EBREAK, SRET, MRET, WFI

- **B (Bit Manipulation)** : The B set introduces instructions for bit manipulation operations, allowing efficient manipulation of individual bits in registers and memory.
  - ANDI, ORI, XORI, SLLI, SRLI, SRAI

## 1. Create a simple C program That calculates sum from 1 to N -> sum_1_to_N.c

_____Compile it using C compiler_____
```
gcc sum_1_to_N.c -o 1_to_N.o![lab_sum_num_from_1_to_100](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/8e800ff1-24dd-4930-95e9-53f92bd31abd)

./1_to_N.o
```

-o allows you to name your output file

![lab_sum_num_from_1_to_100](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/072365ec-265a-400e-bc65-f32be04a9f37)




_____compile using riscv compiler and view the output_____
```
riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o 1_to_N.o sum_1_to_N.c
spike pk 1_to_N.o
```
![sum_1_to_n_lab](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/6dfaa541-fba5-4a51-9978-1c9932e99007)


- ```-O<number>``` : level of optimisation required
- ```-mabi``` : specifies the ABI (Application Binary Interface) to be used during code generation according to the requirements
- ```-march``` : specifies target architecture

_______We can check the different options available for all these fields using the commands_______ 
go to the directory where riscv64-unkonwn-elf is present
- -O1 : ``` riscv64-unkonwn-elf --help=optimizer```
- -mabi : ```riscv64-unknown-elf-gcc --target-help```
- -march : ```riscv64-unknown-elf-gcc --target-help```

_____To view the disassembled ALP code_____
```
riscv64-unknown-elf-objdump -d 1_to_N.o
```






## Integer number Representation (n-bit)

- Range of Unsigned numbers : [0, (2^n)-1 ]
- ![unsigned_lab](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/2aa9e4b2-c160-47f3-8667-a0cc5092d685)
* Range of signed numbes : Positive : [0 , 2^(n-1)-1]
                         Negative : [-1 to 2^(n-1)]
  ![signed](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/d2940e07-5d9a-4aa6-a9d6-1d1ce63b59b9)
  



</details>
<details>
<summary>DAY 2 : Introduction to ABI and Basic Verification Flow </summary>
<br>

## BASICS :

Instructions that act on signed or unsigned integers are called Base Integer Instructions
There are 47 Base Integer Instructions present in RISC-V ISA

### Types of Instruction based on encoding format

1. **R-Type (Register-Type):**
   - These instructions operate on registers and have a fixed format for their operands.
   - Examples: ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SLTU

2. **I-Type (Immediate-Type):**
   - These instructions have an immediate operand and one register operand.
   - Examples: ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI, LB, LH, LW, LBU, LHU, JALR

3. **S-Type (Store-Type):**
   - These instructions are used for storing values from registers to memory.
   - Examples: SB, SH, SW

4. **B-Type (Branch-Type):**
   - These instructions perform conditional branching based on comparisons.
   - Examples: BEQ, BNE, BLT, BGE, BLTU, BGEU

5. **U-Type (Upper Immediate-Type):**
   - These instructions have a larger immediate field for encoding larger constants.
   - Examples: LUI, AUIPC

6. **J-Type (Jump-Type):**
   - These instructions are used for unconditional jumps and function calls.
   - Examples: JAL



1. **Opcode [7] :** The opcode is a field within a machine language instruction that indicates the operation to be performed by the instruction. It defines the type of operation, such as arithmetic, logic, memory access, or control flow. Opcodes are used by the CPU to determine how to execute the instruction.

2. **rd (Destination Register) [5]:** The "rd" field represents the destination register in an assembly language instruction. It indicates the register where the result of the operation will be stored. After executing the instruction, the computed value will be placed in this register.

3. **rs1 (Source Register 1) [5]:** The "rs1" field represents the first source register in an assembly language instruction. It indicates the register that holds the value used in the operation. For instructions that involve two operands, "rs1" typically corresponds to the first operand.

4. **rs2 (Source Register 2) [5]:** The "rs2" field represents the second source register in an assembly language instruction. It indicates the register that holds the value used in the operation. For instructions that involve three operands, "rs2" typically corresponds to the second operand.

5. **func7 and func3 (Function Fields)[7] [3]:** These fields further refine the operation specified by the opcode. The "func7" field is used to distinguish different variations of instructions within the same opcode category. The "func3" field is used to specify a more specific operation within the opcode category. Together, these fields allow for a finer level of instruction differentiation.

6. **imm (Immediate Value):** The "imm" field represents an immediate value that is part of the instruction. Immediate values are constants that are embedded within the instruction itself. They can be used for various purposes, such as specifying offsets, constants, or small data values directly within the instruction.


#### ABI : Application Binary Interface

The instructions generated by compiler using a target ISA can be accessed by OS and User directly
- The parts of ISA accessible to User : User ISA
- The parts of ISA accessible to OS : system ISA
The access is done using Sysytem calls with the help of ABI

==> If we want to access hardware resources of processor, it has to be done via registers using ABI(names)

### ABI Names : 
- ABI names for registers serve as a standardized way to designate the purpose and usage of specific registers within a software ecosystem. These names play a critical role in maintaining compatibility, optimizing code generation, and facilitating communication between different software components.


![1to9_custom](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/dc5f88bc-5cba-4a68-97f6-5f908edf614c)


![lab2](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/fef9dc71-cea0-49a3-9e5c-2407c1eb73fc)

# Labwork using ABI Function Calls
## Algorithm for C Program using ASM
- Incorporating assembly language code into a C program can be done using inline assembly or by linking separate assem    ers from memory

To store 64 bits of data from mem to reg, we use 8*8bit stores ie., m[0],m[1]......m[7].

    RISC-V uses Little Endian format to store the data ie., Least significant Byte is stored in m[0]

DAY 1: Ibly files with your C code.
- When you call an assembly function from your C code, the C calling convention is followed, including pushing arguments onto the stack or passing them in registers as required.
- The program executes the assembly function, following the assembly instructions you've provided.

![image](https://github.com/RohithNagesh/pes_asic_class/assets/103078929/1d76b7ef-cac9-4331-9190-31af36525e0c)

## Review ASM Function Calls
- You write your C code in one file and your assembly code in a separate file.
- In the assembly file, you declare assembly functions with appropriate signatures that match the calling conventions of your platform.


#### Data can be stored in register by 2 methods
1. Directly store in registers
2. Store into registers from memory


To store 64 bits of data from mem to reg, we use 8*8bit stores ie., m[0],m[1]......m[7]. 

- ___RISC-V uses Little Endian format to store the data ie., Least significant Byte is stored in m[0]___










## RTL design using Verilog with SKY130 Technology 

# COURSE 

</details>
<details>
<summary>DAY 3: Introduction to Verilog RTL Design and Synthesis </summary>
<br>


 
Welcome to the Verilog RTL Design and Synthesis guide! On this day, we'll cover the basics of Verilog and get you started on your journey in digital design.

## Table of Contents

- [What is Verilog?](#what-is-verilog)
- [Key Concepts](#key-concepts)

## What is Verilog?

Verilog is a hardware description language used for designing digital systems at various levels of abstraction. It allows engineers to describe the behavior and structure of digital circuits, making it an essential tool in the field of digital design.

## Key Concepts

- **Modules:** In Verilog, designs are organized into modules, which represent functional blocks of a circuit.

- **Signals:** Signals are used to model inputs, outputs, and internal connections in a module.

- **Registers:** Verilog designs often involve flip-flops and registers, which store and manipulate data.

- **Combination and Sequential Logic:** Verilog supports both combinational logic (where outputs depend only on current inputs) and sequential logic (where outputs depend on current inputs and previous state).



## Overview

This repository contains the Verilog design files for a multiplexer called "good_mux_1". It also includes instructions for synthesis and simulation using GTKWave.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Design Files](#design-files)
3. [Synthesis](#synthesis)
4. [Simulation](#simulation)
5. [License](#license)

## Prerequisites

Before you begin, ensure you have the following installed:

- A Verilog synthesis tool (e.g., Xilinx Vivado, Synopsys Design Compiler).
- A Verilog simulation tool (e.g., ModelSim).
- GTKWave for waveform viewing.
- (Add any other prerequisites specific to your project)

## Design Files

The design consists of the following Verilog files:

- `good_mux_1.v`: The main multiplexer module.

![good_mux_1_](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/8613bb15-ecda-4797-8576-c89a99a08e82)



![verilog_files](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/5085e450-aed2-4d78-8ab8-84bcb775fd26)

## Synthesis

To synthesize the "good_mux_1" design using your preferred synthesis tool, follow these general steps:

1. Open your synthesis tool.
2. Create a new project or workspace.
3. Add the Verilog files from this repository to your project.
4. Set the target FPGA device and synthesis constraints.
5. Launch the synthesis process.
6. Review the synthesis report for any errors or warnings.


![synthesis_illustration](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/1ac59093-7b78-4404-8dcc-0aab7332f7dd)



![good_mux_1](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/582639c2-1e35-44e8-aea2-65b68b8b9d3c)


## Simulation

To simulate the "good_mux_1" design using ModelSim and view the waveforms in GTKWave, follow these steps:



![gtkwave](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/01854222-1d91-4bd8-b96f-89c9f25dba79)




<details>
<summary><strong>part 2: Design Flow and Simulation</strong></summary>

Welcome to the Verilog RTL Design and Synthesis guide! Today, we'll delve into the design flow and simulation processes involved in creating robust digital designs using Verilog.

## Table of Contents

- [Design Flow](#design-flow)
- [Writing RTL Code](#writing-rtl-code)
- [Simulation](#simulation)

## Design Flow

1. **RTL Design:** Write the RTL code that describes the desired functionality of your circuit.

2. **Functional Simulation:** Simulate your RTL code using tools like ModelSim or VCS to verify correct behavior.

3. **Synthesis:** Convert RTL code into gate-level representation using synthesis tools like Synopsys Design Compiler.

4. **Gate-Level Simulation:** Simulate the gate-level netlist to ensure functional equivalence with RTL simulation.

5. **Optimization:** Optimize the gate-level design for area, power, and timing using tools like PrimeTime.

## Writing RTL Code

- Use an HDL like Verilog to describe the desired behavior of your circuit.
- Create reusable modules for different parts of your design.
- Utilize combinational and sequential constructs to achieve specific logic functionality.

## Simulation

- **Functional Simulation:** Verify that your RTL code behaves as expected using testbenches and simulators.
- **Waveform Viewing:** Analyze signal behavior using waveform viewers during simulation.

</details>

<!-- Include Day 3, Day 4, and so on... -->

<details>
<summary><strong>Resources</strong></summary>

Here are some resources to further your understanding of Verilog RTL design and synthesis:

- Books: "Digital Design and Computer Architecture" by David Harris and Sarah Harris
- Online Tutorials: Verilog tutorials on websites like [ASIC World](http://www.asic-world.com/), [Verilog Tutorial](https://www.verilog-tutorial.info/), and [EDA Playground](https://www.edaplayground.com/)

</details>


</details>
<details>
<summary>DAY 4: Timing libs,heirarchical vs flat synthesis and efficient flop coding styles </summary>
<br>


# Hierarchical and Flat Synthesis using Yosys

This repository contains an example project demonstrating the process of hierarchical and flat synthesis using Yosys. The project includes Verilog code files and instructions to perform both hierarchical and flat synthesis on a design.

## Contents

- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Hierarchical Synthesis](#hierarchical-synthesis)
- [Flat Synthesis](#flat-synthesis)
- [Usage](#usage)
- [License](#license)

## Introduction

This project aims to illustrate the concepts of hierarchical and flat synthesis using Yosys, a popular open-source synthesis tool. The Verilog design consists of multiple modules that are synthesized hierarchically and then flattened into a single-level netlist.

## Project Structure

The project is organized as follows:

- `verilog_files/`: Directory containing Verilog design files.
- `lib/`: Directory containing standard cell library files.
- `README.md`: This README file.

## Hierarchical Synthesis

1. Navigate to the `verilog_files` directory.
2. Invoke Yosys using the command `yosys`.
3. Once inside Yosys, follow the sequence of commands mentioned below:

- read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
- read_verilog multiple_modules.v
- synth -top multiple_modules
- abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
- show multiple_modules
- write_verilog -noattr multiple_modules_hier.v

![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/ad8d3d47-9c36-4662-9a45-246dedb9b124)

4. Open the generated `multiple_modules_hier.v` file using a text editor or a tool like `gvim`.

## Flat Synthesis

1. Navigate to the `verilog_files` directory.
2. Invoke Yosys using the command `yosys`.
3. Once inside Yosys, follow the sequence of commands mentioned below:

- read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
- read_verilog multiple_modules.v
- synth -top multiple_modules
- abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
- flatten
- show
- write_verilog -noattr multiple_modules_flat.v

![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/4f7d2b65-5e7d-4710-8d41-73c8892aa5f7)

4. Open the generated `multiple_modules_flat.v` file using a text editor or a tool like `gvim`.

## Modules

### async_reset

The `asyncres` module showcases the implementation of an asynchronous reset in a digital design.

![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/813ecbe0-a92d-4cda-b0f4-026ada1e399b)


![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/a74a17a7-cd21-400f-ba07-850f0bd2c7d9)


### sync_reset

The `syncres` module demonstrates the implementation of a synchronous reset in a digital design.


![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/462a6e46-12be-4d39-ac21-01c7314709d1)




![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/89857b95-9cba-46a8-8218-d0036961972c)



### async_set

The `sync_set` module combines a asynchronous set with other logic for a more comprehensive example.



![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/c3660838-1d8f-46b2-b4a4-02d1d506164c)



![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/beb4a630-90c1-4b6c-beb9-067baf489b3c)




### mult2

![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/3232cd47-786f-4996-ba56-6a5a17395dbf)

### mult8

![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/95e945cc-6a1b-49a1-9167-70bbb200eef4)


### sub_module_1

![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/e7eab964-7453-4eca-8ed5-92c52502839c)


![image](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/4806b788-5462-4447-9efb-85bc80f61f8f)


## Usage

1. Navigate to the `verilog_files` directory.
2. Open the desired module's Verilog file in a text editor or an IDE.
3. Modify the design or study the code to understand the reset methodology being implemented.
4. Optionally, navigate to the `tests` directory to find testbenches for these modules.
5. Run simulations using tools like ModelSim or other preferred simulation environments to observe the behavior of each reset type.
6. 





</details>


</details>
<details>
<summary>DAY 5: Combination and Sequential optimizations</summary>
<br>

# Combination and Sequential Optimizations in Digital Logic Design

This repository explores the concepts of Combination and Sequential optimizations in digital logic design. Understanding these optimization techniques is crucial for creating efficient and high-performance digital circuits.

## What Are Combination and Sequential Optimizations?

### Combination Optimizations

Combination optimizations, also known as static optimizations, focus on improving the performance and efficiency of combinational logic circuits. These optimizations aim to reduce the number of logic gates, minimize propagation delays, and optimize logic expressions. Some common techniques include:

- **Boolean Algebra Simplification:** Applying laws and theorems of Boolean algebra to simplify logic expressions.
  
- **Karnaugh Maps (K-Maps):** A graphical method for simplifying logic functions by grouping adjacent 1s in truth tables.

- **Quine-McCluskey Algorithm:** An algorithmic approach to finding the minimal sum-of-products (SOP) expressions.

- **Logic Gate Substitution:** Replacing complex gate combinations with simpler, equivalent gate combinations.

### Sequential Optimizations

Sequential optimizations focus on improving the performance and functionality of sequential logic circuits, which include elements like flip-flops, registers, and state machines. These optimizations aim to reduce clock-to-q delays, increase clock frequencies, and minimize power consumption. Some common techniques include:

- **Pipeline Design:** Breaking down a sequential process into stages to allow for parallel processing and improved throughput.

- **Clock Gating:** Disabling the clock signal to specific registers or portions of the circuit when they are not in use to save power.

- **State Encoding:** Optimizing the encoding of states in finite state machines to reduce the number of flip-flops and transitions.

- **Retiming:** Shifting registers and logic gates to different locations within the circuit to improve critical path timing.



# Optimization Examples in Verilog

This repository contains Verilog code examples demonstrating both combination and sequential optimizations.

## Files

### Combination Optimizations

- `opt_check.v`: This Verilog file showcases combination optimizations in digital logic design.


![opt_check](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/1bf2ef16-ae75-4ab8-b6ed-b01893e1e3b8)


![opt_check_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/1548358e-9317-4008-a5be-30ec493f02c4)


- `opt_check2.v`: Another example demonstrating combination optimizations.

![opt_check2](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/92f9698f-2107-4510-9e81-22fdb13775b8)


![opt_check2_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/aec5461e-e3ff-40b7-93f8-13e0c34abbb6)


- `opt_check3.v`: A third Verilog file with combination optimization examples.


![opt_check3](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/bbd32f9a-9ca8-4186-bfcd-ca821b1b65a5)



![opt_check3_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/b54bfd18-fd7b-4d01-8845-b244e3045fb8)



- `opt_check4.v`: Additional combination optimization examples.


![opt_check4](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/19e11e41-4420-4e5d-b109-0baba232bdb7)



![opt_check4_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/848155d4-089d-433b-beb9-5fb09289e9f8)

- `opt_check4.v`: Further combination optimization examples.


![opt_check4](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/eec101bb-b070-4e10-844f-78de3cd23c46)



![opt_check4_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/10ea2258-a578-4b6f-ac43-ea5d71bfb548)



### Sequential Optimizations
- `multiple_modules_opt.v`: This Verilog file focuses on sequential optimizations in multi-module designs.
![multiple_module_opt](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/c7d2f816-a41c-4760-a157-f115fc4adee5)

- `multiple_modules_opt2.v`: Another Verilog file with further sequential optimization examples.
![multiple_module_opt2](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/e6c428f6-de75-4a29-a9d1-8794fe80c045)




### Flip-Flop Constant Optimization Examples

- `dff_const1.v`: Verilog code demonstrating flip-flop constant optimization (1-bit constant).


![dff_const1_wave](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/2267b5e4-efaf-4d0d-8c87-4ea80848abdd)



![dff_const1_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/28630626-3e66-4de8-aae0-35b47492f564)



- `dff_const2.v`: Verilog code demonstrating flip-flop constant optimization (2-bit constant).

![dff_const2_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/7ca7e1ac-de4c-4f1f-8c07-cb9358db2444)


![dff_const2_wave](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/eb0e3164-c3ad-4ed4-bc5a-abbcd91af6fd)


- `dff_const3.v`: Verilog code demonstrating flip-flop constant optimization (3-bit constant).


![dff_const3_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/d4440bea-b69d-47cc-8b3c-8821c59bc326)



![dff_const3_wave](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/3dd17a9b-0d69-4949-8b7e-36a2f5afaec5)

- `dff_const4.v`: Verilog code demonstrating flip-flop constant optimization (4-bit constant).



![dff_const4_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/f08a0505-61e8-43d4-91dd-575ee80b1dfd)




![dff_const4_wave](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/90a12b0a-42bd-4b6f-818b-67e0e4d83680)


- `dff_const5.v`: Verilog code demonstrating flip-flop constant optimization (5-bit constant).



![dff_const5_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/ea1758b1-df0f-4ffb-8b3d-557f9b288c74)




![dff_const5_wave](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/29fea88f-a420-4542-b854-46a2809c4d53)


- `counter_opt.v`: Verilog code demonstrating counter optimization.


![counter_opt_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/fc14b16f-3cca-4f08-9071-10d5c67e5662)


- `counter2_opt.v`: Verilog code demonstrating counter optimization.



![counter2_opt_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/a9399c53-73bf-4d9b-8e4a-35687a4710fd)





</details>
<details>
<summary>DAY 6: GLS,blocking vs non-blocking and Synthesis-Simulation mismatch </summary>
<br>


# GLS (Gate-Level Simulation) Read Me

## Table of Contents
1. Introduction
2. GLS Overview
3. Blocking vs. Non-blocking Assignments
4. Synthesis-Simulation Mismatch
5. Ternary Operator Schematic (MUX)
6. GLS Synthesis Diagram
7. Dealing with the "bad_mux_wave" Issue

---

## 1. Introduction

Welcome to the GLS (Gate-Level Simulation) Read Me file. This document aims to provide you with essential information about GLS, blocking vs. non-blocking assignments, and the challenges related to synthesis-simulation mismatches. Additionally, it covers specific topics such as the ternary operator schematic MUX, GLS synthesis diagrams, and how to handle the "bad_mux_wave" issue. Whether you are a beginner or an experienced engineer, this guide should help you navigate these complex topics effectively.

---

## 2. GLS Overview

GLS, or Gate-Level Simulation, is a crucial step in the digital design process. It involves simulating the design using gate-level representations, which accurately reflect how the digital logic will behave in hardware. The primary goals of GLS are to ensure that the RTL (Register-Transfer Level) design correctly maps to the gate-level implementation and to identify any potential issues before moving to the physical synthesis and manufacturing stages.

---

## 3. Blocking vs. Non-blocking Assignments

In Verilog and other hardware description languages, there are two types of assignments: blocking and non-blocking. Understanding the difference between these assignment types is essential for accurate simulation and proper design implementation.

- **Blocking Assignments:** These assignments are executed sequentially in the order they appear in the code. The value assigned to a signal is immediately updated, and any subsequent assignments depend on the updated value. Blocking assignments are denoted by the '=' operator.

- **Non-blocking Assignments:** These assignments are executed concurrently, meaning that all assignments are scheduled simultaneously and then executed together in a non-blocking manner. Non-blocking assignments are denoted by the '<=' operator.

It's crucial to use the correct assignment type in your code to avoid unexpected simulation results and synthesis-simulation mismatches.

---

## 4. Synthesis-Simulation Mismatch

Synthesis-simulation mismatches occur when there are differences between the behavior of a design in simulation (RTL or gate-level) and its actual behavior in hardware. These mismatches can lead to functional errors, timing violations, or even design failures. Common causes of mismatches include incorrect constraints, improper use of blocking/non-blocking assignments, and missing simulation models for specific hardware elements.

To avoid synthesis-simulation mismatches, it's essential to:

- Use appropriate simulation models and libraries for your target technology.
- Ensure accurate constraints and timing information.
- Use the correct assignment types (blocking/non-blocking).
- Verify that the synthesized netlist matches the RTL design in terms of functionality.

---

## 5. Ternary Operator Schematic (MUX)

The ternary operator (conditional operator) in hardware design acts like a multiplexer (MUX) and is commonly used to select between two values based on a condition. Its schematic representation resembles a 2-to-1 MUX, where one input is selected based on the condition signal.



![ternary_operator_mux](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/16123323-5d12-4fdd-ab6e-a458cf420ced)




![ternary_operator_mux_wave](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/e64a601a-5d7a-43bf-9e90-c301e3635332)




![ternary_operator_mux_wave_GLS](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/8628319d-2fba-425b-b8af-e5cf401f01e0)


---

## 6. GLS Synthesis Diagram

The GLS synthesis diagram is a visual representation of how your RTL design maps to the gate-level implementation. It helps you understand how different modules, logic gates, and signals are interconnected in your design. Refer to the synthesis diagram during the GLS process to ensure that the gate-level simulation accurately reflects your intended hardware behavior.



![GLS_synthesis_diagram](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/8a5de2b5-2fa4-445c-ab8d-4d3236bd339c)

---

## 7. Dealing with the "bad_mux_wave" Issue

The "bad_mux_wave" issue is a common error encountered during GLS, often associated with conditional statements and multiplexers. To address this issue:

1. **Review Your Conditional Logic:** Check your Verilog code for conditional statements, especially those involving MUX-like operations. Verify that the conditions and assignments are correctly implemented.

2. **Use Blocking or Non-blocking Assignments Appropriately:** Ensure that you use the appropriate assignment type (blocking or non-blocking) for MUX outputs based on your design requirements.

3. **Verify Signal Dependencies:** Check the dependencies of signals involved in conditional logic. Ensure that the sequencing of assignments matches your design intent.

4. **Check for Missing Signals or Modules:** Sometimes, the "bad_mux_wave" issue can be a result of missing signals or modules in your design. Review your RTL and verify that all necessary components are included.

5. **Consult Simulation and Synthesis Tools Documentation:** Consult the documentation of your simulation and synthesis tools for specific guidance on resolving the "bad_mux_wave" issue. Tool-specific solutions may be available.

Remember that debugging such issues may require a systematic approach, including reviewing code, checking signals, and referring to simulation and synthesis logs for additional information.



![bad_mux_wave](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/4a81b129-4b9e-4340-95a4-b33e06808f0c)


![bad_mux_GLS_wave](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/bb864b4f-85a0-4fe1-80dc-f8d2a82f9001)


---


---

## 8. Understanding Synthesis-Simulation Mismatch

Synthesis-simulation mismatches occur when there are discrepancies between the behavior of a digital design in simulation (often at the register-transfer level, RTL) and the actual behavior in hardware after synthesis. Detecting and resolving these mismatches is critical for producing reliable and functional hardware.

---

## 9. Common Causes of Synthesis-Simulation Mismatches

Synthesis-simulation mismatches can result from various factors, including:

- **Incorrect Constraints:** Timing, area, and other constraints that are not accurately specified can lead to mismatches.

- **Improper Clock Domain Crossing Handling:** Inconsistent handling of clock domains can cause issues.

- **Missing or Inaccurate Simulation Models:** Simulation tools may not accurately represent the behavior of specific hardware elements.

- **Incorrect Clock and Reset Synchronization:** Asynchronous signals and clock domain crossings require careful handling.

- **Sequential vs. Combinatorial Logic:** Differences in how sequential and combinatorial logic is handled can lead to mismatches.

---

## 10. Identifying the "blocking_caveat_wave_GLS" Issue

The "blocking_caveat_wave_GLS" issue is a specific simulation error that can occur during gate-level simulation (GLS) when you have a combination of blocking assignments in your Verilog code. It often manifests as a wave signal that doesn't change when expected, leading to unexpected simulation behavior.


![blocking_caveat_schematic](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/0a271c97-32a4-41e6-bd4e-5f837f2f8b76)




![blocking_caveat_wave](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/1d67f147-5c16-4394-8f9f-473ecc0fd594)

---

## 11. Resolving the "blocking_caveat_wave_GLS" Issue

To resolve the "blocking_caveat_wave_GLS" issue and prevent synthesis-simulation mismatches, follow these steps:

1. **Review Your Verilog Code:** Carefully inspect your Verilog code for any blocking assignments that might be causing the issue.

2. **Identify the Culprit:** Isolate the specific part of your code where the issue occurs. Look for scenarios where multiple blocking assignments are used together.

3. **Analyze Signal Dependencies:** Check if there are dependencies between signals that could cause contention due to the use of blocking assignments.

4. **Use Non-blocking Assignments:** In many cases, replacing some of the blocking assignments with non-blocking assignments can resolve the issue. Non-blocking assignments (`<=`) are often a better choice for sequential logic and can help avoid contention.

5. **Use Appropriate Blocking Assignments:** If you need to use blocking assignments, ensure they are used correctly and do not create contention between signals.

6. **Simulate with Care:** After making code changes, re-run your simulations and verify that the "blocking_caveat_wave_GLS" issue is resolved. Pay close attention to waveform changes and timing.

7. **Consult Tool Documentation:** If the issue persists, refer to the documentation of your simulation tool for specific guidance on handling the "blocking_caveat_wave_GLS" issue. Some tools may have unique requirements or workarounds.



![blocking_caveat_wave_GLS](https://github.com/rohithgopakumar/pes_asic_class/assets/131611312/1dd93c0e-d689-4f36-929a-4c9108ae2f57)

---

## 12. Conclusion

Synthesis-simulation mismatches can be challenging to diagnose and fix, but understanding the specific issue, such as the "blocking_caveat_wave_GLS" problem, is the first step toward resolution. By carefully reviewing your Verilog code, identifying the issue, and using the appropriate assignments, you can ensure that your gate-level simulations accurately represent the behavior of your hardware design. Debugging and resolving mismatches early in the design process will lead to more reliable and predictable hardware outcomes.


