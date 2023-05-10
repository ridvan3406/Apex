@isTest 
public class AccountsBatchTest {
    @isTest 
    public static void testDescriptionUpdate() {
        // PREPARE THE DATA
        List<Account> listAcc = new List<Account>();
        Account a = new Account();
        a.name = 'SI Test';
        a.Industry ='Energy';
        a.Type = 'Customer - Direct';
        // a.active__c='No';
        listAcc.add(a);
      
        Account a1 = new Account();
        a1.name = 'UI Test';
        a1.Industry ='Energy';
        a1.Type = 'Customer - Direct';
        a1.active__c='Yes';
        listAcc.add(a1);
      
        for (Integer i = 0; i < 500; i++) {
            Account a2 = new Account();
            a2.name = 'PI Test';
            a2.Industry ='Banking';
            a2.Type = 'Customer - Direct';
            listAcc.add(a2);
        }
        insert listAcc;

        test.startTest();
        Database.executeBatch(new AccountsBatch(),550);
        test.stopTest();

        List<Account> accountsList =[SELECT id,active__c,description FROM Account WHERE active__c!='Yes'];
        for(account acc : accountsList) {
            System.assert(acc.Description.containsIgnoreCase('batch'));
        }
    }
}