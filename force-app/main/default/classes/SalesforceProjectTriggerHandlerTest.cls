@isTest
public with sharing class SalesforceProjectTriggerHandlerTest {
    @isTest
    public static void spTest () {
        // 1- Prepare the data
    List<salesforce_project__c> testSPs = new List<salesforce_project__c>();
        for (Integer i = 0; i < 5; i++) {
            testSPs.add(new salesforce_project__c(
                Project_Name__c = 'Test SP ' + i,
                Description__c = 'cool'
            ));
    }
    insert testSPs;
        
        
    // Call the future method
    Set<Id> setSPIds = new Set<Id>();
    for (salesforce_project__c sp : testSPs) {
        setSPIds.add(sp.Id);
    }
    Test.startTest();
    SalesforceProjectTriggerHandler.updateProjectDescription(setSPIds);
    Test.stopTest();

    // Verify the records were updated
    List<salesforce_project__c> updatedSPs = [SELECT id, description__c FROM salesforce_project__c WHERE id IN :setSPIds];
    for (salesforce_project__c sp : updatedSPs) {
        System.assert(sp.description__c.contains('This line is from future method'));
    }
    }

    @isTest
   public static void testValidateProjectCompletion() {
        // create test projects
        List<salesforce_project__c> testProjects = new List<salesforce_project__c>();
        for (Integer i = 0; i < 2; i++) {
            testProjects.add(new salesforce_project__c(
                Project_Name__c = 'Test SP ' + i,
                status__c = 'In Progress'
            ));
        }
        insert testProjects;
        
        // create test tickets for one of the projects
        salesforce_project__c projectWithTickets = testProjects[1];
        List<salesforce_ticket__c> testTickets = new List<salesforce_ticket__c>();
        for (Integer i = 0; i < 2; i++) {
            testTickets.add(new salesforce_ticket__c(
               Subject__c = 'Test Ticket ' + i,
               status__c = 'Completed',
               salesforce_project__c = projectWithTickets.Id
            ));
        }
        insert testTickets;
        
        // update the status of the project with tickets to "Completed"
        projectWithTickets.status__c = 'Completed';
        update projectWithTickets;
        
        // call the validation method
        Test.startTest();
        try {
            SalesforceProjectTriggerHandler.validateProjectCompletion(testProjects, new List<salesforce_project__c>(), new Map<Id,salesforce_project__c>{projectWithTickets.Id => projectWithTickets}, new Map<Id,salesforce_project__c>());
            System.assert(false, 'Expected an error but none was thrown');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Cannot complete project because all its ticket are not completed'));
        }
        Test.stopTest();
    }
    
}

   


