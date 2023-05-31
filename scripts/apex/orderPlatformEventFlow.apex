Order_Event__e evt = new Order_Event__e();
evt.Order_Number__c = '001234';
evt.Has_Shipped__c = true;

EventBus.publish(evt);