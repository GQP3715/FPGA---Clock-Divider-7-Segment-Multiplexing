## Project Overview
This project implements a **clock divider** and a **multi-digit 7-segment display driver** on the Digilent Nexys 3 FPGA board.  
It demonstrates how to take a **100 MHz input clock** and divide it down to **500 Hz**, then use that signal to drive all four digits of the 7-segment display simultaneously, showing the sequence `4321`.  

The project also demonstrates **hierarchical design in VHDL** by combining:
1. A **Clock Divider Module**  
2. A **7-Segment Driver Module**  
3. A **Top Module** that integrates everything  

## Implementation Details
- **Language:** VHDL  
- **Toolchain:** Xilinx ISE (Spartan-6)  
- **Board:** Digilent Nexys 3 


### Part 1 – Clock Divider
- Input: 100 MHz onboard clock.  
- Output: 500 Hz square wave.  
- Logic: Counter-based division (100 MHz ÷ 200,000).  

### Part 2 – 7-Segment Driver
- Multiplexes all 4 digits.  
- Displays the sequence `4321`.  
- Uses the divided clock for smooth digit switching.  

### Part 3 – Hierarchical Top Design
- Instantiates the **Clock Divider** and **7-Segment Driver** inside a **Top Module**.  
- Demonstrates structured VHDL design. 


## 📝 Note
This project is shared as an **FPGA application challenge**, not a lab solution.  
It highlights **clock manipulation, digital multiplexing, and hierarchical design in VHDL**.