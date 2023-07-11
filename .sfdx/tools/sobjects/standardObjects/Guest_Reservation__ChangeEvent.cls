// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Guest_Reservation__ChangeEvent {
    global Id Id;
    global String ReplayId;
    global Object ChangeEventHeader;
    global String Name;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Hospitalities__c Hospitality__c;
    global Guest__c Guest__c;
    global String Booking_Source__c;
    global String Guest_Full_Name__c;
    global String Guest_Phone_Number__c;
    global String Guest_Email__c;
    global Double Total_Guest__c;
    global Boolean Is_booking_confirmed__c;
    global Boolean Is_Member_Discount_Applicable__c;
    global Boolean Is_Corporate_Discount_Applicable__c;
    global Datetime Reservation_Date_Time__c;
    global Double Table_Number__c;
    global Boolean Is_Visit_Completed__c;
    global Double Max_Corporate_Discount__c;
    global Date Booking_Date__c;
    global String Room_Number__c;
    global Datetime Check_in_Date_Time__c;
    global Datetime Check_out_Date_Time__c;
    global Boolean Is_Booking_Canceled__c;

    global Guest_Reservation__ChangeEvent () 
    {
    }
}