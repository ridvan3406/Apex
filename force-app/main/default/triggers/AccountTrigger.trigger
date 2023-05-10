trigger AccountTrigger on Account (before insert,before update,after insert,after update) {

if (trigger.isBefore) {
    System.debug('before insert/update trigger on Account object');
    AccountTriggerHandler.updateAccountDescription(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
}
if (trigger.isAfter && trigger.isUpdate) {
    AccountTriggerHandler.updateVIPForAllContacts(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
}

if (trigger.isAfter && trigger.isInsert) {
    // AccountsQueueableExample aqe = new AccountsQueueableExample (trigger.New);
    // Id jobId = system.enqueueJob(aqe);
    // System.debug('job id is  = ' + jobId );
}


//     System.debug('========TRIGGER STARTS============');
  

//     if (trigger.isUpdate && trigger.isAfter) {
//         integer countWebsiteUpdated = 0;
//         map<id,account> triggerOldMap = trigger.oldMap;
//         map<id,account> triggerNewMap = trigger.newMap;

//         set<id> accountIDSet = triggerNewMap.keySet();// this give us id

//         for (ID eachID:accountIDSet) {
//            account newAccount = triggerNewMap.get(eachID);// this give us value
//            string newWebsite=newAccount.WebSite;
//            account oldAccount = triggerOldMap.get(eachID);
//            string oldWebsite=oldAccount.WebSite;
//         // following code check if the website has changed
//            if (newWebsite!=oldWebsite) {
//             System.debug('Acc name :  ' +newAccount.Name + ' website is change from '+oldWebsite+ ' to: '+newWebsite);
//             countWebsiteUpdated++;
//            }

//         System.debug('count of website updated : ' +countWebsiteUpdated);

//         }
//     }

// System.debug('========TRIGGER ENDS============');

    // System.debug('========TRIGGER STARTS============');
  

    //     if (trigger.isUpdate && trigger.isAfter) {
    //         System.debug('AFTER UPDATE trigger of Account ');
    //         map<id,account> accOldMap= trigger.oldMap;
    //         map<id,account> accNewMap= trigger.newMap;
    //         // for loop on SET<id> --> keySet for a map
    //         for (ID eachID:accNewMap.keySet()) {
    //             System.debug('acc id = ' + eachID);

    //             //get value using .get(key) method
    //             Account newAccount= accNewMap.get(eachID);
    //             System.debug('new account name= ' + newAccount.name);
    //             Account oldAccount= accOldMap.get(eachID);
    //             System.debug('old account name= ' + oldAccount.name);
    //         }
    //     }

    // System.debug('========TRIGGER ENDS============');





    //newMap and oldMap
    // System.debug('========TRIGGER STARTS============');
    // map<id,account> trgOldMap= trigger.oldMap;
    // map<id,account> trgNewMap= trigger.newMap;

    //     if (trigger.isInsert && trigger.isBefore) {
    //         System.debug('BEFORE INSERT ');
    //         System.debug('Old Map ' + trgOldMap);
    //         System.debug('New Map ' + trgNewMap);
            
    //     }
    //     if (trigger.isInsert && trigger.isAfter) {
    //         System.debug('AFTER INSERT ');
    //         System.debug('Old Map ' + trgOldMap);
    //         System.debug('New Map ' + trgNewMap);
    //     }
    //       // UPDATE
    //     if (trigger.isUpdate && trigger.isBefore) {
    //         System.debug('BEFORE UPDATE ');
    //         System.debug('Old Map ' + trgOldMap);
    //         System.debug('New Map ' + trgNewMap);
    //     }
    //     if (trigger.isUpdate && trigger.isAfter) {
    //         System.debug('AFTER UPDATE ');
    //         System.debug('Old Map ' + trgOldMap);
    //         System.debug('New Map ' + trgNewMap);
    //     }

    // System.debug('========TRIGGER ENDS============');









// how get updated id 
    // if (trigger.isAfter) {
    //     System.debug('after trigger of account object');
    //     List<Account> newAccounts = trigger.new;
    //     System.debug('size of trigger.new after trigger '+ trigger.new.size());
    //     Set<ID> accIDSet = new Set<ID>();
    //     for (Account acc:newAccounts) {
    //         System.debug('new account id : '+ acc.id + 'new Account name : '+ acc.name);
    //         accIDSet.add(acc.id);
    //     }
    //     System.debug('set of updated acc ids  '+ accIDSet);
    // }


//Difference betwwen OLD and NEW
// if (trigger.isAfter && trigger.isUpdate) {
//     List<Account> oldAccounts = trigger.old;
//     List<Account> newAccounts = trigger.new;

//     for (Account oldAccs : oldAccounts){
//         System.debug('old Account id : ' + oldAccs.id + ' old account name: '+ oldAccs.name);
//     }
    
//     for(Account newAccs : newAccounts) {
//         System.debug('new Account id : ' + newAccs.id + ' old account name: '+ newAccs.name);
//     }
// }

//TRIGGER NEW
    // if (trigger.isAfter && trigger.isInsert) {
    //     System.debug('trigger.new after insert = ' + trigger.new);

    //     List<account> newAccounts = trigger.new;
    //     System.debug('total acount inserted = ' + newAccounts.size());

    //     for (Account eachAccount : newAccounts){
    //         System.debug('account id = ' + eachAccount.id + 'account name = ' + eachAccount.name);
    //     }
    // }


//Trigger.old example
    // if (trigger.isBefore) {
    //     System.debug('BEFORE Trigger');
    //     if (trigger.isInsert) {
    //         System.debug('before insert trigger trigger.new'  + trigger.new);
    //         System.debug('before insert trigger trigger.old'  + trigger.old);
    //     }
    //     if (trigger.isUpdate) {
    //         System.debug('before update trigger trigger.new'  + trigger.new);
    //         System.debug('before insert trigger trigger.old'  + trigger.old);
    //     }
    // }
    // if (trigger.isAfter) {
    //     System.debug('AFTER Trigger');
    //     if (trigger.isInsert) {
    //         System.debug('after insert trigger trigger.new'  + trigger.new);
    //         System.debug('before insert trigger trigger.old'  + trigger.old);
    //     }
    //     if (trigger.isUpdate) {
    //         System.debug('before update trigger trigger.new'  + trigger.new);
    //         System.debug('before insert trigger trigger.old'  + trigger.old);
    //     }
    // }









    // System.debug('=====trigger start=====');
    // List<Account> newAccounts = trigger.new;

    // if (trigger.isAfter) {
    //     System.debug('after trigger trigger new = ' + newAccounts);
    //     System.debug('size of trigger new = ' + newAccounts.size());
    // }
    // System.debug('=====trigger ends=====');



    // // INSERT
    // if (trigger.isInsert && trigger.isBefore) {
    //     System.debug('before insert trigger called ');
    // }
    // if (trigger.isInsert && trigger.isAfter) {
    // System.debug('after insert trigger called ');
    // }
    //   // UPDATE
    // if (trigger.isUpdate && trigger.isBefore) {
    //     System.debug('before update trigger called ');
    // }
    // if (trigger.isUpdate && trigger.isAfter) {
    // System.debug('after update trigger called ');
    // }
    // System.debug('=====trigger ends=====');

    // this should print only before
    // if (Trigger.isBefore) {
    //     System.debug('before insert trigger called');
    // }
   
    // this should print only after
    // if (trigger.isAfter) {
    //     System.debug('after insert trigger called');
    // }
   
}

