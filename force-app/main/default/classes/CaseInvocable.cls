public with sharing class CaseInvocable {
  @InvocableMethod(
    label='Send Email & Save Actvity'
    description='Sends an email and saves the same as activity'
    category='Case'
  )
  public static void sendEmail(List<FlowInput> inputs) {
    List<Messaging.singleEmailMessage> messages = new List<Messaging.singleEmailMessage>(); // this is a collection of messages
    for (FlowInput input : inputs) {
      Messaging.singleEmailMessage message = new Messaging.singleEmailMessage();
      message.setSubject('Case Created: ' + input.caseNumber);
      message.setPlainTextBody(
        'Hello there, \n' +
          'A case has been created your querry . you can quote the case number when you call next time! \n\n' +
          'Thanks \n' +
          'Ridvan'
      );
      message.setTargetObjectId(input.contactId);
    //   message.setWhatId(input.contactId);
      message.setSaveAsActivity(true);
      messages.add(message);
    }
    Messaging.sendEmail(messages);
  }

  //this is a wrapper class
  public class FlowInput {
    @InvocableVariable(
      label='Case Number'
      description='Case Number'
      required=true
    )
    public String caseNumber; //this is a invocable variable

    @InvocableVariable(
      label='Contact ID'
      description='Contact ID'
      required=true
    )
    public Id contactId;
  }
}
