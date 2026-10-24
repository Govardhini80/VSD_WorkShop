# 🌬️ Vacancy-Delay Ventilation Controller with Occupancy Re-Entry Override

A complete RTL-to-GDSII physical design flow and Multi-Corner PVT Static Timing Analysis (STA) signoff implementation using the **Sky130A PDK** (`sky130_fd_sc_hd` library).

---

## 📌 Project Overview & Specification

* **Project Title:** Vacancy-Delay Ventilation Controller with Occupancy Re-Entry Override
* **Problem Statement:** Ventilation fans may waste electricity by continuing to operate continuously when rooms are unoccupied.
* **Proposed Solution:** A digital controller that keeps the fan enabled for a configurable grace period after occupancy ends and cancels the shutdown sequence immediately if occupancy returns.
* **Main Functionality:** Automatic fan enable, vacancy-delay timing, occupancy re-entry detection, and automated safe shutdown.
* **Inputs:** Clock (`clk`), Reset (`rst`), Occupancy Signal (`occupied`)
* **Outputs:** Fan Enable (`fan_enable`)
* **Sequential Architecture:** Implemented using **One Finite-State Machine (FSM)** and **One Counter**.

---

## 📂 Repository Directory Structure

Explore each phase of the RTL-to-GDSII and signoff flow below:

* [`rtl/`](rtl/) - Synthesizable Verilog source code and self-checking testbench.
* [`simulation/`](simulation/) - Functional simulation waveforms and verification results.
* [`synthesis/`](synthesis/) - Gate-level netlists and SDC timing constraints.
* [`gls/`](gls/) - Gate-Level Simulation reports and waveforms.
* [`physical_design/`](physical_design/) - OpenLane floorplanning, placement, and routing layouts.
* [`sta/`](sta/) - Automated multi-corner PVT signoff scripts and 16-corner results (`summary.csv`).
*
