public class ContactTrigger2Handler {
    public static void updateAccount(List<Contact> contactTriggerNew,List<Contact> contactTriggerOld ,Map<Id,Contact> contactTriggerOldMap,Map<Id,Contact> contactTriggerNewMap) {
        //set of ids
        Set<Id> accIdSet = new Set<Id>();

        //fro each account check if main contact person is changed to true or false
        for(Contact eachNewContact : contactTriggerNew){
            Contact oldContact = contactTriggerOldMap.get(eachNewContact.id);
            System.debug('===== old contact = ' + oldContact);
            if (eachNewContact.AccountId != null && eachNewContact.Main_Contact_Person__c != oldContact.Main_Contact_Person__c && eachNewContact.Main_Contact_Person__c== true){
                System.debug('====== add account id to set '+ eachNewContact.AccountId);
                accIdSet.add(eachNewContact.AccountId);
            }

        }
        if (!accIdSet.isEmpty()) {
            updateAccountFax(accIdSet);
        }
    }
    public static void updateAccountFax(Set<Id> accIdsSet){
        List<Account> accountWithContacts = [SELECT id,fax,(SELECT fax FROM Contacts where Main_Contact_Person__c= true ORDER BY lastModifiedDate desc ) from Account WHERE id in:accIdsSet];
        System.debug('*** account with contacts = ' + accountWithContacts);
        for(Account eachAccount : accountWithContacts){
            List<Contact> contacts = eachAccount.contacts;
            if (!contacts.isEmpty()) {
                System.debug('contacts = ' + contacts);
                eachAccount.Fax = contacts[0].fax;
            }
        }
        update accountWithContacts;   
    }
}