# 📐 Physical Design & RTL-to-GDSII Flow

## 📖 Overview
This directory documents the complete physical design implementation stages for the **Vacancy-Delay Ventilation Controller**, generated using the automated OpenLane ASIC flow and visualized using Magic and layout viewers with the **Sky130A PDK** (`sky130_fd_sc_hd` library).

---

## 🏗️ Physical Design & Layout Stages

### 1. Design Preparation (`design_prep_in_openlane.png`)
Initializing tech-lefs, standard cell libraries, and design parameters inside OpenLane:
![Design Preparation](design_prep_in_openlane.png)

---

### 2. Floorplanning & Floorplan DEF View (`floorplan.png` & `ventilation_controller.floorplan.def.png`)
Defining core utilization, die boundaries, power distribution networks, and initial floorplan structures:
![Floorplan Layout](floorplan.png)

![Floorplan DEF View](ventilation_controller.floorplan.def.png)

---

### 3. Placement & Placement DEF View (`placement_zoomed_in.png` & `ventilation_controller.placement.def.png`)
Legalizing and placing standard cells to optimize wirelength and avoid congestion:
![Placement Zoomed In](placement_zoomed_in.png)

![Placement DEF View](ventilation_controller.placement.def.png)

---

### 4. Clock Tree Synthesis (CTS) (`ventilation_controller.cts.def.png`)
Balancing clock skew and buffering the clock distribution network:
![CTS DEF View](ventilation_controller.cts.def.png)

---

### 5. Routing & Detailed DEF Views (`routing_zoomedin.png` & `ventilation_controller.def.png`)
Interconnecting standard cells across metal layers (Met1 through Met4) without DRC violations:
![Routing Zoomed In](routing_zoomedin.png)

![Routing DEF View](ventilation_controller.def.png)

---

### 6. Standard Cell Architecture (`cell_in_design.png`)
Granular layout view of individual standard cells instantiated within the core grid:
![Cell in Design](cell_in_design.png)

---

### 7. Final Routed Layout & GDSII Stream (`Routing_or_final_layout_stage.png` & `ventilation_controller.gds.png`)
The final layout stream ready for tapeout and fabrication verification:
![Final Routed Layout](Routing_or_final_layout_stage.png)

![GDSII View](ventilation_controller.gds.png)
