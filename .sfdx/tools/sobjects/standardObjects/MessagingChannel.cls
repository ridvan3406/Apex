// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class MessagingChannel {
    global Id Id;
    global Boolean IsDeleted;
    global String DeveloperName;
    global String Language;
    global String MasterLabel;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime SystemModstamp;
    global String Description;
    global String MessageType;
    global String MessagingPlatformKey;
    global String IsoCountryCode;
    global Boolean IsActive;
    global String RoutingType;
    global Group TargetQueue;
    global Id TargetQueueId;
    /* The level of consent required from customers for your company to send them messages on this channel. Implicit Opt-In: By sending your company a message, the customer consents to receive messages. Explicit Opt-In: The customer must send an opt-in keyword to receive messages.
            Customers can opt out at any time. If you don’t see a particular consent level, this channel type doesn’t allow it.
        
    */
    global String ConsentType;
    /* Asks customers to opt in to receive messages on this channel. To opt in, customers can reply with an opt-in keyword. You can’t customize the prompt for other languages.
    */
    global String OptInPrompt;
    /* Double Opt-In Prompt
    */
    global String DoubleOptInPrompt;
    global Boolean IsRequireDoubleOptIn;
    /* Message sent to the customer when a customer initiates a conversation.
    */
    global String InitialResponse;
    /* Message sent to the customer when an agent accepts a chat.
    */
    global String EngagedResponse;
    /* Message sent to the customer when the agent ends the conversation.
    */
    global String ConversationEndResponse;
    global String OfflineAgentsResponse;
    global String OutsideBusinessHoursResponse;
    global BusinessHours BusinessHours;
    global Id BusinessHoursId;
    global Boolean IsRestrictedToBusinessHours;
    global String LinkingPreference;
    global Boolean IsLinkedRecordOpenedAsSubTab;
    global List<MessagingLink> MessagingLinks;
    global List<MsgChannelLanguageKeyword> MsgChannelLanguageKeywords;
    global List<Conversation> ConversationChannel;
    global List<MessagingChannelSkill> MessagingChannel;

    global MessagingChannel () 
    {
    }
}