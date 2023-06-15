@isTest
public with sharing class DMLDemoTest {
    @isTest
    public static void testInsertStandartobject() {
        DMLDemo.insert_standartObject();
        // how to verify  if this method is created a record or not?
        List<Account> checkAccount= [select id,name,Industry from Account];
        System.assertEquals(1,checkAccount.size());
        System.assertEquals('Airpod',checkAccount[0].name);
        System.assertEquals('Technology',checkAccount[0].Industry);
    }

    @isTest
    public static void testInsertCustomobject() {
        DMLDemo.insert_customObject();
        // how to verify  if this method is created a record or not?
        List<Salesforce_project__c> checkProject= [select id,project_name__c,description__c from Salesforce_project__c];
        System.assertEquals(1,checkProject.size());
        System.assertEquals('Teach DML',checkProject[0].project_name__c);
        System.assertEquals('Data manipulation Language',checkProject[0].description__c);
    }
}
