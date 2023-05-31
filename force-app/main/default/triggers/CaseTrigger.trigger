trigger CaseTrigger on Case (before insert) {
    System.debug('before insert case trigger called');
    // System.debug('trigger size is  :  ' + trigger.size());
}