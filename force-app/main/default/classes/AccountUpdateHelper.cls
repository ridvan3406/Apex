public with sharing class AccountUpdateHelper {
    @InvocableMethod
    public static void updateAccountWebsite(List<id> accIds) {
        List<Account> accounts= [select id,name,website from Account where id in :accIds];
        
        for (account eachAccount : accounts) {
            eachAccount.Website='www.ridvan.com';
        }
        
        update accounts;
    }
}