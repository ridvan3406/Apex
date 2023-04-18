public class DMLDemo {
    public static void insert_standartObject() {
        Account acc= new Account();

        acc.Name ='Airpod';
        acc.Industry='Technology';
        acc.Phone='98237498';

        insert acc;
      

        System.debug(acc);
    }

    public static void insert_customObject(){
        Salesforce_project__c sp = new Salesforce_project__c();
        sp.project_name__c='Teach DML';
        sp.description__c='Data manipulation Language';
        insert sp;
    }
}

