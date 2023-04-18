@isTest
public with sharing class insertRelatedRecordDemoTest {
    @isTest
    public static void testUpdateMultiple() {
        //1- prepare data (more than 200 record)
        List<Account> listAcc = new List<Account>();
    
        for (integer i = 1; i < 15 ; i++) {
        Account acc = new Account();
        acc.name = 'Drejan'+ i;
        acc.AccountNumber='ACDR' + i;
        acc.Active__c='Yes';
        listAcc.add(acc);
        }
    
        System.debug('size of listAcc = ' + listAcc.size());

        if(!listAcc.isEmpty()) insert listAcc;

        // 2 - Call the method
        insertRelatedRecordDemo.multipleRecordUpdate();

        //3 - Test the result by using asserts
        //fetch accounts with SOQL
        List<Account> acc = [SELECT id,name FROM Account];
        System.assertEquals('Drejan1 v.2',acc[0].name);
        System.assert(acc[0].name.contains('v.2'));

    }
}