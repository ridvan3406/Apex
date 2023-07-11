// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Salesforce_Ticket__ChangeEvent {
    global Id Id;
    global String ReplayId;
    global Object ChangeEventHeader;
    global String Name;
    global RecordType RecordType;
    global Id RecordTypeId;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Salesforce_Project__c Salesforce_Project__c;
    global String Admin_Notes__c;
    global Date Completed_Date__c;
    global String Description__c;
    global String Priority__c;
    global Date Requested_by_date__c;
    global User Requester__c;
    global String Status__c;
    global String Subject__c;
    global String Email_of_requester__c;

    global Salesforce_Ticket__ChangeEvent () 
    {
    }
}