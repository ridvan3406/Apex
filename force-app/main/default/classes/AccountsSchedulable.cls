public with sharing class AccountsSchedulable implements Schedulable{
    public void execute(SchedulableContext sc) {
        AccountsBatch ab = new AccountsBatch();

        ID batchId = Database.executeBatch(ab,20);
    }
}