# AES-128 Encryption Engine (RTL-to-GDSII)

## Overview
This project implements an AES-128 encryption engine in Verilog and takes it through an RTL-to-GDSII ASIC implementation flow using OpenLane and the SkyWater SKY130 PDK.

## Features
- AES-128 encryption datapath
- Modular Verilog RTL design
- Functional simulation using Icarus Verilog and GTKWave
- Logic synthesis using Yosys
- ASIC physical design using OpenLane/OpenROAD
- Final GDSII generation
- Magic DRC completed with zero violations

## RTL Modules
- `aes_top.v` – top-level AES module
- `aes_round.v` – main AES round logic
- `aes_final_round.v` – final AES round
- `sub_bytes.v` – SubBytes transformation
- `shift_rows.v` – ShiftRows transformation
- `mix_columns.v` – MixColumns transformation
- `add_round_key.v` – AddRoundKey operation
- `aes_key_expand.v` – key expansion logic
- `sbox.v`, `sbox.mem` – AES substitution box

## ASIC Flow
The design was implemented using the following flow:

RTL Design → Simulation → Synthesis → Floorplanning → Placement → CTS → Routing → Magic DRC → GDSII Generation

## Tools Used
- Verilog
- Icarus Verilog
- GTKWave
- Yosys
- OpenLane
- OpenROAD
- Magic VLSI
- SkyWater SKY130 PDK
- Docker
- Linux

## Results
- Synthesis completed successfully
- Floorplanning completed successfully
- Placement completed successfully
- Routing completed successfully
- GDSII generated successfully
- Magic DRC completed with zero violations
- LVS stopped due to OpenLane environment variable issue (`EXT_NETLIST`), not a DRC/design-rule failure

## Project Structure
```text
rtl/        Verilog RTL source files
tb/         Testbenches
synth/      Synthesized gate-level netlist
gds/        Final GDSII layout
lef/        LEF file
docs/       Documentation
reports/   Reports
screenshots/ Layout and waveform screenshots# AES RTL Design in Verilog

AES datapath implementation in Verilog.

## Implemented Modules
- SBOX
- SubBytes
- ShiftRows
- MixColumns
- AddRoundKey
- AES Round

## Folder Structure

rtl/ → RTL source files  
tb/ → Testbenches  
sim/ → Simulation outputs  
reports/ → Screenshots

## Simulation

Compile:

```bash
iverilog -o sim/output tb/aes_round_tb.v rtl/*.v
```

Run:

```bash
vvp sim/output
```

## Status
Working RTL simulation complete.
