
Map<string, Country_Code__c> mapCustomSettings = Country_Code__c.getAll();

//.getAll() returns the map of country Name as key and Custom Setting records as values
// Key       Value
// Canada ---> CAN
System.debug('all country codes: ' + mapCustomSettings);

Set<string> Countries = mapCustomSettings.KeySet();
for (string eachCountry  : Countries) {
    Country_Code__c cs = mapCustomSettings.get(eachCountry);
    string countryCode= cs.Country_Code__c;

    System.debug(' country is: '+eachCountry + ' and country code is : '+countryCode);
}