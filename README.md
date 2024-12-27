# ucla-cs-m152a
UCLA CS M152A Course \
Introductory Digital Design Laboratory \
Hands-on design, implementation, and debugging of digital logic circuits, use of computer-aided design tools for schematic capture and simulation, implementation of complex circuits using programmed array logic, design projects.

## Lab 1
In this lab, we worked with instruction encoding for a miniature assembly language, translated instructions into binary, operated an FPGA to run these instructions and saw the output on a PuTTY window, observed and analyzed the results and waveforms of the testbench, and made changes to the testbench code to make its output more readable and its input easier to change. In Part 3 and 4, we learned how to analyze waveforms to understand what signal frequencies stand for and their timing relationships and how data is concatenated and assigned. With this knowledge, we modified the existing code so that the system works in the way we wanted.

## Lab 2
We introduced how to develop a module that converts 12-bit binary numbers into an 8-bit floating-point representation. This representation includes a 1-bit sign to show if numbers are positive or negative, a 3-bit exponent to adjust the range, and a 4-bit significand to keep the numbers precise. We focused on breaking down the 12-bit input into these key parts using three
separate logic blocks to precisely adjust the size and precision based on the input value. Xilinx
Vivado software and Verilog HDL are used to design these conversion modules, focusing on
improving performance and using fewer resources. This project was conducted through
simulations only to test and refine the modules in a controlled setting.

## Lab 3

We develop a working stopwatch on an
FPGA using Verilog and Vivado, which demonstrates the complete design flow of an FPGA
board. The seven-segment display is used to display numbers, including separate minutes and
seconds sections. The buttons on the board are configured to pause the stopwatch and to reset
it to 0 minutes and 0 seconds. The switches are used for adjustment, which causes the
corresponding display (minutes or seconds) to blink and increase. This project used a Basys 3
board on an Artix-7 FPGA, and generated a bitstream to send to it using Verilog HDL and the
Xilinx Vivado software. We showed the project to our TA Chenda through a demo of all the basic
features of the stopwatch, and tested using a Verilog testbench to catch coding errors.

## Lab 4
As a final project, we proposed to recreate the popular game “Flappy Bird” using an
FPGA for control and VGA for graphics output. This game is recognized for its simple gameplay
mechanics, where the player controls a bird attempting to navigate through a series of obstacles
without touching them. The project involves digital logic design, programming in Verilog, FPGA
board utilization, and the practical application of VGA graphics.

[Presentation & Demo Video](https://youtu.be/U6jrfiep6fU)

