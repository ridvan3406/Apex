 trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert,after insert,before update,after update) {
    if (trigger.isAfter && trigger.isInsert) {
        // call handler method here
        Map<Id,salesforce_project__c> spNewMap = trigger.newMap;
        Set<Id> setID = spNewMap.keySet();
        SalesforceProjectTriggerHandler.updateProjectDescription(setID);
        SalesforceProjectTriggerHandler.createDefultSalesforceTicket(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (trigger.isBefore && trigger.isUpdate) {
//SalesforceProjectTriggerHandler.validateProjectCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if(trigger.isAfter && trigger.isUpdate) {
        SalesforceProjectTriggerHandler.spCompletedStatus(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

   
}