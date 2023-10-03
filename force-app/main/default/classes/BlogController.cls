public with sharing class BlogController {
  @AuraEnabled(cacheable=true)
  public static List<Blog__c> getAllBlogs() {
    return [
      SELECT Name, Author__c, Body__c, Topic__c, Title__c
      FROM Blog__c
      WITH SECURITY_ENFORCED
      LIMIT 10
    ];
  }
}
