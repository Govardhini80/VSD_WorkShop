
🏗️ Physical Design — Day 2

Chip Floorplanning, Standard Cells & Power Integrity ⚡

Welcome to Day 2 of my VLSI Physical Design learning journey!

This session focused on understanding how a synthesized design begins to take physical shape. I explored the concepts involved in defining the chip floorplan, calculating core and die dimensions, positioning cells, and understanding the power-related effects that can influence circuit reliability.

Along with the concepts, I worked through the OpenLANE design flow and examined different files and outputs related to floorplanning, placement, timing, and power integrity.

---

📌 Workshop Overview

Detail| Description
📚 Domain| VLSI Physical Design
🗓️ Session| Day 2
🏗️ Main Focus| Chip Floorplanning and Power Integrity
⚙️ Design Flow| OpenLANE
🔬 Technology| Sky130 PDK
💻 Environment| Linux / Ubuntu
📂 Work Directory| "PD_DAY2"

🎯 Objectives

The main objectives of this session were to:

- Understand the purpose of chip floorplanning in ASIC design.
- Learn how core and die dimensions are determined.
- Understand standard-cell area, utilization factor, and aspect ratio.
- Explore pre-placed cells and their importance in floorplanning.
- Understand the role of pin placement and cell placement.
- Learn about switching current, voltage drop, ground bounce, and noise margins.
- Understand why decoupling capacitors are used in power distribution.
- Explore timing-related information and physical library data.
- Become more familiar with the files and configuration settings used in the OpenLANE flow.

🛠️ Tools & Technologies

Tool / Technology| Purpose
OpenLANE| Automates stages of the ASIC implementation flow
Sky130 PDK| Provides process technology and standard-cell information
OpenROAD| Supports physical implementation tasks
LEF files| Describe physical cell and routing information
Liberty (".lib") files| Contain cell characteristics such as timing, power, and area
Tcl| Used for flow configuration and automation
Linux / Ubuntu| Environment for running tools and managing files

---

🔄 1. Understanding the Physical Design Flow

Physical design converts the logical representation of a circuit into a physical layout that can eventually be manufactured.

After synthesis, the design is represented by a gate-level netlist. Physical design tools use this logical information along with technology and physical-library data to arrange cells, establish power connections, and create the required interconnects.

The overall process can be summarized as:

RTL → Synthesis → Floorplanning → Placement → Clock Tree Synthesis → Routing → Verification → GDSII

Each stage has its own requirements, and decisions made early in the flow can affect area, timing, power, and routing congestion later.

📐 2. Chip Floorplanning

Floorplanning is one of the first major steps in physical implementation. It establishes the physical organization of the chip and defines the area available for the design.

The floorplan provides the foundation for placing standard cells, arranging larger blocks, positioning I/O pins, and planning the power distribution network.

A good floorplan should provide enough space for the design while allowing efficient placement and routing.

Important floorplanning concepts

Concept| Explanation
Die area| The total area enclosed by the chip boundary
Core area| The region allocated for the main circuit implementation
Standard-cell area| The combined physical area occupied by standard cells
Utilization factor| The proportion of core area occupied by cells
Aspect ratio| The ratio of core height to core width
Placement rows| Rows and sites used to organize standard-cell placement

The die generally includes the core along with the surrounding regions needed for I/O, power connections, and other physical requirements.

📏 3. Defining Core and Die Dimensions

The dimensions of the core and die are important because they determine how much physical space is available for implementing the circuit.

The dimensions depend on factors such as the total cell area, target utilization, aspect ratio, and additional physical-design requirements.

Utilization factor

The utilization factor indicates how much of the core area is occupied by the standard cells.

[
\text{Utilization} =
\frac{\text{Total Standard-Cell Area}}
{\text{Core Area}}\times100%
]

For example, a target utilization of 50% means that the standard cells occupy approximately half of the core area, leaving the remaining area available for routing and other implementation requirements.

Aspect ratio

[
\text{Aspect Ratio}=\frac{\text{Core Height}}{\text{Core Width}}
]

An aspect ratio of 1 corresponds to a square core. Other values produce rectangular core shapes.

Parameter| Why it matters
Core width| Determines the horizontal space available
Core height| Determines the vertical space available
Utilization| Influences available placement and routing space
Aspect ratio| Determines the shape of the core
Die dimensions| Define the overall chip boundary

These parameters must be chosen carefully because insufficient space can make placement and routing more difficult, while excessive area can increase the overall chip footprint.

