.section .text
.global load
.type load, @function

load:
	add 	a4,a0,zero
	add 	a2,a0,a1
	add 	a3,a0,zero

loop: 	add 	a4,a3,a4
	addi	a3,a3,1
	blt	a3,a2,loop
	add 	a0,a4,zero
	ret
	
	//    The .section .text directive indicates that the following code belongs to the text (executable) section.
    //The .global load directive makes the load function globally visible.
    //The .type load, @function directive specifies that load is a function.
    //The load: label marks the beginning of the load function.
    //The add a4, a0, zero instruction copies the value of x to register a4.
    //The add a2, a0, a1 instruction computes the value of x + y and stores it in register a2.
    //The add a3, a0, zero instruction initializes the counter (register a3) to zero.
    //The loop: label marks the beginning of the loop.
    //The add a4, a3, a4 instruction accumulates the sum by adding the counter to the current total.
    //The addi a3, a3, 1 instruction increments the counter by 1.
    //The blt a3, a2, loop instruction branches to the loop label if the counter is less than x + y.
    //The add a0, a4, zero instruction stores the final sum in register a0.
    //The ret instruction signifies the end of the function and returns control to the calling code.
	
