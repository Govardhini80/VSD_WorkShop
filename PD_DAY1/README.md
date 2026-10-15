⚙️ Physical Design — Day 1

🚀 VSD Workshop | OpenLANE | Sky130 PDK

Welcome to my Day 1 Physical Design workspace!

This folder contains the work I completed while exploring the initial stages of the ASIC physical design flow. The session focused on getting familiar with the OpenLANE environment, understanding the PICORV32A design setup, and examining the outputs generated during synthesis.

Rather than jumping directly into the layout process, this session helped me understand the tools, files, and basic concepts that form the foundation of physical design.

---

📌 Workshop Overview

Details| Description
📚 Domain| VLSI Design — Physical Design
🎯 Focus| Design setup and synthesis
🧩 Design| PICORV32A
🛠️ Main flow| OpenLANE
🔬 Technology| Sky130 PDK
💻 Environment| Linux / Ubuntu
📂 Repository| VSD_WorkShop — PD_DAY1

---

🎯 Objectives

The main objectives of this session were to:

- Understand the basic stages of the RTL-to-GDSII flow.
- Explore the OpenLANE working environment and directory structure.
- Become familiar with the Sky130 PDK and its role in ASIC implementation.
- Explore the PICORV32A design setup.
- Understand the purpose of LEF files in physical design.
- Examine the synthesized netlist and synthesis statistics.
- Get an idea of how the outputs of one stage are used by the next.

🛠️ Tools & Technologies

Tool / Technology| Where it fits in the flow
OpenLANE| Automates multiple stages of the RTL-to-GDSII flow
Sky130 PDK| Provides process technology and cell-library information
Yosys| Performs RTL synthesis and technology mapping
PICORV32A| Processor design used for exploration
Linux / Ubuntu| Environment for running the tools and managing design files
LEF| Provides physical information about cells and routing layers

---

🔄 1. Getting Familiar with the Physical Design Flow

Physical design takes a synthesized digital circuit and prepares it for implementation as a physical chip. It involves more than just converting RTL into gates; the circuit must also be arranged and connected while considering area, timing, power, and manufacturing requirements.

The overall flow can be represented as:

RTL Design → Synthesis → Floorplanning → Placement → Clock Tree Synthesis → Routing → GDSII

Stage| Purpose
📝 RTL Design| Describes the intended digital hardware
⚡ Synthesis| Converts RTL into a gate-level netlist
📐 Floorplanning| Defines the die/core area and initial layout organization
🧱 Placement| Arranges standard cells within the core
⏱️ Clock Tree Synthesis| Builds the clock distribution network
🔗 Routing| Creates physical connections between cells
💾 GDSII Generation| Produces the layout database for fabrication

Each stage builds on the results of the previous stages. Understanding this sequence makes it easier to follow the complete implementation process.

🧰 2. Exploring OpenLANE and Sky130 PDK

OpenLANE is an open-source ASIC implementation flow that combines different tools to automate several steps of chip design.

The Sky130 PDK contains technology-specific information required by these tools, including standard-cell libraries, technology layers, and physical-design resources.

These two work together: OpenLANE manages the implementation flow, while the PDK provides the information needed to target the selected manufacturing technology.

I explored the design environment and its files to understand where the required inputs are stored and how the outputs from different stages are organized.

Why this matters

- 📁 A clear directory structure makes design files and results easier to locate.
- ⚙️ Configuration settings determine how the flow processes a design.
- 🔬 Technology files help tools map and implement the circuit for the selected process.
- 📊 Generated reports help evaluate the results of each stage.

🧩 3. PICORV32A Design Setup

PICORV32A is a compact RISC-V processor design used in this workshop.

Exploring an existing processor design provides a practical way to understand how digital logic moves through the ASIC implementation flow.

Before physical implementation can begin, the design must be prepared with the appropriate source files, configuration settings, and technology information.

During this part of the session, I explored the design setup and the files associated with the initial stages of the flow.

📐 4. Understanding LEF Files

LEF stands for Library Exchange Format. It contains physical information used by implementation tools to understand standard cells and routing resources.

A LEF file can describe details such as cell dimensions, pin locations, and routing-layer characteristics.

File type| Information it provides
RTL files| Behaviour and structure of the digital design
Gate-level netlist| Logic cells and their connections
LEF files| Physical cell and routing information
Liberty (".lib") files| Cell timing, power, and logical characteristics

