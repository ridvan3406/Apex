@isTest
public with sharing class SPTriggerHandlerTest {
    @isTest
    public static void testMethod1() {
        Salesforce_project__c sp = new Salesforce_project__c();
        sp.project_name__c='Teach DML';
        sp.description__c='Data manipulation Language';
        test.startTest();
        insert sp;
        test.stopTest();

        List<Salesforce_project__c> listSp =[SELECT id,description__c from salesforce_project__c];
        System.assert(listSp[0].description__c.containsIgnoreCase('future'));
    }
    
}