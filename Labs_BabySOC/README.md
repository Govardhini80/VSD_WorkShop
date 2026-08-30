🧩 BabySoC 

<p align="center">
  <b>VLSI Design & Implementation Lab</b><br>
  

📌 Overview

BabySoC is a compact System-on-Chip design used to understand the transformation of a hardware design from RTL description to a synthesized gate-level implementation.

This lab explores important stages of the digital ASIC design flow, including:

- RTL design understanding
- Pre-synthesis simulation
- Logic synthesis
- Synthesis statistics
- Netlist generation
- Clock-gating logic
- Post-synthesis gate-level simulation
- RTL and gate-level waveform comparison

The main objective is to understand how the design evolves through the synthesis flow while verifying that its intended functionality is preserved.

---

🏭 ASIC Design Flow

A typical ASIC design flow transforms a hardware specification into a physical chip.

Specification
      ↓
Architecture
      ↓
RTL Design
      ↓
Functional Verification
      ↓
Logic Synthesis
      ↓
Gate-Level Netlist
      ↓
Floorplanning
      ↓
Placement
      ↓
Clock Tree Synthesis
      ↓
Routing
      ↓
Physical Verification
      ↓
Tapeout
      ↓
Fabrication

🔬 Scope of This BabySoC Lab

This lab focuses mainly on the RTL-to-Gate-Level portion of the ASIC flow:

RTL Design
     ↓
Pre-Synthesis Simulation
     ↓
Logic Synthesis
     ↓
Synthesis Statistics
     ↓
Technology Mapping
     ↓
Gate-Level Netlist
     ↓
Post-Synthesis / Gate-Level Simulation
     ↓
RTL vs Gate-Level Verification

---

📊 Current Progress

ASIC Design Stage| Status
RTL Design Understanding| ✅ Completed
Pre-Synthesis Simulation| ✅ Completed
Logic Synthesis| ✅ Completed
Synthesis Statistics| ✅ Completed
Technology Mapping| ✅ Completed
Gate-Level Netlist Generation| ✅ Completed
Clock-Gating Analysis| ✅ Completed
Post-Synthesis / Gate-Level Simulation| ✅ Completed
RTL vs Gate-Level Verification| ✅ Completed
Physical Design| ⏳ Future Scope

---

1️⃣ RTL Design

The first stage of the BabySoC implementation is understanding the RTL design and its major functional blocks.

BabySoC integrates multiple functional blocks to form a compact System-on-Chip.

🏗️ BabySoC Architecture

                    ┌───────────────────┐
                    │       PLL         │
                    │ Clock Generation  │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │      RVMyth       │
                    │ Digital Processor │
                    └─────────┬─────────┘
                              │
                         Digital Data
                              │
                              ▼
                    ┌───────────────────┐
                    │       DAC         │
                    │ Digital → Analog  │
                    └─────────┬─────────┘
                              │
                              ▼
                            OUT

The RVMyth block provides the main digital processing functionality, while the PLL and DAC support clock generation and digital-to-analog conversion within the BabySoC.

---

🔍 RVMyth – RISC-V Based Processor

RVMyth is the digital processing core used in the BabySoC design.

It is based on the RISC-V instruction set architecture and forms the main processing element of the SoC. The processor interacts with the surrounding blocks to provide the digital data required by the system.

RVMyth Reference

"RVMyth Block" (images/rvmit.png)

---

2️⃣ Pre-Synthesis Simulation

Before synthesis, the RTL design is simulated to verify its intended functional behavior.

Simulation allows us to observe the response of the design for the given testbench and provides a reference waveform that can later be compared with the gate-level simulation.

📊 Pre-Synthesis Waveform

"Pre-Synthesis Simulation" (images/pre_synth_sim.vcd.png)

🔎 Observation

The waveform shows the behavior of the BabySoC design at the RTL level before synthesis.

This waveform serves as the reference for checking whether the synthesized implementation maintains the expected functionality.

---

3️⃣ Logic Synthesis

After successful RTL simulation, the design is taken through the logic synthesis stage.

Synthesis converts the RTL description into a gate-level representation using cells from the target standard-cell library.

The synthesis process also performs logic optimization and technology mapping to obtain a hardware-oriented implementation of the design.

---

📊 Synthesis Statistics

The synthesis reports provide information about the resulting hardware structure and give an indication of the complexity of the synthesized design.

Statistics – 1

"Synthesis Statistics 1" (images/stats_1.png)

Statistics – 2

"Synthesis Statistics 2" (images/stats_2.png)

---

4️⃣ Synthesized Gate-Level Netlist

After logic synthesis, the RTL design is transformed into a gate-level netlist.

The synthesized netlist represents the structural implementation of the BabySoC using interconnected logic cells from the target technology library.

🧩 BabySoC Synthesized Netlist

"BabySoC Synthesized Netlist" (images/BabySOC_netlist.png)

🔎 Observation

The synthesized netlist provides a structural view of the BabySoC after the synthesis process.

It shows how the original RTL functionality has been mapped into a network of hardware cells and their connections.

---

5️⃣ Clock-Gating Netlist

Clock gating is used in digital designs to control unnecessary clock activity and can help reduce dynamic power consumption.

The synthesized clock-gating netlist provides a view of the clock-control logic present in the BabySoC implementation.

⏱️ Clock-Gating Netlist

"Clock-Gating Netlist" (images/clk_gate_babysoc_netlist.png)

