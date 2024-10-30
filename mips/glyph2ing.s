            .text
            .globl glyph2int

            .include "include/stack.s"
            .include "include/syscalls.s"



glyph2int:  nop                     # public static int glyph2int(int radix) {
            # a0: radix
            # t0: input             #    int input;
            # t1: digit             #    int digit;

            # t2: x0, y0, z0        #    boolean x0;
            # t3: x1, y1, z1        #    boolean x1;
            # t4: x2                #    boolean x2;
            # t5: y2                #    boolean y0;
            # t6: z2                #    boolean y1;
                                    #    boolean y2;
                                    #    boolean z0;
                                    #    boolean z1;
                                    #    boolean z2;

            

                                    #    mips.read_c();
                                    #    input = mips.retval();
      
start:      nop                     #    ;  

            sle $t2, '0', $t0       #    x0 = '0' <= input;
            sle $t3, $t0, '9'       #    x1 = input <= '9';
            and $t4, $t2, $t3       #    x2 = x0 && x1;

            sle $t2, 'A', $t0       #    y0 = 'A' <= input;
            sle $t3, $t0, 'Z'       #    y1 = input <= 'Z';
            and $t5, $t2, $t3       #    y2 = y0 && y1;

            sle $t2, 'a', $t0       #    z0 = 'a' <= input;
            sle $t3, $t0, 'z'       #    z1 = input <= 'a';
            and $t6, $t2, $t3       #    z2 = z0 && z1;

rob:        bne $t4, 1, rob_1       #    if (x2 == true) {
              subi $t1, $t0, '0'    #       digit = input - '0';
              b done                #       break rob;
                                    #    }
            bne $t5, 1, rob_2       #    else if (y2 == true) {
rob_1:                              #       ;            
                                    #       digit = input - 'A';
                                    #       digit = digit + 10;
            b done                  #       break rob;
                                    #       }
            bne $t6, 1, rob_3       #    else if (z2 == true) {
rob_2:                              #       ;      
                                    #       digit = input - 'a';
                                    #       digit = digit + 10;
            b done                  #       break rob;
                                    #       }
                                    #    else {
rob_3:      nop                     #       ;      
            li $t1, -1              #       digit = -1;
            b done                  #       break rob;
                                    #    }

rob_4:                              #    ;      
done:                               #    ;         

            ########################E
init:       nop                     #    ;
            subi $t7, $a0, -1       #    x = radix -1;
single:     bgt $t1, $t7, s_0       #    if (digit > x) {
            b s_1
s_0:          nop                   #        ;
              li $t1, -1            #        digit = -1;
              b s_done              #        break single;
                                    #    }
s_1:        nop                     #    ;
s_done:     nop                     #    ;

            move $v0, $t1           #    return digit;
            jr $ra
                                    #}