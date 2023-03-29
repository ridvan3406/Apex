public class Calculator {

    //parameter: msg = message to print .datatype is string
    public static void printNewMessage(string msg) {
        //msg is variable name
        //used only inside the method
        system.debug(msg);
    }
    public static string printAndReturnMessage(string msg) {
        string returnString = msg + ' ...Ok Cool ';
        return returnString;
    }

    public static boolean leapYearCheck(date dt){
        //method name 
        //parameters to pass
        //return type 
        integer year = dt.year();
        boolean leapYear =date.isLeapYear(year);
        return leapYear;
    }
    public static integer add(integer a,integer b){
        integer sum = a + b ;
        return sum;
    }
    public static integer add(integer a,integer b,integer c){
        integer sum = a + b +c;
        return sum;
    }

    public static integer subtract(integer a,integer b){
        integer subtract = a - b ;
        return subtract;
    }

    public static integer multiple(integer a,integer b){
        integer multiple = a * b ;
        return multiple;
    }

    
}