A merged LEF combines relevant physical library information into a file suitable for downstream physical-design operations.

Understanding the purpose of this file helped me distinguish between the logical representation of a circuit and the physical information required to implement it.

⚡ 5. RTL Synthesis

Synthesis is the process of converting RTL code into a gate-level representation of the circuit.

In a typical flow, the synthesis tool reads the RTL, processes the logic, performs optimizations, and maps the design to cells available in the target standard-cell library.

The basic sequence is:

1. Read and elaborate the RTL design.
2. Process and optimize the logic.
3. Map the logic to suitable standard cells.
4. Generate the synthesized gate-level netlist.
5. Produce reports summarizing the mapped design.

Yosys is used for synthesis in many open-source hardware design workflows.

The main purpose of examining this stage was to understand how a higher-level hardware description becomes a circuit represented by standard cells.

📄 6. Examining the Synthesized Netlist

The synthesized netlist represents the circuit after synthesis and technology mapping.

Instead of describing the design only through RTL constructs, the netlist identifies the mapped cells and the connections between them.

This representation is important because physical-design tools need the circuit's logical connectivity before they can place cells and create physical routes.

Examining the netlist provides a clearer connection between the original RTL design and the hardware structure produced by synthesis.

What the netlist helps us understand

- 🔹 Which standard cells are used in the mapped design.
- 🔹 How the logic elements are interconnected.
- 🔹 How synthesis transforms the original RTL.
- 🔹 What logical information is passed to later implementation stages.

📊 7. Synthesis Statistics

Synthesis statistics summarize the resources used in the synthesized design. Depending on the report, they can include cell counts, cell types, and the overall composition of the mapped logic.

These statistics are useful for getting an initial idea of the size and structure of the circuit.

Metric| Why it is useful
Total cell count| Gives an overview of the number of mapped cells
Cell types| Shows the kinds of logic elements used
Sequential cells| Helps identify storage elements such as flip-flops
Combinational cells| Gives an idea of the logic used for computation and control
Area estimates| Helps assess the mapped logic area, depending on the report

Synthesis statistics should not be confused with the final physical area. Placement, physical constraints, and other implementation details also influence the final result. Timing closure must likewise be evaluated using the appropriate timing reports.

🧠 8. Key Learnings

Here are the main concepts I took away from this session:

- Physical design flow: Understood the major stages involved in moving from RTL towards a physical layout.
- OpenLANE environment: Became more familiar with the design setup and the organization of flow-related files.
- Sky130 PDK: Learned why technology-specific libraries and files are needed.
- LEF files: Understood their role in describing physical cell and routing information.
- Synthesis: Explored how RTL is transformed into a mapped gate-level representation.
- Netlist analysis: Learned the purpose of the synthesized netlist and its role in later stages.
- Synthesis reports: Understood how cell statistics provide an initial view of the mapped hardware.

The most useful part was seeing how the different files fit together instead of treating synthesis, library information, and physical design as separate topics.

🚀 9. What's Next?

With the initial design setup and synthesis concepts explored, the next step is to move further into the physical implementation process.

Upcoming topic| What I aim to understand
📐 Floorplanning| Core area, die area, and utilization
📍 Pin Placement| Positioning input and output pins
🔌 Power Planning| Supplying power to the cells across the design
🧱 Placement| Arranging standard cells in the core
⏱️ Timing Analysis| Understanding delays and timing constraints
🔗 Routing| Connecting cells through physical metal layers
💾 Final Layout| Understanding the generation and verification of GDSII

These steps will help me build a better understanding of how the logical circuit is transformed into a physical layout.

---

🏁 Conclusion

Day 1 was a useful starting point for understanding the practical side of VLSI physical design. Exploring OpenLANE, the Sky130 PDK, PICORV32A, and the synthesis outputs helped me become more familiar with the tools and files involved in the initial stages of ASIC implementation.

This session established the foundation for exploring floorplanning, placement, routing, and the remaining stages of the RTL-to-GDSII flow in the upcoming work.

---

📚 Learning Log

Workshop: VSD — Physical Design
Day: 01
Focus: Design setup, LEF exploration, synthesis, netlist, and statistics

Learning by doing, one stage of the chip design flow at a time. ⚙️✨
