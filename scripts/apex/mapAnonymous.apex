

Map<String,String> mapCountryCurrencies = new Map<String,String>();

mapCountryCurrencies.put('USA', 'dollars');
mapCountryCurrencies.put('USA', 'dollar');
mapCountryCurrencies.put('UK', 'pound');
mapCountryCurrencies.put('Germany', 'euro');
mapCountryCurrencies.put('Spain', 'euro');
System.debug('map of country currencies =' + mapCountryCurrencies);

String getCurrency = mapCountryCurrencies.get('USA');
System.debug('getCurrency =' + getCurrency);

for (String country : mapCountryCurrencies.keySet()) {
   String getCurrency = mapCountryCurrencies.get(country);
    System.debug(country + ' use : ' + getCurrency + ' as a currency ');
}

Set<String>currencySet = mapCountryCurrencies.keySet();//to print keys we need to create set. because keys are unique
system.debug('all  countries : '+ currencySet);
List <string>countrySet = mapCountryCurrencies.values();//to print values we need to create list
System.debug('all currencies : '+ countrySet);









