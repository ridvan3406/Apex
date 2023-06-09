public with sharing class CommonUtility {
  public static void createLog(
    string targetName,
    String targetType,
    String stackTrace,
    String logType,
    String exceptionType,
    String exceptionMessage,
    String errorRecords
  ) {
    Application_Log__c log = new Application_Log__c();
    log.Target_Name__c = targetName;
    log.Target_Type__c = targetType;
    log.Stack_Trace__c = stackTrace;
    log.Log_Type__c = logType;
    log.Exception_Type__c = exceptionType;
    log.Exception_Message__c = exceptionMessage;
    log.Error_Records__c = errorRecords;
    insert log;
  }
}
