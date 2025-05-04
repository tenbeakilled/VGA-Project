# A guide to the project files for the VGA Output System
This project focuses on enabling VGA image output using the AFTx07 development board. The goal is to render graphics in real time using a SystemVerilog-based VGA controller and test it on the DE2-115 FPGA.

Two primary experiments were conducted:
- A "Four Color Monitor" project that displays four colored boxes
- A "Grayscale Image Output" project that loads and renders an image from internal memory

## Background:
The **Video Graphics Array (VGA)** is a widely-used analog video standard originally developed by IBM. It transmits video signals using RGB lines along with synchronization signals: **HSYNC** (horizontal sync) and **VSYNC** (vertical sync).

## Reference:
- https://www.youtube.com/watch?v=Ea_KIhRqLkQ&t=390s - Explanation for basic concept of VGA
- https://github.com/johnwinans/Verilog-Examples/blob/main/vga/sync/vgasync.v - utilized VGA controller from this open source

## Files for this project:
#### VGA-Project/
- DE2-115 Pin Assignments.csv - pin assignment sheet

#### VGA-Project/Four Color Monitor/
- top.sv - top level RTL code for Four Color Monitor Output project
- Expected output of this code: 

<img src="img/four_color.png" alt="Four Color Monitor Output" width="300"/>

#### VGA-Project/Grayscale Image (Internal Memory)/
- top.sv - top level code for Grayscale Image Output project
- Expected output of this code: 

<img src="img/gray_image.png" alt="Grayscale Output" width="300"/>

