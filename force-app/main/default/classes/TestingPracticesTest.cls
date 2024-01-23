@isTest
private class TestingPracticesTest {
  @testSetup
  static void setupTestData() {
    // Set up common test data shared across test methods
    List<Account> testAccounts = new List<Account>();
    testAccounts.add(
      new Account(Name = 'Test Account 1', AnnualRevenue = 1200000)
    );
    testAccounts.add(
      new Account(Name = 'Test Account 2', AnnualRevenue = 800000)
    );
    insert testAccounts;
  }

  @isTest
  static void testUpdateAccountStatus() {
    // Test method logic

    // Start collecting governor limits for this test method
    Test.startTest();

    // Query test data
    List<Account> accountsToUpdate = [
      SELECT Id, AnnualRevenue, CustomerPriority__c
      FROM Account
      WHERE Name LIKE 'Test%'
    ];

    // Call the method to be tested
    TestingPractices.updateAccountStatus(accountsToUpdate);

    // Stop collecting governor limits for this test method
    Test.stopTest();

    // Assert the results
    for (Account acc : accountsToUpdate) {
      if (acc.AnnualRevenue > 1000000) {
        System.assertEquals(
          'High',
          acc.CustomerPriority__c,
          'Account with high revenue should have High Customer Priority'
        );
      } else {
        System.assertEquals(
          'Low',
          acc.CustomerPriority__c,
          'Account with low revenue should have Low Customer Priority'
        );
      }
    }
  }
}
