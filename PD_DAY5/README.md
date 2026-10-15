
🛣️ Day 5 – Routing, DRC & Physical Verification

Welcome to Day 5 of my VLSI Physical Design Workshop! This session focused on the final stages of physical implementation, with an emphasis on routing, Design Rule Checking (DRC), and verifying the physical layout.

The hands-on work explored how connections are created between cells, how routing algorithms find paths through the layout, and why design-rule violations must be checked before a layout can be considered ready for fabrication.

📌 Workshop Overview

Detail| Description
📚 Day| Day 5
🔍 Main Focus| Routing and physical verification
🛣️ Routing Method| Maze routing
✅ Verification| Design Rule Checking (DRC)
🧩 Physical Design| Macro-cell RAM and layout routing
🎯 Goal| Understand routing and verify layout compliance with design rules

🎯 Learning Objectives

- Understand the purpose of routing in physical design.
- Explore the basic idea behind maze-routing algorithms.
- Learn how routing connects standard cells and macros.
- Understand Design Rule Checking and common layout violations.
- Explore the role of macro cells in a physical layout.
- Interpret DRC reports and understand the importance of a clean result.
- Understand how routing and physical verification contribute to the RTL-to-GDSII flow.

🔄 1. Routing in Physical Design

After cells have been placed, routing creates the metal connections required to implement the circuit's logical connectivity.

The routing tool determines suitable paths between cell pins while considering routing resources, blockages, wire spacing, and other technology constraints.

Main routing stages

Stage| Purpose
📍 Global routing| Plans approximate routes and assigns routing resources
🛣️ Detailed routing| Creates the actual wire and via geometry
🔎 Routing checks| Identifies routing-related design-rule violations
📊 Parasitic extraction| Estimates interconnect resistance and capacitance for further analysis

A good routing solution must provide connectivity while respecting physical constraints and supporting timing requirements.

🧭 2. Maze Routing

Maze routing is a path-finding approach used to find a route between two points while avoiding obstacles. The routing space can be represented as a grid, with available locations explored until a suitable path is found.

Basic working principle

1. Identify the source and destination pins.
2. Explore possible routing locations around obstacles.
3. Find a path that reaches the destination.
4. Select a suitable route based on path length, congestion, and routing constraints.
5. Create the required wire segments and vias across permitted metal layers.

Why routing decisions matter

- Shorter routes can reduce interconnect delay.
- Fewer unnecessary bends can simplify routing.
- Avoiding congested areas improves routing feasibility.
- Correct layer selection helps prevent shorts and design-rule violations.

The shortest geometric path is not always the final choice because a practical router must also satisfy electrical and technology constraints.

🧩 3. Macro Cells and RAM

A macro is a predefined physical block used to implement a particular function. Memory blocks such as RAM are common examples of macros in digital integrated circuits.

Unlike ordinary standard cells, macros usually have fixed dimensions and predefined physical layouts.

Feature| Standard cells| Macros
Typical function| Logic gates and small sequential elements| RAM, ROM, and other larger functional blocks
Size| Generally small| Generally larger
Placement| Arranged by the placement tool| Placed with macro-specific constraints
Routing| Connected through standard-cell pins| Requires routing to macro pins and around blockages

Macro placement affects routing because surrounding logic must connect to the macro pins without violating layout constraints.

📐 4. Design Rule Checking (DRC)

Design Rule Checking verifies whether the physical layout follows the geometric and manufacturing rules defined for the target process.

These rules help ensure that wires, vias, and device shapes can be fabricated reliably.

Common DRC checks

Rule| What it checks
Minimum width| Whether a wire or shape is wide enough
Minimum spacing| Whether neighbouring shapes are sufficiently separated
Via rules| Whether vias satisfy size and spacing requirements
Overlap and shorting| Whether shapes create unintended connections
Enclosure| Whether a required shape adequately surrounds another shape
Minimum area| Whether a layout shape meets the required area

A DRC violation does not automatically mean the circuit's logic is incorrect. It means the layout has failed one or more physical design rules.

🔎 5. Understanding DRC Results

DRC reports identify physical layout issues that need investigation. Each reported violation should be examined to determine its location, the applicable rule, and the appropriate correction.

Typical verification workflow

1. Run the DRC check.
2. Review the reported violations.
3. Locate the affected shapes or routing segments.
4. Correct the geometry or routing where necessary.
5. Run DRC again.
6. Confirm that the required checks pass.

A clean DRC result indicates that no violations were reported by the particular check and rule deck used. It does not, by itself, prove that every other sign-off requirement has passed.

✅ 6. Clean DRC Results

The "images" folder contains files named "DRC_clean_results.png" and "final_DRC_result.png", documenting the DRC verification work.

The purpose of DRC cleanup is to resolve reported geometric violations so that the layout complies with the selected process rules.

Check| Objective
Initial DRC| Identify physical design-rule violations
Violation analysis| Understand the source of each reported issue
Layout correction| Resolve the affected geometry
Final DRC| Verify the updated layout
Result review| Confirm the reported outcome

Important: A clean DRC report is one important part of physical verification. Depending on the project, additional checks such as LVS, antenna verification, and timing analysis may also be required.

🧱 7. Physical Verification and the RTL-to-GDSII Flow

Routing and verification are important stages in converting a logical design into a physical layout.

Stage| Main purpose
RTL design| Describes the intended digital functionality
Synthesis| Converts RTL into a gate-level netlist
Floorplanning| Defines the die, core, and major physical regions
Placement| Assigns physical locations to cells
Clock Tree Synthesis| Builds the clock distribution network
Routing| Connects the design using metal layers and vias
Physical verification| Checks layout rules and connectivity
Final layout generation| Produces the layout database for downstream use

A successful flow must preserve logical connectivity while satisfying physical, electrical, and timing constraints.

🧪 8. Practical Work Covered

The "images" folder contains visual references related to the Day 5 work.

Area| Work covered
🛣️ Maze routing| Exploring routing paths through the layout
🧩 Macro-cell RAM| Reviewing a macro-cell layout
🔍 DRC checking| Examining design-rule verification results
✅ DRC cleanup| Reviewing clean and final DRC results

💡 Key Learnings

- Understood why routing is required after placement.
- Learned the basic principles of maze routing.
- Explored how routing paths avoid obstacles and use available metal layers.
- Understood the role of RAM macros in physical design.
- Learned about common physical design-rule violations.
- Recognized the importance of reviewing DRC reports and correcting violations.
- Understood that clean DRC results are an important step towards physical sign-off.

🚀 Conclusion

Day 5 brought together the physical implementation concepts covered throughout the workshop. Routing connects the placed cells into a complete physical design, while Design Rule Checking helps verify that the layout follows the selected manufacturing rules.

This session strengthened my understanding of routing, macro integration, and physical verification as essential parts of the RTL-to-GDSII journey.

---

🙌 Acknowledgement

Thanks to VLSI System Design (VSD) and the workshop instructors for the learning resources and hands-on exposure to open-source VLSI physical design.
