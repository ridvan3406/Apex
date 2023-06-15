@isTest
private class RESTCalloutsTest {
  @isTest
  static void testGetUsers() {
    // Prepare the mock response
    HttpResponse mockResponse = new HttpResponse();
    mockResponse.setStatusCode(200);
    mockResponse.setBody(
      '[{"email":"test@example.com","phone":"1234567890","username":"testuser","website":"www.example.com","name":"Test User","address":{"street":"123 Street","city":"Test City"}}]'
    );

    // Set up the mock callout
    Test.setMock(
      HttpCalloutMock.class,
      new MockHttpResponseGenerator(mockResponse)
    );

    // Call the method to be tested
    HttpResponse response = RESTCallouts.getUsers();

    // Perform assertions
    System.assertEquals(200, response.getStatusCode());

    // Verify that the My_User__c records are created
    List<My_User__c> users = [
      SELECT
        Email__c,
        Phone__c,
        Username__c,
        Website__c,
        Name,
        Street__c,
        City__c
      FROM My_User__c
    ];
    System.assertEquals(1, users.size());
    My_User__c user = users[0];
    System.assertEquals('test@example.com', user.Email__c);
    System.assertEquals('1234567890', user.Phone__c);
    System.assertEquals('testuser', user.Username__c);
    System.assertEquals('www.example.com', user.Website__c);
    System.assertEquals('Test User', user.Name);
    System.assertEquals('123 Street', user.Street__c);
    System.assertEquals('Test City', user.City__c);
  }

  @isTest
  private static void getAnimalsTest() {
    RESTCalloutsMock mock = new RESTCalloutsMock();
    Test.setMock(HttpCalloutMock.class, mock);
    HttpResponse response = RESTCallouts.getAnimals();
    System.assertEquals(response.getStatus(), 'OK');
    System.assertEquals(response.getStatusCode(), 200);
    System.assertEquals(
      response.getBody(),
      '[{"animals": ["majestic badger", "fluffy bunny","scary bear","chicken"]}]'
    );
  }

  @isTest
  private static void getUsersTest() {
    RESTCalloutsMock mock = new RESTCalloutsMock();
    Test.setMock(HttpCalloutMock.class, mock);
    HttpResponse response = RESTCallouts.getUsers();
    System.assertEquals(response.getStatus(), 'OK');
    System.assertEquals(response.getStatusCode(), 200);
    System.assertEquals(
      response.getBody(),
      '[{"id": 1,"name": "Leanne Graham","username": "Bret","email": "Sincere@april.biz","address": {"street": "Kulas Light","suite": "Apt. 556","city": "Gwenborough","zipcode": "92998-3874","geo": {"lat": "-37.3159","lng": "81.1496"}},"phone": "1-770-736-8031 x56442","website": "hildegard.org","company": {"name": "Romaguera-Crona","catchPhrase": "Multi-layered client-server neural-net","bs": "harness real-time e-markets"}}]'
    );
  }

  @IsTest
  private static void getProductsTest() {
    // Set up mock
    RESTCalloutsMock mock = new RESTCalloutsMock();
    Test.setMock(HttpCalloutMock.class, mock);

    // Call the method to be tested
    HttpResponse response = RESTCallouts.getProducts();

    // Assert the response
    System.assertEquals(response.getStatus(), 'OK');
    System.assertEquals(response.getStatusCode(), 200);

  }

  // Helper class to generate mock HTTP responses
  private class MockHttpResponseGenerator implements HttpCalloutMock {
    private HttpResponse response;

    public MockHttpResponseGenerator(HttpResponse response) {
      this.response = response;
    }

    public HttpResponse respond(HttpRequest request) {
      return response;
    }
  }
}
