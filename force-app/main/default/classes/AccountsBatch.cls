public with sharing class AccountsBatch implements Database.Batchable<SObject>, Database.stateful {
  public Database.QueryLocator start(Database.BatchableContext BC) {
    System.debug('INSIDE START');
    Database.QueryLocator ql = Database.getQueryLocator(
      [SELECT id, description, active__c FROM account]
    );
    return ql;
  }
  Integer numberOfUpdatedAcc = 0;
  public void execute(Database.BatchableContext BC, List<Account> scope) {
    System.debug('INSIDE EXECUTE');
    System.debug('numberOfUpdatedAcc ' + numberOfUpdatedAcc);
    System.debug('size of scope' + scope.size());
    List<Account> updateAccounts = new List<Account>();
    for (Account account : scope) {
      if (account.Active__c != 'Yes') {
        account.Description = '...updated via BATCH';
        updateAccounts.add(account);
        numberOfUpdatedAcc++;
      }
    }
    System.debug(
      '=====numberOfUpdatedAcc  at the end of execute method  =' +
      numberOfUpdatedAcc
    );
    update updateAccounts;
  }

  public void finish(Database.BatchableContext BC) {
    System.debug('INSIDE FINISH');
    System.debug('Batch is now finished.All chunks are executed');
    System.debug(
      '=====numberOfUpdatedAcc  at the end of finish method' +
      numberOfUpdatedAcc
    );
  }
}
