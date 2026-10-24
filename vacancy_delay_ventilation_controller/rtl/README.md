# 🏛️ RTL Design & Architecture: Vacancy-Delay Ventilation Controller

## 📖 Overview
This directory contains the synthesizable RTL (Register Transfer Level) design and self-checking testbench for the **Vacancy-Delay Ventilation Controller with Occupancy Re-Entry Override**. 

The primary objective of this digital controller is to optimize energy efficiency in automated building environments by eliminating unnecessary fan runtime while ensuring comfort and safety through intelligent re-entry detection.

---

## ⚙️ Design Specifications & Port Mapping

The hardware architecture is designed using clean, synchronous Verilog HDL, optimized for standard-cell mapping during synthesis.

### 📥 Inputs
* **`clk`** *(1-bit)*: Primary system clock driving the sequential logic and counter.
* **`rst`** *(1-bit)*: Active-high synchronous/asynchronous reset to initialize states.
* **`occupied`** *(1-bit)*: Real-time sensor input indicating room occupancy status (`1` = Occupied, `0` = Vacant).

### 📤 Outputs
* **`fan_enable`** *(1-bit)*: Control signal driving the ventilation fan system (`1` = Fan ON, `0` = Fan OFF).

---

## 🔄 Finite-State Machine (FSM) & Control Logic

The controller is architected using a robust **Finite-State Machine (FSM)** coupled with an internal down-counter:
1. **IDLE / ACTIVE State:** When occupancy is detected (`occupied = 1`), the system immediately enables the fan (`fan_enable = 1`).
2. **Vacancy Delay Window:** When the room transitions to vacant (`occupied = 0`), the fan does not shut down immediately. Instead, a configurable grace-period timer starts counting down.
3. **Re-Entry Override:** If occupants return before the timer expires (`occupied = 1` during countdown), the shutdown sequence is instantly aborted, and the controller returns to active mode without interruption.
4. **Safe Shutdown:** If the countdown expires with zero occupancy, `fan_enable` transitions to `0`, safely powering down the ventilation system.

---

## 📂 Included Source Files

* **`ventilation_controller.v`**: The core synthesizable Verilog module implementing the FSM and grace-period counter logic.
* **`ventilation_controller_tb.v`**: A comprehensive self-checking testbench designed to simulate corner cases, reset handling, continuous occupancy, delay countdowns, and re-entry overrides.
*
