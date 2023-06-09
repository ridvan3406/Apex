// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class UriEventStream {
    global String ReplayId;
    global Datetime CreatedDate;
    global String EventUuid;
    global String EventIdentifier;
    global User User;
    global Id UserId;
    global String Username;
    global Datetime EventDate;
    global String RelatedEventIdentifier;
    global String SessionKey;
    global String LoginKey;
    global String SessionLevel;
    global String SourceIp;
    global String Operation;
    global String QueriedEntities;
    global String RecordId;
    global String Name;
    global String UserType;
    global String Message;
    global String OperationStatus;
    global List<AsyncOperationEvent> SourceEvent;

    global UriEventStream () 
    {
    }
}