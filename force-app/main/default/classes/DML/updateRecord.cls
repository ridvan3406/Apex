public class updateRecord {
    public static void updateDML() {
    //1. fetch the record using SOQL
        Account acc =[SELECT id, name,site FROM Account WHERE name='GenePoint'];
    //2. update the record using
 
        acc.Name = 'ridvansaman';
        acc.site = 'ridvansaman.com';
    //3. DML
        update acc;
        System.debug('acc = ' + acc);
    }

    public static void insertRelatedRecord() {
        //1. fetch the record using SOQL 
        Account acc =[SELECT id, name FROM Account WHERE name='Pyramid Construction Inc'];
        //2. create contact instance

        Contact contact1 = new Contact();
        contact1.LastName = 'Saman';
        contact1.AccountId =acc.name;

        //3. Dml

        insert acc;
        
    }
    
}