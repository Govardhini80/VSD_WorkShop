
⚙️ Physical Design — Day 1

OpenLANE | Sky130 PDK | PICORV32A

Welcome to my Day 1 Physical Design workspace! This repository documents my hands-on learning and the screenshots collected while exploring the open-source ASIC design flow using OpenLANE and the Sky130 PDK.

The focus of this session was understanding the design environment, exploring the PICORV32A processor design, and examining the synthesis outputs.

---

🎯 Learning Objectives

- Understand the basics of physical design in VLSI.
- Explore the OpenLANE design environment and its directory structure.
- Get familiar with the Sky130 process design kit.
- Understand the PICORV32A design setup.
- Observe the synthesis process and generated netlist.
- Examine the synthesis statistics and supporting design files.

---

🛠️ Tools and Technologies

Tool / Technology| Purpose
OpenLANE| Automated RTL-to-GDSII design flow
Sky130 PDK| Open-source 130 nm process design kit
PICORV32A| RISC-V processor design used for the workshop
Yosys| RTL synthesis
Linux / Ubuntu| Development environment

---

📁 1. Exploring the OpenLANE Design Environment

The first step was getting familiar with the OpenLANE environment and locating the files required to work with a design.

The design directory contains configuration files and supporting resources used to prepare and process the selected design.

Screenshot 

"OpenLANE design environment" (Images/openlane_design.png)

"OpenLANE design directory" (Images/openlane_design1.png)

---

🔄 2. Understanding the OpenLANE Flow

OpenLANE automates several stages involved in converting a digital design into a physical chip layout.

The overall flow includes:

1. Design preparation
2. RTL synthesis
3. Floorplanning
4. Placement
5. Clock tree synthesis
6. Routing
7. Final layout generation and verification

This session focused on understanding the environment and the initial stages of the flow.

Screenshot

"OpenLANE flow" (Images/openlane_folw.png)

---

🧩 3. Preparing the Design and LEF Files

The PICORV32A design requires technology and standard-cell information for physical implementation.

LEF files describe physical information about cells and routing layers. The merged LEF brings together the relevant layout information needed by subsequent physical-design stages.

Screenshot

"Merged LEF file" (Images/merged_lef.png)

---

⚡ 4. Synthesis of PICORV32A

Synthesis converts the RTL representation of a digital design into a gate-level netlist using the target standard-cell library.

During this stage, the design is processed to produce a netlist that represents its logic using standard cells.

Screenshot

"PICORV32A synthesis" (Images/synthesis_picorv32a.png)

---

📋 5. Synthesized Netlist

The synthesized netlist describes the hardware structure produced after synthesis. It contains the mapped logic elements and their connections.

Examining the netlist helps in understanding how the RTL design is represented at the gate level.

Screenshot

"PICORV32A synthesized netlist" (Images/picorv32a_synthesised_netlist.png)

---

📊 6. Synthesis Statistics

Synthesis statistics provide information about the hardware resources used by the design, including the types and numbers of cells in the generated netlist.

These reports help in understanding the resulting circuit and evaluating its implementation.

Screenshot

"PICORV32A synthesis statistics" (Images/picorv32a_stat.png)

---

💡 Key Takeaways

Through this session, I explored the OpenLANE environment, became familiar with the PICORV32A design structure, and examined the outputs generated during synthesis.

This provided a foundation for understanding how a digital design progresses from RTL synthesis towards physical implementation.

---

📌 What's Next?

The next stage is to explore floorplanning and placement, understand core and die dimensions, examine pin placement, and observe how standard cells are arranged during physical design.

---

Learning step by step towards understanding the complete RTL-to-GDSII flow. 🚀
