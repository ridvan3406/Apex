public with sharing class TestingPractices {
    public static void updateAccountStatus(List<Account> accounts) {
        for (Account acc : accounts) {
            // Perform some logic, for example, setting the status based on certain criteria
            if (acc.AnnualRevenue > 1000000) {
                acc.CustomerPriority__c = 'High';
            } else {
                acc.CustomerPriority__c = 'Low';
            }
        }
        update accounts;
    }
}