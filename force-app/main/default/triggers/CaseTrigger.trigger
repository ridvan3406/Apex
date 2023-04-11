trigger CaseTrigger on Case (before insert,before update) {
    System.debug('before insert case trigger called');
    if (trigger.isInsert) {
        System.debug('before insert case ');
        System.debug(' trigger size is : ' + trigger.size);
    }
    if (trigger.isUpdate) {
        System.debug('before update case trigger called ');
        System.debug(' trigger size is : ' + trigger.size);
        CaseTriggerHandler.countRecordUpdated += trigger.size();
        CaseTriggerHandler.countTriggerExecution++;
        System.debug(' number of times trigger executed : ' + TriggerHandler.countTriggerExecution);
        System.debug(' total record updated : ' + TriggerHandler.countRecordUpdated);
    }

}