// @isTest
// public class updateRecordTest {
//    @isTest
//    public static void updateTest() {
//     // prepare the data
//         Account acc = new Account();
//         acc.Name='Airpod';
//         insert acc;
//     // call the methd
//         updateRecord.insertRelatedRecord();

//       //assert
//         List<Contact> contacts =[SELECT id,AccountId,name from Contact];

//         System.assertEquals(1, contacts.size());
//         //System.assertEquals(acc.id, contacts[0].AccountId);//checking if the contacts account is acc


//    }
// }
@IsTest
public class updateRecordTest {
    @IsTest
    static void testUpdateDML() {
        // Arrange
        Account acc = new Account(Name='GenePoint', Site='genePoint.com');
        insert acc;
        
        // Act
        updateRecord.updateDML();
        
        // Assert
        acc = [SELECT Name, Site FROM Account WHERE Id = :acc.Id];
        System.assertEquals('ridvansaman', acc.Name);
        System.assertEquals('ridvansaman.com', acc.Site);
    }
    
    @IsTest
    static void testInsertRelatedRecord() {
        // Arrange
        Account acc = new Account(Name='Airpod');
        insert acc;
        
        // Act
        updateRecord.insertRelatedRecord();
        
        // Assert
        Contact[] contacts = [SELECT LastName, AccountId FROM Contact WHERE AccountId = :acc.Id];
        System.assertEquals(1, contacts.size());
        System.assertEquals('Saman', contacts[0].LastName);
        System.assertEquals(acc.Id, contacts[0].AccountId);
    }
    
    @IsTest
    static void testInsertRelatedRecord_AccountNotFound() {
        // Act
        updateRecord.insertRelatedRecord();
        
        // Assert
        Contact[] contacts = [SELECT LastName, AccountId FROM Contact];
        System.assertEquals(0, contacts.size());
    }
}