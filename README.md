# Sequence Detector (111) using Verilog

## Project Overview
This repository contains the RTL (Register Transfer Level) design and testbench for a Sequence Detector written in Verilog. The detector is designed using a **Moore Finite State Machine (FSM)** to identify a consecutive sequence of `111` (three overlapping ones) from a serial input stream.

## Design Details
* **FSM Architecture:** Moore Machine (Output depends strictly on the current state)
* **Target Sequence:** `111` (Overlapping)
* **Reset Type:** Active-Low Reset (`rst = 0` resets the state)
* **States Overview (4 States):** 
  * `s0` (2'b00) : Reset / Initial State
  * `s1` (2'b01) : First '1' detected
  * `s2` (2'b10) : Second '1' detected
  * `s3` (2'b11) : Third '1' detected (Sequence Found, Output goes HIGH)

## Ports Description
* `clk`: Clock signal
* `rst`: Active-low reset signal
* `in_sequence`: Serial data input
* `sequence_detected`: Output signal (High when '111' is detected)

## Tools & Environment
* **Language:** Verilog 
* **Simulation & Coding:** EDA Playground / Icarus Verilog
* **Waveform Viewer:** EPWave / GTKWave

## File Structure
* `sequence_detector.v`: Contains the RTL code for the FSM logic and state transitions.
* `sequence_detector_tb.v`: Contains the test stimulus to verify the design functionality, including hierarchical referencing to monitor internal FSM states.

## Simulation Waveform
```
<img width="1547" height="196" alt="image" src="https://github.com/user-attachments/assets/752d9464-4bde-43e7-b9e2-0add80b860f5" />

<img width="1116" height="555" alt="image" src="https://github.com/user-attachments/assets/887e444e-9da7-41c7-b83c-06d0e0139f87" />


