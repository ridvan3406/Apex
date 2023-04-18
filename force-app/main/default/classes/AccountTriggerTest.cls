@isTest
public with sharing class AccountTriggerTest {
    @isTest
    private static void testMethod1() {
        List<account> listAcc = new List<account>();
        Account a = new Account();
        a.name = 'SI Test';
        a.Industry ='Energy';
        a.Type = 'Customer - Direct';
        listAcc.add(a);

        Account a1 = new Account();
        a1.name = 'UI Test';
        a1.Industry ='Energy';
        a1.Type = 'Customer - Direct';
        listAcc.add(a1);

        Account a2 = new Account();
        a2.name = 'PI Test';
        a2.Industry ='Banking';
        a2.Type = 'Customer - Direct';
        listAcc.add(a2);

        insert listAcc;

        for (Account eachAccount : listAcc) {
            eachAccount.Description= 'Description Updated';
        }
        update listAcc;
    }
}