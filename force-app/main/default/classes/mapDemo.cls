public class mapDemo {
    public static string retrieveMonth(integer n) {
        string month = '';
        Map<integer, string> mapMonths = new Map<integer, string>();
        mapMonths.put(1, 'january');
        mapMonths.put(2, 'february');
        mapMonths.put(3, 'march');
        mapMonths.put(4, 'april');
        mapMonths.put(5, 'may');
        mapMonths.put(6, 'june');
        mapMonths.put(7, 'july');
        mapMonths.put(8, 'august');
        mapMonths.put(9, 'september');
        mapMonths.put(10, 'october');
        mapMonths.put(11, 'november');
        mapMonths.put(12, 'december');
          
        if (mapMonths.containsKey(n)) {
            month = mapMonths.get(n);
        }else {
            month='please enter a value between 1-12. you entered :' + n;
        }
        return month;
    }
}