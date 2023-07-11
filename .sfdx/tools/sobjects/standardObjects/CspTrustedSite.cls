// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class CspTrustedSite {
    global Id Id;
    global Boolean IsDeleted;
    global String DeveloperName;
    global String Language;
    global String MasterLabel;
    global String NamespacePrefix;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime SystemModstamp;
    global String EndpointUrl;
    global String Description;
    global Boolean IsActive;
    global String Context;
    /* Allow Lightning components to load URLs using script interfaces from this site.
    */
    global Boolean IsApplicableToConnectSrc;
    /* Allow Lightning components to load resources contained in <iframe> elements from this site.
    */
    global Boolean IsApplicableToFrameSrc;
    /* Allow Lightning components to load images from this site.
    */
    global Boolean IsApplicableToImgSrc;
    /* Allow Lightning components to load stylesheets from this site.
    */
    global Boolean IsApplicableToStyleSrc;
    /* Allow Lightning components to load fonts from this site.
    */
    global Boolean IsApplicableToFontSrc;
    /* Allow Lightning components to load audio and video from this site.
    */
    global Boolean IsApplicableToMediaSrc;

    global CspTrustedSite () 
    {
    }
}