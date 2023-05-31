public class insertRelated {
    public static void insertRelatedRecord() {
        //1. fetch the record using SOQL 
        Account acc =[SELECT id, name FROM Account WHERE name='green bottle' limit 1];
        //2. create contact instance

        Contact contact1 = new Contact();
        contact1.LastName = 'saman';
        contact1.AccountId = acc.id;

        //3. Dml

        insert acc;
        
    }
}