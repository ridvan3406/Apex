SetDemo.citySet();


List<Integer> integerList = new List<Integer>();
integerList.add(10);
integerList.add(15);
integerList.add(10);
integerList.add(11);
integerList.add(10);

Set<Integer> sInt = SetDemo.setFromList(integerList);
System.debug('set is ' + sInt);



Set<String> cities = new Set<String>{'istanbul', 'london', 'Tokyo', 'San Francisco', 'Paris', 'Berlin', 'San Francisco', 'Paris', 'Berlin'};
Set<String> capCities = SetDemo.capitalizeSet(cities);
System.debug('set of cities is ' + capCities);
System.debug(capCities.contains('ISTANBUL'));
System.debug(capCities.size());
System.debug(capCities.hashCode());