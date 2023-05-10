public with sharing class AccountsQueueableExample implements Queueable {
    List<Account> listAcc= new List<Account>();
    public AccountsQueueableExample(List<Account> accs) {
        this.listAcc = accs;
    }
    public void execute (QueueableContext context) {
        for (Account account : listAcc) {
            account.Name=account.Name +' --RS';
        }
        update listAcc;
    }
}