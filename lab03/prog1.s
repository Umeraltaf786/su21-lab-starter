.globl main

.data
i:
    .word   0
a:
.word 7

b:
    .word   0
    .word   0
    .word   0
    .word   0

.text

main:
    # BEGIN PROLOGUE
    addi sp, sp, -20 # allocate stack space 
    sw s0, 0(sp)     # save saved register s0
    sw s1, 4(sp)    # save saved register s1
    sw s2, 8(sp)   #  save saved register s2
    sw s3, 12(sp)   # save saved register s3
    sw ra, 16(sp)   # save saved register s4
    # END PROLOGUE
   la s0,i         # load the address of i
   la s1,a         # load the address of 1
   lw s0,0(s0)     # load the value of i in s0
   lw s1,0(s1)     # load the value of a in s1
    la s2,b        # load the address of b in s2
    addi t1,t1,2   # intailise value for condition check
loop:
    bgt s0, t1, exit   # condition check i<3
    mul t0,s0,s1       # a*i
    add t0,t0,s1       #a+(a*i)
    sw t0,0(s2)        # b[i]=a+(a*i)
    addi s2,s2,4       # load next address fo b
    addi s0, s0, 1     # i++
    jal x0, loop       # jump till condition in ture 
exit:       
    # BEGIN EPILOGUE
    lw s0, 0(sp)      # laod data from stack to saved register s0
    lw s1, 4(sp)      # laod data from stack to saved register s1
    lw s2, 8(sp)      # laod data from stack to saved register s2
    lw s3, 12(sp)     # laod data from stack to saved register s3
    lw ra, 16(sp)     # laod data from stack to ra register 
    addi sp, sp, 20   # remove stack
    # END EPILOGUE
    
