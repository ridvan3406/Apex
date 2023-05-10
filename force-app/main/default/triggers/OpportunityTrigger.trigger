trigger OpportunityTrigger on Opportunity (before insert,after insert ,before update, after update,before delete, after delete,after undelete) {
    Set<Id> accIds = new Set<Id>();
    if (trigger.isInsert && trigger.isAfter) {
        for (Opportunity opp : trigger.New) {
            system.debug('======opportunity account id====='+opp.AccountId);
            if (opp.AccountId != null) {
                accIds.add(opp.AccountId);
            }
        }
    }
    if(trigger.isUpdate && trigger.isAfter) {
        //check if account  field is Changed
        //check old and new values
        for (Opportunity opp : trigger.new) {
            //we chec the opportunity account s here. if opportubuty account change we replace the biggest opportunity name  with another one.
            Id oldAccountId = trigger.OldMap.get(opp.Id).AccountId;
            if (opp.AccountId != oldAccountId) {
                if (opp.AccountId != null) {
                    accIds.add(opp.AccountId);
                }
                if (oldAccountId != null) {
                    accIds.add(oldAccountId);
                }
            }
            // we will update the field when the opportunity amount change.
            Decimal oldAmount = trigger.OldMap.get(opp.Id).Amount;
            if (opp.Amount != oldAmount) {
                if (opp.AccountId != null) {
                    accIds.add(opp.AccountId);
                }
            }
            //we will checek the opportunity stage. if the opportunity stage change and equal to 'closed won' 
            //then we will display the highest amount opportunity name  in Target Amount Achieved Opportunity Name field.
            String oldStage = trigger.OldMap.get(opp.Id).StageName;
            if (opp.StageName != oldStage) {
                if (opp.AccountId != null) {
                    accIds.add(opp.AccountId);
                }
            }
        }
    }
    //we will delete the opportunity from the account then automatically new opp will be replaceted in hghhest aoop amount field.
    if (trigger.isAfter && trigger.isUndelete) {
        for (Opportunity opp : trigger.New) {
            if (opp.AccountId != null) {
                accIds.add(opp.AccountId);
            }
        }
    }
    if (trigger.isAfter && trigger.isDelete ) {
        for (Opportunity opp : trigger.old) {
            if (opp.AccountId != null) {
                accIds.add(opp.AccountId);
            }
        }
    }
    

   

    if (!accIds.isEmpty()) {
        System.debug('=======accIds===========' + accIds);
        OpportunityTriggerHandler.updateHighestOppName(accIds);
        OpportunityTriggerHandler.updateHighestTargetOppName(accIds);
        //OpportunityTriggerHandler.updateTotalAmountGenerated(accIds);
    }
}