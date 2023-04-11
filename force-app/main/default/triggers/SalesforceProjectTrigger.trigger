trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert,after insert,before update,after update) {
    if (trigger.isAfter && trigger.isInsert) {
        // call handler method here
        SalesforceProjectTriggerHandler.createDefultSalesforceTicket(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (trigger.isBefore && trigger.isUpdate) {
        SalesforceProjectTriggerHandler.validateProjectCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}