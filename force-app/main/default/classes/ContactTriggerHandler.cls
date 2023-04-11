public class ContactTriggerHandler {

    //dont allow user to update contact if lead source is partner refferal.
   public static void contactUpdateValidation1(List<Contact> contactTriggerNew ,List<Contact> contactTriggerOld,
                                                Map<id,Contact> contactTriggerNewMap,Map<id,Contact> contactTriggerOldMap) {
    
        for (Contact eachContact : contactTriggerNew) {
            contact oldContact =contactTriggerOldMap.get(eachContact.id);
            if (oldContact.LeadSource=='Partner Referral') {
                eachContact.addError('Cannot update Partner Referral contacts'); //validation error
            }
        }
   }
   //dont allow user to update lead source
   public static void contactUpdateValidation2(List<Contact> contactTriggerNew ,List<Contact> contactTriggerOld,
                                               Map<id,Contact> contactTriggerNewMap,Map<id,Contact> contactTriggerOldMap) {

        for (Contact eachContact : contactTriggerNew) {
            contact oldContact =contactTriggerOldMap.get(eachContact.id);
            if (eachContact.LeadSource!=oldContact.LeadSource) {
            eachContact.LeadSource.addError('Lead source cannot be updated'); //validation error
            }
        }
    }
    public static void updateAccountRollUpField(set<id> accountIds) {
        // fetch all account and its related contact using inner querry
        List<account> listAccounts = [SELECT id, Number_of_contacts__c,(select id from Contacts) FROM Account where Id in :accountIds];

        for (Account eachAccount : listAccounts) {
            List <Contact> accContacts = eachAccount.contacts;

            //get the number of contact
            integer numberOfContacts=accContacts.size();

            eachAccount.number_of_contacts__c=numberOfContacts;

        }
        update listAccounts;
    }
}



