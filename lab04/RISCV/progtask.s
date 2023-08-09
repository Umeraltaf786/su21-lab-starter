 .globl main  
  .text 
  main:
    la t0, num      # load the address of num in t0
    lw a0, 0(t0)    # load the value address of t0 in a0 which is 9
    addi sp,sp,-20  # stack space
    sw s0,0(sp)     # save all saved register one by one 
    sw s1,4(sp)
    sw s2,12(sp)
    sw ra,16(sp)
    addi t0,x0,1     # initialise t0 to 1
    addi t1,x0,1     # initialise t1 to 1
    jal factorial    # jum to factorial and store return address in ra
    
    
    
    exit:  
    lw s0, 0(sp)	# pop back up stack 
    lw s1, 4(sp)       # pop up all save registers
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20	# remove the stack space
    addi a1, t0, 0     # move t0 to a1
    la s0,result	# load the address of result in s0
    sw a0,0(s0)	# load the completed reult which is in a0 to result
    j write_tohost	# jump to write_tohost
          
factorial:
     ble a0,t1,return	# if num >=1 goto return
    mv s0,a0		#move num to s0
    addi a0,s0,-1 	#num-1
    addi sp,sp,-8	#sapce allocation in stack
    sw s0,0(sp)	#put calue of num in stack
    sw ra, 4(sp)    	# put value of ra in stack
    jal ra, factorial	#jump to factorial again store reutrn address in ra
    lw s0,0(sp)	# load back the value of num from stack to s0
    lw ra,4(sp)	#load back ra
    addi sp,sp,8	#remove stack
    mul a0,a0,s0       #num*factorial(num-1)
    jr ra		#hump to ra
return:	
addi a0,x0,1		#return 1
jr ra			#jump to ra
             
# start code here
# Insert your code here      
# end code here
write_tohost:
li x1, 1
sw x1, tohost, t5
j write_tohost
.data 
# start data section here     
num: .word 9		#initalise num and put value of 9
result: .word 0	#initalise result to 0
# Initialize data here (if required)
# end data section here
.align 12
.section ".tohost","aw",@progbits;                            
.align 4; .global tohost; tohost: .dword 0;                     
.align 4; .global fromhost; fromhost: .dword 0;
  
