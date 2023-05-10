trigger CaseTrigger2 on Case (after insert) {
    if (trigger.isAfter && trigger.isInsert) {
        //call handler method here
        CaseTrigger2Handler.createChildCase(trigger.new, trigger.newMap);
    }
}