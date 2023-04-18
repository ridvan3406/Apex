@isTest
public with sharing class AccountTriggerHandlerTest {
    @isTest
    public  static void updateDescIfAccountisActive() {
        // oncelikle dummy data urettik , ki test edebilelim
        Account a = new Account();
        a.name = 'SI Test';
        a.Industry ='Energy';
        a.Type = 'Customer - Direct';
        a.active__c='No';
      
        Account a1 = new Account();
        a1.name = 'UI Test';
        a1.Industry ='Energy';
        a1.Type = 'Customer - Direct';
        a1.active__c='Yes';
      

        Account a2 = new Account();
        a2.name = 'PI Test';
        a2.Industry ='Banking';
        a2.Type = 'Customer - Direct';
       
       
        List<Account> listAcc = new List<Account>{a,a1,a2};
        insert listAcc;

        //update , we update the dummy data and test it 
        for (Account eachAccount : listAcc) {
            eachAccount.Active__c = 'Yes';
            eachAccount.Description = 'Account is active.';
        }
        update listAcc;

        List<Account> updateAcc = [SELECT id,description FROM Account];
        for (Account eachAccount : updateAcc) {
            System.assertEquals('Account is active.', eachAccount.Description);
        }
    }
    @isTest
    public static void testVipAccountandContact() {
       
        Account a1 = new Account();
        a1.name = 'UI Test';
        a1.Industry ='Energy';
        a1.Type = 'Customer - Direct';
        a1.active__c='Yes';
      

        Account a2 = new Account();
        a2.name = 'PI Test';
        a2.Industry ='Banking';
        a2.Type = 'Customer - Direct';
        a2.active__c='No';
       
       
        List<Account> listAcc = new List<Account>{a1,a2};
        insert listAcc;

        List<Contact> listContact = new List<Contact>();
        for(Integer i = 0; i <200; i++) {
            Contact cnt = new Contact();
            cnt.lastName = 'UI Test '+i;
            if (i<100) {
                cnt.AccountId =a1.id;
            }else if (i<200) {
                cnt.AccountId =a2.id;
            }

            listContact.add(cnt);
        }
        insert listContact;

        for (Account eachAccount : listAcc) {
            eachAccount.VIP__c = true ;
            eachAccount.Description='updated description';
        }
        update listAcc;

        List<Contact> contacts =[SELECT id, vip__c, lastName FROM Contact];
        for (Contact eachContact : contacts) {
            System.assertEquals(true, eachContact.vip__c);  
        }
    }

}