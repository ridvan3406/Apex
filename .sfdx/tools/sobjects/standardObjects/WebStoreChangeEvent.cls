// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WebStoreChangeEvent {
    global Id Id;
    global String ReplayId;
    global Object ChangeEventHeader;
    global User Owner;
    global Id OwnerId;
    global String Name;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global String Type;
    global Boolean OptionsGuestBrowsingEnabled;
    /* You must choose Net or Gross. Choose Net if the product price doesn't include tax. Choose Gross if the product price includes tax.
    */
    global String DefaultTaxLocaleType;
    global String ExternalReference;

    global WebStoreChangeEvent () 
    {
    }
}