🧩 4. Pre-placed Cells and Floorplan Organization

Pre-placed cells or blocks are assigned specific physical locations before the regular automated placement process.

They may include larger functional blocks or instances that need to remain at predetermined locations. Their positions influence the arrangement of the surrounding cells and the routing resources available to the design.

Proper floorplan organization helps maintain connectivity and reduces unnecessary routing detours.

Why pre-placement matters

- 📍 Establishes the locations of important blocks.
- 🔗 Helps organize connections between different regions.
- 🛣️ Influences the routing paths available to the remaining cells.
- 📐 Affects the space available for standard-cell placement.
- ⏱️ Can influence interconnect delay and timing.

Pre-placed blocks must therefore be considered early rather than treated as an afterthought during physical implementation.

📌 5. Pin Placement

Pin placement determines where the design's input and output connections are located around the chip or core boundary.

The location of pins affects how signals enter and leave the design and can influence routing distance, congestion, and timing.

A well-organized pin arrangement helps the implementation tools connect external signals to the internal logic efficiently.

Important considerations include:

- The location of input and output pins.
- Signal connectivity and routing accessibility.
- The relationship between pin locations and internal cells.
- The availability of routing resources near the chip boundary.

Pin placement is therefore an important part of preparing a usable physical floorplan.

🧱 6. Standard-Cell Placement

After the floorplan is defined, standard cells are assigned physical locations within the available core area.

These cells implement the logic described by the synthesized netlist, including combinational gates, flip-flops, buffers, and other library cells.

Placement tools attempt to arrange the cells while considering connectivity, timing requirements, congestion, and physical constraints.

Placement consideration| Impact
Cell location| Determines the physical arrangement of logic
Wire length| Influences interconnect delay and routing resources
Congestion| Affects how easily connections can be routed
Timing| Depends on cell delays and interconnect delays
Core utilization| Determines how much space remains for routing

Placement is not simply about fitting cells inside the core. Their relative positions also affect the quality of the final implementation.

🔋 7. Power Integrity and Switching Current

Power integrity refers to maintaining a sufficiently stable supply voltage throughout the circuit during operation.

Digital circuits continuously switch between logic states. When many cells switch together, they can demand a large amount of current over a short period.

The power distribution network has resistance and inductance, so changes in current can cause the voltage delivered to cells to deviate from the ideal supply voltage.

These variations can affect circuit performance and, in severe cases, cause functional errors.

Understanding power integrity is important because a design must operate reliably, not merely fit within the chip area.

⚡ 8. Voltage Drop and IR Drop

IR drop is the voltage drop caused by resistance in the power distribution network when current flows through it.

It follows Ohm's law:

[
V=I\times R
]

Where:

- (V) is the voltage drop.
- (I) is the current flowing through the resistance.
- (R) is the resistance of the path.

As current increases or the resistance of the power path increases, the voltage drop also increases.

If the voltage available at a cell falls too far below its required operating level, its timing and reliability can be affected.

Factors influencing IR drop

- The resistance of power wires and connections.
- The amount of current drawn by the circuit.
- The distance between cells and power sources.
- The structure and quality of the power distribution network.

Power planning and suitable power connections are essential for controlling these effects.

🌊 9. Ground Bounce and Switching Noise

Ground bounce is a change in the local ground voltage caused by transient current flowing through the inductance and resistance of the ground network.

When several cells switch simultaneously, the resulting current changes can cause temporary voltage fluctuations.

These fluctuations can disturb the voltage levels seen by other cells and affect the reliability of digital signals.

A simplified relationship for inductive voltage variation is:

[
V_L=L\frac{di}{dt}
]

Where:

- (L) is the inductance of the path.
- (di/dt) represents the rate of change of current.

A faster current change can produce a larger inductive voltage disturbance for the same inductance.

Ground bounce and supply noise are important considerations when designing the power distribution network, particularly in circuits with high switching activity.

📊 10. Noise Margin

Noise margin describes how much unwanted voltage disturbance a digital circuit can tolerate before a logic value may be interpreted incorrectly.

It is based on the voltage levels used to represent logic HIGH and logic LOW.

Two important parameters are:

Noise margin HIGH

[
NM_H=V_{OH(\min)}-V_{IH(\min)}
]

Noise margin LOW

[
NM_L=V_{IL(\max)}-V_{OL(\max)}
]

Where:

