
trigger ContactTrigger2 on Contact (before insert) {
    if (trigger.isAfter && trigger.isUpdate) {
        //call handler method here
        ContactTrigger2Handler.updateAccount(Trigger.New,Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}