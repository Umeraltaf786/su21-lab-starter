.globl factorial

.data
n: .word 9

.text
main:
    la t0, n
    lw a0, 0(t0)
    addi sp,sp,-20
    sw s0,0(sp)
    sw s1,4(sp)
    sw s2,12(sp)
    sw ra,16(sp)
    addi t0,x0,1
    addi t1,x0,1
    beq a0,x0,fac0
    beq a0,t1,fac0
    jal ra, factorial
    exit:  
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20
    addi a1, t0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit
      
factorial:
    # YOUR CODE HERE
    addi t1,x0,1
    addi t3,a0,0
    bge a0,t1,fac
    j exit
    #again:
    fac:
    mul t3,t3,t0
    mv t0,t3
    addi a0,a0,-1
    j factorial
    fac0:
    addi t0,x0,1
    j exit
    
    