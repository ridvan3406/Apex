public class forEach {
    public static void iterateIntegereList() {
        List<integer> IntegerList = new List<integer>();
        IntegerList.add(1);
        IntegerList.add(5);
        IntegerList.add(12);
        IntegerList.add(3);
        IntegerList.add(4);
        
        IntegerList.sort();

        for (integer eachInteger : IntegerList) {
            System.debug(eachInteger);
        }
    }
    public static integer add(List<integer> intList){
        integer returnInt = 0;

        for (integer eachInteger : intList) {
            returnInt += eachInteger;
        }

        return returnInt;
    }

    public static string uppecaseList(List<string> stringList) {
        string returnString ='';
        for (string eachName : stringList) {
          System.debug(eachName.toUpperCase()) ;
        }
      return returnString;
    }

}