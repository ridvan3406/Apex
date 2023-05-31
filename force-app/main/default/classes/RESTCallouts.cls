public with sharing class RESTCallouts {
  public static HttpResponse getAnimals() {
    //1. Prepare HTTPRequest and wrap the necessary information in it
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    request.setMethod('GET');

    //2. Preapare internet
    Http http = new Http();

    //3. Send the HTTPRequest over the internet to recieve HttpResponse back
    HttpResponse response = http.send(request);

    //4. Process the HttpResponse
    if (response.getStatusCode() == 200) {
      // The request was successful (status code 200)
      String responseBody = response.getBody();
      System.debug('Response Body: ' + responseBody);
    } else {
      // The request failed or returned an error status code
      System.debug(
        'HTTP Request failed with status code: ' + response.getStatusCode()
      );
      CommonUtility.createLog(
        'RestCallouts - getAnimals',
        'Integration Apex',
        '',
        'Error',
        'Callouts Exception',
        response.getStatus(),
        response.getBody()
      );
    }
    return response;
  }
  public static HttpResponse getUsers() {
    //1. Prepare HTTPRequest and wrap the necessary information in it
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://jsonplaceholder.typicode.com/users');
    request.setMethod('GET');

    //2. Preapare internet
    Http http = new Http();

    //3. Send the HTTPRequest over the internet to recieve HttpResponse back
    HttpResponse response = http.send(request);

    //4. Process the HttpResponse
    if (response.getStatusCode() == 200) {
      // The request was successful (status code 200)
      String responseBody = response.getBody();
      System.debug('Response Body: ' + responseBody);
    } else {
      // The request failed or returned an error status code
      System.debug(
        'HTTP Request failed with status code: ' + response.getStatusCode()
      );
      CommonUtility.createLog(
        'RestCallouts - getUsers',
        'Integration Apex',
        '',
        'Error',
        'Callouts Exception',
        response.getStatus(),
        response.getBody()
      );
    }
    return response;
  }
}
