public static int glyph2int(int radix) {

               boolean t0;
               boolean t1;
               boolean t2;
               boolean x;
               boolean y;
               int input;
               int digit;

               int ascii_start;
               int ascii_end;
               int rhs;

               mips.read_c();
               input = mips.retval();

c_init:        ;
               

               // '0' <= input && input <= '9'
               ascii_start = '0';
               ascii_end = '9';
               x  = ascii_start <= input;
               y  = input <= ascii_end;
               t0 = x && y;

               // 'A' <= input && input <= 'Z'
               ascii_start = 'A';              
               ascii_end = 'Z';
               x  = ascii_start <= input;
               y  = input <= ascii_end;
               t1 = x && y;

               // 'a' <= input && input <= 'z'
               ascii_start = 'a';
               ascii_end = 'z';
               x  = ascii_start <= input;        
               y  = input <= ascii_end;
               t2 = x && y;

cond:          if (t0 == true ) {
c_next_0:         digit = input - '0';
                  break cond;
               }
               else 
c_next_1:      if (t1 == true ) {
                  digit = input - 'A';
                  digit = digit + 10;
                  break cond;
               }
               else 
c_next_2:      if (t2 == true ) {
                  digit = input - 'a';
                  digit = digit + 10;
                  break cond; 
               }
               else {
c_next_3:         digit = -1;
                  break cond;
               }
c_next_4:      ;               
c_done:        ;               

l_init:        ;
               rhs = radix - 1;
limit:         if (digit > rhs) {
l_next_0:        digit = -1;
                 break limit;
               }
l_done:
               return digit;
}








