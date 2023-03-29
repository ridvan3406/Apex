trigger AccountTrigger on Account (before insert,after insert) {

    System.debug('=====trigger start=====');
    // this should print only before
    if (Trigger.isBefore) {
        System.debug('before insert trigger called');
    }
   
    // this should print only after
    if (trigger.isAfter) {
        System.debug('after insert trigger called');
    }

    System.debug('=====trigger ends=====');
   
}

