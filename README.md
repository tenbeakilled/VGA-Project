# A guide to the project files for the VGA Output System

## contributing to this project code was :
- Seongbin Lee

## Project Overview :
This project focuses on enabling VGA video output using the AFTx07 development board. The goal is to render graphics in real time using a SystemVerilog-based VGA controller and test it on the DE2-115 FPGA. The final objective is to support software-driven rendering on AFTx07 through an AHB-Lite-compatible VGA subordinate module. 

Two primary experiments were conducted:
- A "Four Color Monitor" project that displays four colored boxes
- A "Grayscale Image Output" project that loads and renders an image from internal memory

These serve as the foundation for a modular VGA system that future SoCET teams can expand with DMA support, graphical libraries, or framebuffer-driven applications.

## All files for this project can be found in
- https://github.com/tenbeakilled/VGA-Project

#### VGA-Project/
- DE2-115 Pin Assignments.csv - pin assignment sheet

#### VGA-Project/Four Color Monitor/
- top.sv - top level RTL code for Four Color Monitor Output project

#### VGA-Project/Grayscale Image (Internal Memory)/
- top.sv - top level code for Grayscale Image Output project

