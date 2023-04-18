@isTest
public with sharing class childToParentSOQLTest {
    @TestSetup
    static void makeData(){
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

        List<Contact> listContact = new List<Contact>();
        for (Integer i = 0; i < 300; i++) {
            Contact c = new Contact();
            c.LastName='Test SOQL';
            if(i<100){
                c.AccountId = a.Id;
            }else if(i<200){
                c.AccountId =a1.Id;
            }else{
                c.AccountId =a2.Id;
            }
            listContact.add(c);
        }
        insert listContact;

        List<Opportunity> listOpportunity = new List<Opportunity>();
        for (Integer i = 0; i < 300; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'Test opp' + i;
            opp.StageName = 'Closed Won';
            opp.CloseDate = date.today();
            if (i<100) {
                opp.AccountId = a.Id;
            }else if (i<200) {
                opp.AccountId =a1.Id;
            }else {
                opp.AccountId =a2.Id;
            }
            listOpportunity.add(opp);
        }
         insert listOpportunity;
    }

    @IsTest
    static void testChildToParentSOQL_1() {
        Test.startTest();
            childToParentSOQL.childToParentSOQL_1();
        Test.stopTest();
    }

    @IsTest
    static void testMethod2() {
        Test.startTest();
            childToParentSOQL.sampleSOQL();
        Test.stopTest();
    }
}

