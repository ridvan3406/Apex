public with sharing class CovidInfoCallouts {
  public static HttpResponse getCovidCaseInfo() {
    //1- Pre[are HttpRequest and wrap data in it
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
    request.setMethod('GET');

    //1- Prepare internet
    Http http = new Http();
    //3.Send the request over the internet to receive response
    HttpResponse response = http.send(request);
    //4= process the response
    if (response.getStatusCode() == 200) {
      String jsonString = response.getBody();
      List<CovidWrapper> wrappers = (List<CovidWrapper>) JSON.deserialize(
        jsonString,
        List<CovidWrapper>.class
      );
      CovidWrapper covidWrapper = wrappers[0];

      //Check info for existing records of today
      List<Covid_Info__c> infos = [
        SELECT Id, Name, Positive__c, Negative__c, Pending__c
        FROM Covid_Info__c
        WHERE Received_Date__c = TODAY
      ];
      if (!infos.isEmpty()) {
        infos[0].Name = String.valueOf(covidWrapper.states);
        infos[0].Positive__c = covidWrapper.positive;
        infos[0].Negative__c = covidWrapper.negative;
        infos[0].Pending__c = covidWrapper.pending;
        update infos[0];
      } else {
        Covid_Info__c info = new Covid_Info__c();
        info.Name = String.valueOf(covidWrapper.states);
        info.Positive__c = covidWrapper.positive;
        info.Negative__c = covidWrapper.negative;
        info.Pending__c = covidWrapper.pending;
        info.Received_Date__c = date.today();
        insert info;
      }
    }
    return response;
  }
}
