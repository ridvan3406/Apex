@isTest
public with sharing class OpportunityTriggerHandlerTest {
  @IsTest
  public static void testCreateProductsOnOppCreation() {
    // Create test data
    List<Opportunity> oppList = new List<Opportunity>();
    Opportunity opp = new Opportunity(
      Name = 'Test Opportunity 1',
      StageName = 'Prospecting',
      CloseDate = System.today()
    );
    oppList.add(opp);
    Opportunity opp2 = new Opportunity(
      Name = 'Test Opportunity 2',
      StageName = 'Closed Won',
      CloseDate = System.today()
    );
    oppList.add(opp2);

    // Insert test data
    insert oppList;

    // Call the method to be tested
    Test.startTest();
    OpportunityTriggerHandler.createProductsOnOppCreation(
      oppList,
      new Map<Id, Opportunity>(oppList)
    );
    Test.stopTest();

    // Perform assertions
    List<OpportunityLineItem> oppLineItemList = [
      SELECT Id, OpportunityId, Product2Id, Quantity, UnitPrice
      FROM OpportunityLineItem
      WHERE OpportunityId IN :oppList
    ];
    System.assertEquals(
      4,
      oppLineItemList.size(),
      'Incorrect number of OpportunityLineItem records created'
    );
    for (OpportunityLineItem oli : oppLineItemList) {
      System.assertEquals(
        1,
        oli.Quantity,
        'OpportunityLineItem has incorrect quantity'
      );
      System.assert(
        oli.UnitPrice > 0,
        'OpportunityLineItem has non-positive UnitPrice'
      );
      // Add more assertions as needed for other field values
    }
  }

  @IsTest
  public static void testCreateProductsWithInvalidInput() {
    // Create test data
    List<Opportunity> oppList = new List<Opportunity>();
    Opportunity opp = new Opportunity(
      Name = 'Test Opportunity 1',
      StageName = 'Prospecting',
      CloseDate = System.today()
    );
    oppList.add(opp);

    // Insert test data
    insert oppList;

    // Call the method to be tested with invalid input
    Test.startTest();
    OpportunityTriggerHandler.createProductsOnOppCreation(null, null);
    Test.stopTest();

    // Perform assertions
    List<OpportunityLineItem> oliList = [
      SELECT Id, OpportunityId, Product2Id, Quantity, UnitPrice
      FROM OpportunityLineItem
    ];
    System.assertEquals(
      0,
      oliList.size(),
      'OpportunityLineItems should not have been created with null input'
    );
  }

  // @IsTest
  // public static void testCreateProductsWithNoValidProduct() {
  //     // Create test data
  //     List<Opportunity> oppList = new List<Opportunity>();
  //     Opportunity opp = new Opportunity(Name = 'Test Opportunity 1', StageName = 'Prospecting', CloseDate= System.today());
  //     oppList.add(opp);

  //     // Insert test data
  //     insert oppList;

  //     // Call the method to be tested with no valid products
  //     Test.startTest();
  //     OpportunityTriggerHandler.createProductsOnOppCreation(oppList, new Map<Id, Opportunity>(oppList));
  //     Test.stopTest();

  //     // Perform assertions
  //     List<OpportunityLineItem> oliList = [SELECT Id, OpportunityId, Product2Id, Quantity, UnitPrice FROM OpportunityLineItem];
  //     System.assertEquals(0, oliList.size(), 'OpportunityLineItems should not have been created with no valid products');
  // }
}