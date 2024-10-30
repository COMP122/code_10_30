public static int glyph2int(int radix) {

         int input;
         int digit;
      
         mips.read_c();
         input = mips.retval();
      
start:   ;  
rob:     if ('0' <= input && input <= '9') {
            digit = input - '0';
            break rob;
         }
         else if ('A' <= input && input <= 'Z') {
rob_1:      ;            
            digit = input - 'A';
            digit = digit + 10;
            break rob;
         }
         else if ('a' <= input && input <= 'z') {
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



         if (digit > (radix - 1)) {
             digit = -1;
         }

    return digit;
}