; n11427230

.section .init0 // Places code at the top of programme memory

.include "include/individual.S" // Include individualised programme code 

entry:
    
    // Ex 2.1
    // 
    // Write assembly code to add the numbers 62 and 14
    // together, and store the result in register R0.
    //
    // Hint: 
    //   Recall the "ldi" instruction is used to load a value into a register,
    //   and the "mov" instruction will copy a value between registers. 

    ldi r16, 62     
    ldi r17, 14
    add r16, r17
    mov r0, r16

    // Write your code for Ex 2.1 above this line.
    push r0



    // Ex 2.2
    // 
    // Using an "and" instruction clear only bits 2, 3 and 5 of R1.
    
    ldi r18, 0b11010011  // bitmask
    ldi r16, 0b11111111
    and r16, r18
    mov r1, r16

    // Write your code for Ex 2.2 above this line.
    push r1



    // Ex 2.3
    // 
    // Using an "ori" instruction set only bits 2, 4 and 6 of R20.

    ldi r20, 0b00000001
    ori r20, 0b01010100

    // Write your code for Ex 2.3 above this line.
    push r20



    // Ex 2.4
    // 
    // Using exactly one instruction, add 1 to the value of r0.
    //
    // Hint:
    //   You can find a full list of arithmetic instructions summarised in
    //   table 5-2 of the AVR Instruction Set Manual.

    inc r0
    // Write your code for Ex 2.4 above this line.
    push r0



    // Ex 2.5
    //
    // Write assembly code to add 39 to 26152 storing the result
    // in register pair R30:R31 (low byte in R30).

    ldi r30, 39
    ldi r31, 1


    // Write your code for Ex 2.5 above this line.
   push r30
   push r31 



    // Ex 2.6
    //
    // Step 1: Encode the decimal value -38 as a two's complement, 8-bit binary number.
    // Step 2: Write down the result of Step 1 as a hexadecimal literal.
    // Step 3: Swap the two nibbles of the hexadecimal literal you wrote in Step 2.
    // Step 4: Write assembly code to load the result of Step 3 into register R21.
    
    ldi r16, -38
    neg r16
    ldi r21, 106
    // Write your code for Ex 2.6 above this line.
    push r21



    // Ex 2.7
    //
    // Write assembly code to use an "add" instruction to subtract the value in r22
    // from 68, and store the result in r23.

    ldi r16, 68
    ldi r22, -2
    add r16, r22
    mov r23, r16
    // Write your code for Ex 2.7 above this line.
    push r23



    // Ex 2.8
    //
    // Write assembly code to multiply the number 11 by 4
    // and store the result in R2.

    ldi r16, 11
    ldi r17, 4
    mul r16, r17
    mov r2, r0

    // Write your code for Ex 2.8 above this line.
    push r2

    
    
    // Ex 2.9
    //
    // Write assembly code to divide the number -119 by 2
    // and store the result in R3.

    ldi r16, -119
    asr r16
    mov r3, r16
    // Write your code for Ex 2.9 above this line.
    push r3


    // Ex 2.10
    //
    // Write assembly code to toggle the most significant bit, and
    // least significant 4 bits of R4.

    ldi r16, 12
    ldi r17, 0b10001111 
    mov r4, r16
    eor r4, r17


    // Write your code for Ex 2.10 above this line.
    push r4



// END OF TUTORIAL02 EXERCISES //
// DO NOT EDIT BELOW THIS LINE //

    // Restore r1 before we call any C functions
    ldi r16, 0
    mov r1, r16

    ldi r16, 0x22      // DISP_EN (PB1) | DISP_DP (PB5)
    sts 0x0420, r16    // Set as outputs
    sts 0x0424, r16    // Drive high

    break   // Terminate here for autograder

    // Check tutorial exercise solutions
    call display_raw_init
    call uart_init
    call test_tutorial02

    ldi r16, 0x20 // DISP_DP (PB5)
    ldi r17, 0x00

loop:
    // Delay
    com r17
    brne loop
    inc r18
    brne loop
    inc r19
    brne loop

    // Toggle DP LED
    sts 0x0427, r16     
    
    // Loop
    rjmp loop
