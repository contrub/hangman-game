# Course Project: Hangman Game

## Overview  
This project demonstrates practical usage of Assembly language by implementing a program that performs file operations, basic computations, and graphical output. It is designed for learning low-level programming concepts, CPU architecture, and interrupt handling.

## Project Demo

<details>
<summary><b>Click to expand</b></summary>

![Start Game](images/start_game.png)

Start game demo

</details>

## Features  
- Open and read files in binary mode  
- Display text and graphics on the screen  
- Perform arithmetic operations using registers and memory  
- Manipulate memory segments and pointers  
- Use macros and procedures for code modularity  
- Handle DOS and BIOS interrupts (e.g., `int 21h`, `int 10h`)  

## Technologies Used  
- x86 Assembly Language (MASM)  
- DOS and BIOS interrupt calls  
- Intel 8086/8088 architecture  
- Text and graphics video modes  

## Build and Run Instructions  
1. Prepare your Assembly environment (MASM).

2. Before running the program, two files ```Ques.txt``` and ```Ans.txt``` should be created in the game root for the questions and the correct answer.

2. Compile and link source code:  
```bash
masm /a game.asm
link game.obj
```  

3. Run the executable in a DOS emulator or on real hardware:
```bash
game.exe
```