public class AccountTriggerHandler {
  public static void updateAccountDescription(
    List<Account> triggerNewAccounts,
    List<Account> triggerOldAccounts,
    Map<Id, Account> triggerNewAccountsMap,
    Map<Id, Account> triggerOldAccountsMap
  ) {
    for (Account eachAcc : triggerNewAccounts) {
      Boolean updateDesc = false;

      //when inserted
      // in insert oldMap is NULL so, if oldmap is null then that is an insert
      if (triggerOldAccountsMap == null && eachAcc.active__c == 'YES') {
        updateDesc = true;
      }

      //when active field updated, we will check old and new value to decide
      //if oldmap is not null then that is an update
      if (triggerOldAccountsMap != null)
        if (
          eachAcc.active__c == 'YES' &&
          triggerOldAccountsMap.get(eachAcc.Id).active__c !=
          triggerNewAccountsMap.get(eachAcc.Id).active__c
        ) {
          updateDesc = true;
        }

      if (updateDesc) {
        eachAcc.Description = 'Account is active.';
      }
    }
  }

  public static void updateVIPForAllContacts(
    List<Account> accTriggerNew,
    List<Account> accTriggerOld,
    Map<id, Account> accTriggerNewMap,
    Map<id, Account> accTriggerOldMap
  ) {
    // get set of account id where ONLY VIP checkbox is updated

    Set<id> setAccountIDs = new Set<id>();

    for (Account eachAccount : accTriggerNew) {
      // check if Vip field is updated
      if (eachAccount.vip__c != accTriggerOldMap.get(eachAccount.id).vip__c) {
        setAccountIDs.add(eachAccount.id);
      }
    }
    //Get List of Contacts for Account where VIP is updated
    List<Contact> listContacts = [
      SELECT id, name, accountId, vip__c
      FROM CONTACT
      WHERE accountId IN :setAccountIDs
    ];
    //NOW WE Want to update contact records.

    for (Contact eachContact : listContacts) {
      // fetch VIP field of account for this contact
      //if accounts vip is false , we get false , if tru , we will get true here,
      Boolean accVIP = accTriggerNewMap.get(eachContact.AccountId).VIP__c;
      eachContact.VIP__c = accVIP;
    }
    update listContacts;
  }
}
