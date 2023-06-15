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
