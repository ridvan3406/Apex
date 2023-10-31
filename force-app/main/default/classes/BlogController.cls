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

  // 1. get all the topic names from the blog record - apex1
  // 2. Refine them to have unique names

  @AuraEnabled(cacheable=true)
  public static List<String> getTopicNames() {
    // Step 1: Create a Set to store unique topic names
    Set<String> uniqueTopics = new Set<String>();

    // Step 2: Query all Blog records and add their topic names to the Set
    for (Blog__c blog : [SELECT Topic__c FROM Blog__c WITH SECURITY_ENFORCED]) {
      uniqueTopics.add(blog.Topic__c);
    }

    // Step 3: Convert the Set to a List and return it
    List<String> uniqueTopicNames = new List<String>(uniqueTopics);
    return uniqueTopicNames;
  }

  @AuraEnabled
  public static List<Blog__c> getBlogsByTopic(String topic) {
    return [
      SELECT Name, Topic__c, Author__c, Title__c, Body__c
      FROM Blog__c
      WHERE Topic__c = :topic
      WITH SECURITY_ENFORCED
    ];
  }
}
