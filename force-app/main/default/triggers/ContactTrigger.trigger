trigger ContactTrigger on Contact (before insert,before update,after insert,after update,after delete, after undelete) {

    if (Trigger.isBefore && Trigger.isUpdate) {
        //caall method here
        // ContactTriggerHandler.contactUpdateValidation1(Trigger.New,Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        // ContactTriggerHandler.contactUpdateValidation2(Trigger.New,Trigger.Old, Trigger.NewMap, Trigger.OldMap);
      
    }

    if (trigger.isAfter) {
        Set<id> accountIds = new Set<id>();
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete) {
            for(Contact eachContact : Trigger.new) {
                if (eachContact.AccountId !=null) {
                    accountIds.add(eachContact.AccountId);
                }
            }
        }
        //updated aor deleted old account id
        if(Trigger.isUpdate || Trigger.isDelete) {
            for(Contact eachContact : Trigger.old) {
                if (eachContact.AccountId !=null) {
                    accountIds.add(eachContact.AccountId);
                }
            }
        }
        //here we call handler method 
        ContactTriggerHandler.updateAccountRollUpField(accountIds);
    }

}