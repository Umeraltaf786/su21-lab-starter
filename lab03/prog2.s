.globl main

.data
i:
    .word   0


num:
.word 1

    

.text

main:
    # BEGIN PROLOGUE
    addi sp, sp, -40 # allocate stack space 
        # END PROLOGUE
   la s0,i         # load the address of i
   la a0,num       # load the address of num
   lw s0,0(s0)     # load the value of i in s0
   lw a0,0(a0)     # load the value of num in a0
    mv s2,sp        # move the stack pointer in s2
    li t1,10   # intailise value for condition check
loop:
    bgt s0, t1, exit    # condition check i>10
    jal ra compare      #jump to compare fuction
    sw s0,0(s2)         # array[i]=compare(num,i)
    addi s2,s2,4        #increment in stack loaction
    addi t1,t1,-1       # I--
    j loop              #jump back to loop
  
compare:
addi sp,sp -4     # stack allocation for return address
sw ra,0(sp)       #store ra to stack
jal subt          #call subt fuction
bge s0,x0,re      # condition check after subt if sub(a,b)>=0 goto re
add s0,x0,x0      # else return 0
lw ra,0(sp)       # load back ra from stack
addi sp,sp,4      # remove allocated stack memory
jr ra             # return to ra
re:     
addi s0,x0,1     # return 1
lw ra,0(sp)      # load back ra from stack
addi sp,sp,4     # remove allocated stack memory
jr ra             # return to ra
subt:
sub s0,a0,s0     #a-b
jr ra             # return to ra
    
exit:       
 
