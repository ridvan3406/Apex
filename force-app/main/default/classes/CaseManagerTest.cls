@isTest
public with sharing class CaseManagerTest {
  @TestSetup
  public static void makeData() {
    //create an account , a contact and 4 cases
    Account acc = new Account(Name = 'Test Account');
    insert acc;
    Contact con = new Contact(
      FirstName = 'Test Contact',
      LastName = 'Test',
      Email = 'test@test.com'
    );
    insert con;

    List<Case> cases = new List<Case>();
    for (Integer i = 0; i < 4; i++) {
      Case cs = new Case();
      cs.AccountId = acc.Id;
      cs.ContactId = con.Id;
      cs.Subject = 'Problem with wifi router' + i;
      cs.Description = 'Problem started in the morning';
      cs.Origin = 'Email';
      cs.Priority = 'Low';
      cases.add(cs);
    }
    insert cases;
  }
  @isTest
  private static void getCaseTest() {
    Test.startTest();
    ////   Prepare request uri
    Case cs = [
      SELECT Id, CaseNumber, Subject, Description, Priority, Origin
      FROM Case
      LIMIT 1
    ];
    //this is my home url https://d8d0000090l4eeaq-dev-ed.develop.lightning.force.com/
    String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
    String uri = homeUrl + '/services/apexrest/Case/' + cs.Id;

    /////  Prepare RestRequest and context
    RestRequest request = new RestRequest();
    request.requestURI = uri;
    request.httpMethod = 'GET';
    RestContext.request = request;

    /// test the method and perform asserts
    Case objCase = CaseManager.getCase();
    System.assert(objCase.Id != null);
    System.assertEquals(objCase.Subject, cs.Subject);
    System.assertEquals(objCase.CaseNumber, cs.CaseNumber);
    Test.stopTest();
  }
  @isTest
  private static void createCaseTest() {
    Test.startTest();
    Id caseId = CaseManager.createCase(
      'Test Subject',
      'High',
      'Web',
      'Test description'
    );
    System.assert(caseId != null);
    Test.stopTest();
  }
  @IsTest
  static void deleteCaseTest() {
    // Create a test Case record
    Case testCase = new Case(Status = 'New');
    insert testCase;

    // Get the Case ID
    Id caseId = testCase.Id;

    // Set up the REST request
    RestRequest request = new RestRequest();
    RestContext.request = request;
    request.requestURI = '/services/apexrest/Case/' + caseId;

    // Call the deleteCase() method
    String result = CaseManager.deleteCase();

    // Verify the Case is deleted
    System.assertEquals(null, [SELECT Id FROM Case WHERE Id = :caseId]);

    // Verify the result message
    System.assertEquals(
      'Case has been deleted successfully!! ' + caseId,
      result
    );
  }
  @isTest
  static void upsertCaseTest1() {
    Test.startTest();
    // do not send case id , observe if case is getting created
    Id caseId = CaseManager.upsertCase(
      null,
      'test subject',
      'High',
      'Web',
      'description test'
    );
    System.assert(caseId != null);
    Test.stopTest();
  }
  @isTest
  static void upsertCaseTest2() {
    Test.startTest();
    // send case id , observe if case is getting updated
    Case cs = [SELECT Id, CaseNumber FROM Case LIMIT 1];
    Id caseId = CaseManager.upsertCase(
      cs.Id,
      'test subject',
      'High',
      'Web',
      'test description'
    );
    System.assertEquals(cs.Id, caseId);
    Test.stopTest();
  }
  @isTest
  private static void updateCaseTest() {
    Test.startTest();
    //prepare json string(serialise) and convert it to Blob
    Case cs = [
      SELECT Id, Subject, Description, Reason
      FROM Case
      LIMIT 1
    ];
    cs.Reason = 'Installation';
    String jsonString = JSON.serialize(cs);

    //prepare RestRequest and Context
    RestRequest request = new RestRequest();
    request.requestBody = Blob.valueOf(jsonString);
    request.httpMethod = 'PATCH';
    RestContext.request = request;
    //Test method and perform asserts
    Case updatedCase = CaseManager.updateCase();
    System.assertEquals('Installation', updatedCase.Reason);
    Test.stopTest();
  }
}
