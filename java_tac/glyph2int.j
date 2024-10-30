public static int glyph2int(int radix) {

         int input;
         int digit;

         boolean x0;
         boolean x1;
         boolean x2;
         boolean y0;
         boolean y1;
         boolean y2;
         boolean z0;
         boolean z1;
         boolean z2;

         int     x;

         mips.read_c();
         input = mips.retval();
      
start:   ;  

         x0 = '0' <= input;
         x1 = input <= '9';
         x2 = x0 && x1;

         y0 = 'A' <= input;
         y1 = input <= 'Z';
         y2 = y0 && y1;

         z0 = 'a' <= input;
         z1 = input <= 'a';
         z2 = z0 && z1;

rob:     if (x2 == true) {
rob_0:      digit = input - '0';
            break rob;
         }
         else {
rob_1:     if (y2 == true) {
            ;            
            digit = input - 'A';
            digit = digit + 10;
            break rob;
            }
         else if (z2 == true) {
rob_2:      ;      
            digit = input - 'a';
            digit = digit + 10;
            break rob;
            }
         else {
rob_3:      ;      
            digit = -1;
            break rob;
         }

rob_4:   ;      
done:    ;         

init:
         x = radix -1;
single:  if (digit > x) {
s_0:         ;
             digit = -1;
             break single;
         }
s_1:     ;
s_done:  ;

    return digit;
}