public class ListDemo {
    public static string listCandidates(integer i) {
        List<string> listCandidates = new List<string>();
        listCandidates.add('ridvan');
        listCandidates.add('ezgi');
        listCandidates.add('jim');
        listCandidates.add('pam');
        listCandidates.add('kevin');

        // String index3Value = listCandidates.get(3);
        // System.debug(index3Value);
        // System.debug('candidates are ' + listCandidates);

        String returnString = '';
        if (i>0 && i<listCandidates.size()) {
            returnString=listCandidates[i];
        }else {
            returnString='No value found ';
        }
        return returnString;

    }

    public static void randomIntegerList() {
        List<integer> randomIntegerList = new List<integer>();
        randomIntegerList.add(1);
        randomIntegerList.add(5);
        randomIntegerList.add(12);
        randomIntegerList.add(3);
        randomIntegerList.add(4);
        
        integer valueAt2= randomIntegerList[2];

        Integer size = randomIntegerList.size();

        // System.debug('randomIntegerList are ' + randomIntegerList);
        // System.debug('valueAt2 is ' + valueAt2);
        // System.debug('size is ' + size);
    }

    public static void allCats() {
        List<Cat> cats = new List<Cat>();
        Cat myCat = new Cat('brian', 'white');
        Cat yourCat = new Cat('stewei', 'black');
        Cat ourCat = new Cat('lois', 'yellow');
        // how do we add cats
        // 1.we will create new instance of  class
        //2. then add those instances to the list.
        cats.add(myCat);
        cats.add(yourCat);
        cats.add(ourCat);
        System.debug('all cats are ' + cats);
         
        
        if (!cats.isEmpty()) {
            Cat catAt3 = cats[2];
            System.debug(catAt3);
        }
        
    }

   

}