Symbol| Meaning
(V_{OH(\min)})| Minimum guaranteed output HIGH voltage
(V_{IH(\min)})| Minimum input voltage recognized as HIGH
(V_{IL(\max)})| Maximum input voltage recognized as LOW
(V_{OL(\max)})| Maximum guaranteed output LOW voltage

A larger positive noise margin generally provides greater tolerance to voltage disturbances.

If noise exceeds the available margin, a receiving cell may interpret a signal incorrectly. This is why noise margin is an important concept in reliable digital circuit design.

🔌 11. Decoupling Capacitors

Decoupling capacitors help reduce supply-voltage fluctuations caused by sudden changes in current demand.

They are connected between the supply and ground networks and provide a local source of charge when nearby cells require current quickly.

The capacitor can supply charge during a transient event, while the power distribution network replenishes it afterward.

The basic idea is:

Sudden switching → Increased current demand → Local charge supplied by capacitor → Power network replenishes charge

Decoupling capacitors help improve power integrity, although their effectiveness depends on factors such as capacitance, placement, and the resistance and inductance of the surrounding network.

Why placement matters

- Capacitors should be located close enough to the circuits they support.
- The connection path should have suitable resistance and inductance.
- Available placement area must be considered.
- The power distribution network must support the required current.

Decoupling is one part of power-integrity design; it does not replace proper power-grid planning.

⏱️ 12. Timing Characterization

Timing information is essential for predicting how quickly a circuit can operate.

Standard-cell libraries contain timing characteristics that describe the behaviour of cells under specified conditions. These characteristics can include propagation delay, transition time, and input capacitance.

Cell timing depends on factors such as the input transition, output load, process corner, supply voltage, and temperature.

Timing parameter| Meaning
Cell delay| Time taken for a cell's output to respond to an input transition
Input transition| The rise or fall time of the signal entering a cell
Output load| The electrical load driven by the cell
Setup time| Time data must be stable before a capturing clock edge
Hold time| Time data must remain stable after a capturing clock edge
Clock period| Time available for a synchronous operation

Timing characterization helps the implementation tools estimate cell delays and evaluate whether a design can meet its timing requirements.

📚 13. Configuration Files and Design Flow

Configuration files and scripts control how the implementation flow processes a design.

They can specify design-related settings, timing constraints, floorplanning parameters, and other options required by the tools.

Tcl scripts are commonly used to automate tool commands and organize implementation steps.

Understanding these files is useful because the resulting layout depends not only on the RTL and technology library but also on the configuration supplied to the flow.

The screenshots collected during this session document different parts of the design setup and physical-design process.

🧠 Key Learnings

Topic| What I learned
Chip floorplanning| How the physical organization of a design is established
Core and die dimensions| Why the available physical area matters
Utilization factor| How cell area relates to core area
Aspect ratio| How core dimensions determine its shape
Pre-placed cells| Why certain blocks need predetermined locations
Pin placement| How boundary connections affect physical implementation
Standard-cell placement| How logical cells are arranged in the core
IR drop| How resistance causes supply-voltage loss
Ground bounce| How transient current can disturb the ground voltage
Noise margin| How digital circuits tolerate voltage disturbances
Decoupling capacitors| How local charge helps reduce supply fluctuations
Timing characterization| How library data supports delay analysis

🚀 What's Next?

The next step is to continue exploring how the floorplanned design progresses through the remaining physical implementation stages.

Areas for further study include:

- Power distribution network generation and analysis.
- Detailed standard-cell placement.
- Clock tree synthesis.
- Global and detailed routing.
- Static timing analysis.
- Physical verification and design-rule checks.
- Final layout generation.

These stages build on the floorplan and help turn the logical design into a physically connected implementation.

---

🏁 Conclusion

Day 2 helped me connect the concepts of floorplanning, cell placement, timing, and power integrity with the practical files used in the physical design flow.

One important takeaway is that a good physical implementation requires more than choosing the core dimensions and placing cells. The design must also provide suitable routing space, reliable power delivery, and acceptable timing behaviour.

Understanding these fundamentals provides a stronger foundation for exploring the later stages of ASIC implementation.

---

📂 Session Details

- Workshop: VSD Physical Design
- Day: 02
- Primary topics: Floorplanning, placement, timing and power integrity
- Technology: Sky130 PDK
- Tools: OpenLANE and related physical-design tools

Every stage adds another piece to understanding how a digital design becomes a physical chip. ⚙️✨
