public with sharing class RESTCalloutsMock implements HttpCalloutMock {
  public HttpResponse respond(HttpRequest request) {
    if (
      request.getEndpoint() ==
      'https://th-apex-http-callout.herokuapp.com/animals' &&
      request.getMethod() == 'GET'
    ) {
      HttpResponse response = new HttpResponse();
      response.setStatusCode(200);
      response.setBody(
        '[{"animals": ["majestic badger", "fluffy bunny","scary bear","chicken"]}]'
      );
      response.setStatus('OK');
      return response;
    } else if (
      request.getEndpoint() == 'https://jsonplaceholder.typicode.com/users' &&
      request.getMethod() == 'GET'
    ) {
      HttpResponse response = new HttpResponse();
      response.setStatusCode(200);
      response.setStatus('OK');
      response.setBody(
        '[{"id": 1,"name": "Leanne Graham","username": "Bret","email": "Sincere@april.biz","address": {"street": "Kulas Light","suite": "Apt. 556","city": "Gwenborough","zipcode": "92998-3874","geo": {"lat": "-37.3159","lng": "81.1496"}},"phone": "1-770-736-8031 x56442","website": "hildegard.org","company": {"name": "Romaguera-Crona","catchPhrase": "Multi-layered client-server neural-net","bs": "harness real-time e-markets"}}]'
      );
      return response;
    } else if (
      request.getEndpoint() ==
      'https://60a557ffc0c1fd00175f3bb3.mockapi.io/movies' &&
      request.getMethod() == 'GET'
    ) {
      HttpResponse response = new HttpResponse();
      response.setStatusCode(200);
      response.setStatus('OK');
      

      return response;
    }
    return null;
  }
}
