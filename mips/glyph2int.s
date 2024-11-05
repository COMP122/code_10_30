                .text
                .globl glyph2int

                .include "include/stack.s"
                .include "include/syscalls.s"

                .eqv true 1

glyph2int:      nop                             # public static int glyph2int(int radix) {
                # a0: radix
                # t0 : t0                       #   boolean t0;
                # t1 : t1                       #   boolean t1;
                # t2 : t2                       #   boolean t2;
                # t3 : x                        #   boolean x;
                # t4 : y                        #   boolean y;
                # t5 : input                    #   int input;
                # t6 : digit                    #   int digit;

                # t7 : ascii_start              #   int ascii_start;
                # t8 : ascii_end                #   int ascii_end;
                # t9 : rhs                      #   int rhs;

                read_c()                        #   mips.read_c();
                move $t5, $v0                   #   input = mips.retval();

c_init:         nop                             #   ;
               

                                                #   // '0' <= input && input <= '9'
                li $t7, '0'                     #   ascii_start = '0';
                li $t8, '9'                     #   ascii_end = '9';
                sle $t3, $t7, $t5               #   x  = ascii_start <= input;
                sle $t4, $t5, $t8               #   y  = input <= ascii_end;
                and $t0, $t3, $t4               #   t0 = x && y;
        
                                                #   // 'A' <= input && input <= 'Z'
                li $t7, 'A'                     #   ascii_start = 'A';              
                li $t8, 'Z'                     #   ascii_end = 'Z';
                sle $t3, $t7, $t5               #   x  = ascii_start <= input;
                sle $t4, $t5, $t8               #   y  = input <= ascii_end;
                and $t1, $t3, $t4               #   t1 = x && y;
        
                                                #   // 'a' <= input && input <= 'z'
                li $t7, 'a'                     #   ascii_start = 'a';
                li $t8, 'z'                     #   ascii_end = 'z';
                sle $t3, $t7, $t5               #   x  = ascii_start <= input;        
                sle $t4, $t5, $t8               #   y  = input <= ascii_end;
                and $t2, $t3, $t4               #   t2 = x && y;

cond:           bne $t0, true, c_next_1         #   if (t0 == true ) {
c_next_0:         subi $t6, $t5, '0'            #      digit = input - '0';
                b c_done                        #      break cond;
                                                #   }
                                                #   else 
c_next_1:       bne $t1, true, c_next_2         #   if (t1 == true ) {
                  subi $t6, $t5, 'A'            #      digit = input - 'A';
                  addi $t6, $t6, 10             #      digit = digit + 10;
                b c_done                        #      break cond;
                                                #   }
                                                #   else 
c_next_2:       bne $t2, true, c_next_3         #   if (t2 == true ) {
                  subi $t6, $t5, 'a'            #      digit = input - 'a';
                  addi $t6, $t6, 10             #      digit = digit + 10;
                b c_done                        #      break cond; 
                                                #   }
                                                #   else {
c_next_3:       li $t6, -1                      #      digit = -1;
                b c_done                        #      break cond;
                                                #   }
c_next_4:       nop                             #   ;               
c_done:         nop                             #   ;               

           ########################
l_init:         nop                     #   ;
                addi $t9, $a0, -1       #   rhs = radix -1;

limit:          bgt $t6, $t9, l_next_0  #   if (digit > rhs) {
                b l_next_1

l_next_0:       li $t6, -1              #     digit = -1;
                b l_done                #     break limit;
                                        #   }
l_next_1:       nop                     #   ;          
l_done:         nop                     #   ;
                move $v0, $t6           #   return digit;
                jr $ra
                                        # }








