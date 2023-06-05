public class SetDemo {
  public static void citySet() {
    Set<string> cities = new Set<string>();
    cities.add('istanbul');
    cities.add('London');
    cities.add('Tokyo');
    cities.add('San Francisco');
    cities.add('Paris');
    cities.add('Berlin');
    cities.add('San Francisco');
    cities.add('Paris');
    cities.add('Berlin');

    System.debug('list of cities: ' + cities);
  }
  /// set i list e cevirmek icin kullandigimiz method.
  public static set<integer> setFromList(List<integer> intList) {
    Set<integer> intSet = new Set<integer>();

    intSet.addAll(intList);

    return intSet;
  }

  public static set<string> capitalizeSet(set<string> setString) {
    Set<string> capitalizeSet = new Set<string>();

    for (string eachString : setString) {
      string tempStr = eachString.toUpperCase();

      capitalizeSet.add(tempStr);
    }

    return capitalizeSet;
  }
}
