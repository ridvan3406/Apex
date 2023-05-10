@isTest
public class AccountQueueableTest {
    @isTest
    public static void testQueueable() {
        List<Account> listAcc = new List<Account>();
        for (Integer i = 0; i < 500; i++) {
            Account acc = new Account();
            acc.name = 'Green Case';
            acc.Industry = 'mobile';
            acc.Type = 'Customer - Direct';
            listAcc.add(acc);
        }
        insert listAcc;

        AccountsQueueableExample aqe = new AccountsQueueableExample (listAcc);
        
        Test.startTest();
        Id jobId = system.enqueueJob(aqe);
        Test.stopTest();

        List<Account> accounts = [select name from account where name like '%RS%'];
        System.assertEquals(500, accounts.size());
    }
}