public class Loops {
    public void print_integer_while(){
        integer count =1;
        while (count<=21) {
            count++;
            system.debug(count);
        }
    }

    public void print_integer_for_loop(integer n){
        for (integer i=0; i<n; i++) {
            system.debug(i);
        }
    }

    public void print_odd_number(integer startInteger, integer endInteger){
        for (integer i=startInteger; i<endInteger; i++) {
            integer remaining =math.mod(i, 2);
            if(remaining==1){
                system.debug(i);
            }
        }
    }
}