🔎 Observation

The netlist shows the clock-gating structure introduced in the synthesized implementation and provides a structural view of the clock-control logic.

---

6️⃣ Post-Synthesis / Gate-Level Simulation

After synthesis, the generated gate-level implementation is simulated to verify its behavior.

This stage is known as Gate-Level Simulation (GLS).

Unlike pre-synthesis simulation, which works with the RTL description, gate-level simulation uses the synthesized netlist to verify the implemented logic.

📊 Post-Synthesis Simulation

"Post-Synthesis Simulation" (images/post_synth_sim_vsd.png)

🔎 Observation

The post-synthesis waveform shows the behavior of the BabySoC after synthesis.

The waveform can be compared with the pre-synthesis simulation to check whether the expected functional behavior is maintained.

---

7️⃣ RTL vs Post-Synthesis Comparison ⭐

Comparing the pre-synthesis and post-synthesis simulations is an important verification step.

The RTL waveform represents the expected behavior of the original design, while the post-synthesis waveform represents the behavior of the synthesized gate-level implementation.

📈 Waveform Comparison

"RTL vs Post-Synthesis Comparison" (images/pre_synth_vs_post_synth.png)

🔎 Observation

The pre-synthesis and post-synthesis waveforms show consistent functional behavior for the applied testbench.

This indicates that the synthesis process has transformed the RTL into a gate-level implementation while preserving the intended functionality of the design.

---

💻 Important Commands

The following commands are useful during the BabySoC simulation, synthesis and gate-level verification flow.

▶️ Compile RTL

iverilog <rtl_files> <testbench_file>

▶️ Run Simulation

./a.out

📊 Open Waveform

gtkwave <waveform_file>.vcd

▶️  Commands used in Synthesis in yosys

read_verilog
Reads the Verilog RTL source files into Yosys.

dfflibmap
Maps Yosys flip-flop representations to suitable flip-flop cells from the target standard-cell library.

opt
Performs logic optimizations such as constant propagation and removal of redundant logic.

abc
Performs logic optimization and technology mapping using the SKY130 Liberty library.

show
Generates a graphical representation of the selected design or module.

flatten
Removes module hierarchy by incorporating lower-level module logic into the parent module.

setundef -zero
Converts undefined values in the synthesized representation to logic zero.

clean -purge
Removes unused and redundant objects from the design.

rename -enumerate
Renames generated objects systematically.

write_verilog
Writes the resulting synthesized design as a Verilog gate-level netlist.

🧪 Compile Gate-Level Netlist

iverilog  <netlist_file> <testbench_file> <library_file>

▶️ Run Gate-Level Simulation

./a.out

«Note: File names and command options may vary depending on the exact BabySoC setup and directory structure used during the lab.»

---

🛠️ Tools & Technologies

Tool / Technology| Purpose
Verilog HDL| Hardware description
Icarus Verilog| RTL and gate-level simulation
GTKWave| Waveform visualization
Yosys| Logic synthesis
SKY130| Target standard-cell technology

---

🧠 Key Concepts Learned

Concept| Understanding
RTL Design| Describes the intended hardware behavior
ASIC Design Flow| Defines the overall process of converting RTL into a physical chip
Pre-Synthesis Simulation| Verifies the RTL functionality
Logic Synthesis| Converts RTL into a gate-level representation
Technology Mapping| Maps logic to cells from the target library
Netlist| Represents the structural hardware implementation
Clock Gating| Controls unnecessary clock activity
Gate-Level Simulation| Verifies the synthesized implementation
Waveform Comparison| Checks functional consistency before and after synthesis

---

🎯 Learning Outcomes

Through this BabySoC lab, I gained practical understanding of:

- The basic architecture of a System-on-Chip.
- The role of the RVMyth processor within the BabySoC.
- The overall ASIC design flow.
- RTL-level functional simulation.
- Logic synthesis and technology mapping.
- Interpretation of synthesis statistics.
- Understanding synthesized gate-level netlists.
- The purpose of clock-gating logic.
- Gate-Level Simulation (GLS).
- Comparison of RTL and synthesized gate-level waveforms.
- The importance of functional verification after synthesis.

---

📈 Implementation Flow Summary

The complete BabySoC flow explored in this lab can be summarized as:

┌──────────────────────────────┐
│          RTL Design          │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│   Pre-Synthesis Simulation   │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│       Logic Synthesis        │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│    Synthesis Statistics      │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│     Gate-Level Netlist       │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│  Post-Synthesis Simulation   │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│  RTL vs GLS Verification     │
└──────────────────────────────┘

---

🚀 Future Scope

The current lab focuses on the RTL-to-Gate-Level portion of the ASIC design flow.

Further stages that can be explored include:

Gate-Level Netlist
       ↓
Floorplanning
       ↓
Placement
       ↓
Clock Tree Synthesis
       ↓
Routing
       ↓
Physical Verification
       ↓
Tapeout

These stages would extend the BabySoC study from logical implementation toward complete physical ASIC implementation.

---

🏁 Conclusion

The BabySoC lab provided practical exposure to the transformation of an RTL design into a synthesized gate-level implementation.

The successful comparison between pre-synthesis and post-synthesis simulations demonstrates that the synthesized design preserves the intended functional behavior for the applied testbench.

This flow establishes a foundation for understanding larger RTL-to-GDSII ASIC design methodologies.
