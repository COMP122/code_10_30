                .text
                .globl glyph2int

                .include "include/stack.s"
                .include "include/syscalls.s"


glyph2int:      nop                     # public static int glyph2int(int radix) {
                # a0: radix
                # t0 : t0               #   boolean t0;
                # t1 : t1               #   boolean t1;
                # t2 : t2               #   boolean t2;
                # t3 : x                #   boolean x;
                # t4 : y                #   boolean y;
                # t5 : input            #   int input;
                # t6 : digit            #   int digit;

                # t7 : ascii_start      #   int ascii_start;
                # t8 : ascii_end        #   int ascii_end;
                # t9 : rhs              #   int rhs;

                                        #   mips.read_c();
                                        #   input = mips.retval();

c_init:                                 #   ;
               

                                                #   // '0' <= input && input <= '9'
                                                #   ascii_start = '0';
                                                #   ascii_end = '9';
                sle $t3, $t7, $t5               #   x  = ascii_start <= input;
                sle $t4, $t5, $t8               #   y  = input <= ascii_end;
                and $t0, $t3, $t4               #   t0 = x && y;
        
                                                #   // 'A' <= input && input <= 'Z'
                                                #   ascii_start = 'A';              
                                                #   ascii_end = 'Z';
                                                #   x  = ascii_start <= input;
                                                #   y  = input <= ascii_end;
                                                #   t1 = x && y;
        
                                                #   // 'a' <= input && input <= 'z'
                                                #   ascii_start = 'a';
                                                #   ascii_end = 'z';
                                                #   x  = ascii_start <= input;        
                                                #   y  = input <= ascii_end;
                                                #   t2 = x && y;

cond:               bne $t0, 1, c_next_1        #   if (t0 == true ) {
c_next_0:             subi $t6, $t5, '0         #      digit = input - '0';
                    b done                      #      break cond;
                                                #   }
                                                #   else 
c_next_1:           bne $t1, 1, c_next_2        #   if (t1 == true ) {
                                                #      digit = input - 'A';
                                                #      digit = digit + 10;
                                                #      break cond;
                                                #   }
                                                #   else 
c_next_2:           bne $t2, 1, c_next_3        #   if (t2 == true ) {
                                                #      digit = input - 'a';
                                                #      digit = digit + 10;
                                                #      break cond; 
                                                #   }
                                                #   else {
c_next_3:                                       #      digit = -1;
                                                #      break cond;
                                                #   }
c_next_4:                                       #   ;               
c_done:                                         #   ;               

           ########################
l_init:         nop                     #   ;
                addi $t9, $a0, -1       #   rhs = radix -1;

limit:          bgt $t6, $t9, l_next_0  #   if (digit > rhs) {
                b {next_1}

l_next_0:       li $t6, -1              #     digit = -1;
                b l_done                #     break limit;
                                        #   }
l_next_1:       nop                     #   ;          
l_done:         nop                     #   ;
                move $v0, $t6           #   return digit;
                jr $ra
                                        # }








