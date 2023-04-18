public  class insertRelatedRecordDemo {
   public static void insertRelated() {
    
    SalesForce_Project__c prj = [SELECT id,name from Salesforce_Project__c ORDER BY CreatedDate DESC LIMIT 1];

    SalesForce_Ticket__c tckt =new SalesForce_Ticket__c();

    tckt.Subject__c = 'Learn DML in apex';
    tckt.Priority__c ='High';
    tckt.Status__c = 'New';
    tckt.Requested_by_date__c = date.newInstance(2023, 03, 04);
    tckt.SalesForce_Project__c = prj.id;

    insert tckt;

    System.debug('new ticket is ' + tckt);
   }

   public static void multipleRecordInsert() {
    List<Account> listAcc = new List<Account>();

    Account acc1 = new Account();
    acc1.name = 'bulk acc 1';
    listAcc.add(acc1);

    Account acc2 = new Account();
    acc2.name = 'bulk acc2 ';
    listAcc.add(acc2);

    Account acc3 = new Account();
    acc3.name = 'bulk acc3 ';
    listAcc.add(acc3);


    insert listAcc;
   }

   public static void multipleRecordInsertWithLoop() {
    List<Account> listAcc = new List<Account>();
    
    for (integer i = 1; i < 15 ; i++) {
       Account acc = new Account();
       acc.name = 'Drejan'+ i;
       acc.AccountNumber='ACDR' + i;
       acc.Active__c='Yes';
      listAcc.add(acc);
    }
   
    System.debug('size of listAcc = ' + listAcc.size());

    if(!listAcc.isEmpty()) insert listAcc;
   }

   public static void multipleRecordUpdate() {
    // add all accounts which we want to update in this list
    List<Account> updateAccounts = new List<Account>();
    // fetch all the account 
    List<Account> lisAcc = [SELECT id,name from Account LIMIT 2];

    // use forEach loop to update multiple account
    for(Account eachAccount : lisAcc){
        eachAccount.name = eachAccount.name + ' v.2';
        updateAccounts.add(eachAccount);
    }
    //check if the list is not empty
    if (!updateAccounts.isEmpty()) {
        update updateAccounts;
    }else {
        System.debug('No Accounts to update');
    }

   }
}
