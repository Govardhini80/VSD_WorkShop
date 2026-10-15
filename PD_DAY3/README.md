⚡ Day 3 – CMOS Inverter Design & SPICE Characterization

Welcome to Day 3 of my VLSI Physical Design Workshop! This session focused on understanding CMOS inverter operation, exploring transistor-level circuits, and using SPICE simulations to study circuit behaviour.

The hands-on work helped connect transistor theory with practical circuit simulation and the characterization of a standard cell.

📌 Workshop Overview

Detail| Description
📚 Day| Day 3
🔬 Main Focus| CMOS inverter design and characterization
⚙️ Circuit| CMOS inverter using NMOS and PMOS
🧪 Simulation| SPICE / ngspice
📈 Analysis| DC behaviour and transient response
🎯 Goal| Understand how transistor-level circuits behave through simulation

🎯 Objectives

- Understand the operation of a CMOS inverter.
- Study the roles of NMOS and PMOS transistors in switching.
- Explore CMOS transistor structure and fabrication concepts.
- Prepare and understand a SPICE netlist.
- Run circuit simulations using ngspice.
- Analyse the transient response and switching behaviour of the inverter.
- Understand why circuit characterization is important in standard-cell design.

🧠 1. Understanding the CMOS Inverter

A CMOS inverter is a fundamental digital circuit that produces the complement of its input. It uses two MOSFETs: a PMOS transistor in the pull-up network and an NMOS transistor in the pull-down network.

Input (Vin)| PMOS| NMOS| Output (Vout)
LOW (0)| ON| OFF| HIGH (1)
HIGH (1)| OFF| ON| LOW (0)

Key observations

- When the input is LOW, the PMOS pulls the output towards the supply voltage.
- When the input is HIGH, the NMOS pulls the output towards ground.
- The output changes in the opposite direction to the input.
- CMOS logic offers low static power consumption under ideal steady-state conditions.

🔌 2. NMOS and PMOS in an Inverter

The two transistors perform complementary functions.

Feature| NMOS| PMOS
Main role| Pull-down network| Pull-up network
Conducts when| Gate voltage is sufficiently high| Gate voltage is sufficiently low relative to its source
Output action| Pulls output towards ground| Pulls output towards VDD
Symbolic state| ON for logic HIGH input| ON for logic LOW input

Using both devices allows the inverter to produce reliable logic levels while reducing static current in normal steady-state operation.

🏭 3. CMOS Fabrication Concepts

CMOS fabrication involves multiple process steps to form transistors and the interconnections required for an integrated circuit. The process images explored during the session help illustrate how device structures are formed.

Typical fabrication concepts include:

1. Preparing the silicon substrate.
2. Forming wells and defining active regions.
3. Creating gate structures.
4. Forming source and drain regions.
5. Adding insulating layers and contacts.
6. Creating metal interconnections between devices.

The exact sequence and number of masks depend on the fabrication process and technology being used.

🧾 4. SPICE Netlist and Simulation Setup

A SPICE netlist describes an electronic circuit using text-based statements. It specifies the components, their connections, model parameters, input sources, and the analyses to be performed.

For the CMOS inverter, the netlist represents the PMOS and NMOS devices, their supply connections, the input signal, and the output node.

Netlist element| Purpose
MOSFET models| Describe transistor electrical behaviour
Voltage sources| Provide supply and input signals
Node connections| Define how components are connected
Analysis commands| Specify DC or transient simulation
Output expressions| Help inspect voltages and currents

🛠️ Simulation workflow

1. Prepare the SPICE deck.
2. Check transistor models and circuit connections.
3. Load the netlist in ngspice.
4. Execute the required simulation.
5. Inspect the generated waveforms.
6. Evaluate the inverter's switching response.

📈 5. Transient Analysis

Transient analysis studies how circuit voltages and currents change over time. For a CMOS inverter, it helps show how the output responds when the input switches between LOW and HIGH.

Important observations include:

- Input waveform: The signal applied to the inverter.
- Output waveform: The inverted response produced by the circuit.
- Rise time: The time taken for the output to move from a lower voltage level to a higher voltage level.
- Fall time: The time taken for the output to move from a higher voltage level to a lower voltage level.
- Propagation delay: The time difference between an input transition and the corresponding output transition.

These parameters are useful for evaluating the speed and switching behaviour of a standard cell.

⏱️ 6. Why Cell Characterization Matters

Cell characterization determines how a standard cell behaves under specified electrical conditions. The resulting information can be used by digital implementation and timing-analysis tools.

Parameter| What it tells us
Switching threshold| Input voltage at which the inverter changes its output state
Rise time| Speed of the output's LOW-to-HIGH transition
Fall time| Speed of the output's HIGH-to-LOW transition
Propagation delay| Response time between input and output transitions
Power behaviour| Energy and power consumed during circuit operation

Characterization results depend on factors such as transistor models, supply voltage, input transition time, output load, and process conditions.

📂 7. Practical Work Covered

The "images" folder contains visual references related to the circuit design and simulation work.

Area| Work covered
🔬 CMOS structure| Exploring CMOS process stages
🔌 Transistor operation| Understanding NMOS and PMOS connections in an inverter
🧾 SPICE netlisting| Working with SPICE decks and netlist files
⚙️ Simulation| Running the circuit using ngspice
📉 Waveform analysis| Observing the transient response
🧩 Cell design flow| Understanding the steps involved in cell design and characterization

💡 Key Learnings

- Understood how a CMOS inverter performs logical inversion.
- Learned the complementary roles of NMOS and PMOS transistors.
- Explored the relationship between transistor-level design and digital logic.
- Gained familiarity with SPICE netlists and ngspice simulation.
- Learned how transient waveforms help evaluate switching behaviour.
- Understood the importance of timing parameters in standard-cell characterization.

🚀 Conclusion

Day 3 connected the fundamentals of CMOS transistor operation with practical circuit simulation. By exploring inverter structure, SPICE netlists, and transient waveforms, I gained a better understanding of how a basic CMOS cell behaves and how its electrical characteristics can be evaluated.

These concepts provide a foundation for studying standard-cell layout, post-layout simulation, and the larger RTL-to-GDSII physical design flow.

---

🙌 Acknowledgement

Thanks to VLSI System Design (VSD) and the workshop instructors for the learning resources and hands-on exposure to CMOS design and circuit characterization.
