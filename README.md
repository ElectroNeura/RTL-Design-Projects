# RTL Design Projects

A collection of RTL design and verification projects developed using **Verilog HDL** and **AMD Vivado**.

This repository documents the complete development process of small digital hardware blocks — from RTL design and testbench development to simulation, waveform analysis, debugging, and verification.

---

## Projects

### 01 — RAM8_8

An **8-bit × 8-depth synchronous RAM** design implemented in Verilog HDL.

**Highlights:**
- 8-bit data width
- 8 memory locations
- Read/write control
- Verilog RTL implementation
- Dedicated testbench
- Behavioral simulation
- Waveform analysis
- RTL schematic and block diagram

[View RAM8_8 Project](./RAM8_8/)

---

### 02 — FIFO

An **8-bit FIFO (First-In First-Out)** design implemented and verified using Verilog HDL.

**Highlights:**
- Write and read control
- Full and empty status flags
- FIFO data ordering verification
- Automated testbench
- Waveform-based verification
- Debugging of simulation timing/race-condition issues
- RTL schematic and block diagram

[View FIFO Project](./FIFO8_8/)

> **Note:** The current FIFO implementation uses 3-bit read/write pointers with the full-condition logic reserving one storage location, giving a practical capacity of 7 entries.

---

## Repository Structure

```text
RTL-Design-Projects/
│
├── RAM8_8/
│   ├── rtl/
│   ├── testbench/
│   ├── diagrams/
│   ├── simulation/
│   └── README.md
│
├── FIFO8_8/
│   ├── rtl/
│   ├── testbench/
│   ├── diagrams/
│   ├── simulation/
│   │   └── waveforms/
│   ├── docs/
│   └── README.md
│
└── README.md
```

Each project is organized independently so that the RTL, verification environment, diagrams, simulation results, and documentation can be reviewed separately.

---

## Design & Verification Flow

The projects follow a structured RTL development workflow:

```text
Specification
      ↓
RTL Design
      ↓
Testbench Development
      ↓
Behavioral Simulation
      ↓
Waveform Analysis
      ↓
Debugging
      ↓
Verification
      ↓
Documentation
```

The goal is not only to implement the hardware block, but also to document the verification and debugging process.

---

## Tools & Technologies

| Category | Tools / Technologies |
|---|---|
| HDL | Verilog HDL |
| Simulation | AMD Vivado |
| Waveform Analysis | Vivado Waveform Viewer |
| Design Inspection | Vivado RTL Schematic |
| Version Control | Git |
| Repository | GitHub |

---

## Verification Approach

Verification is performed using dedicated Verilog testbenches.

The projects include:

- Reset verification
- Functional stimulus
- Expected-vs-observed behavior checks
- Boundary-condition testing
- Status-flag verification
- Waveform inspection
- Debugging of simulation issues

Where applicable, both **manual waveform verification** and **automated testbench checks** are documented.

---

## Documentation

Each project contains its own README with details about:

- Design objective
- Specifications
- Architecture
- RTL implementation
- Testbench
- Verification methodology
- Simulation results
- Waveforms
- Debugging issues
- Design limitations
- Possible improvements

This repository is intended to serve as a growing portfolio of RTL design and verification work.

---

## Future Projects

Planned additions include more RTL blocks and verification projects such as:

- UART
- SPI
- I2C
- Counters
- Shift registers
- ALU
- Register files
- Memory controllers
- Additional FIFO architectures

The repository will gradually expand toward larger and more integration-oriented RTL designs.

---

## Author

**Sarath K**  
M.Tech — VLSI Design  
Electronics & Communication Engineering

Focused on **RTL Design, Digital Design, Verification, and VLSI Physical Design**.

---

## Repository Goal

The long-term goal of this repository is to build a structured collection of self-developed RTL projects demonstrating:

**Design → Verification → Debugging → Documentation → Physical Design**

