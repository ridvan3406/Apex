import { LightningElement } from "lwc";
import OPPORTUNITY_OBJECT from "@salesforce/schema/Opportunity";
import NAME_FIELD from "@salesforce/schema/Opportunity.Name";
import TYPE_FIELD from "@salesforce/schema/Opportunity.Type";
import STAGE_FIELD from "@salesforce/schema/Opportunity.StageName";
import ACCOUNT_FIELD from "@salesforce/schema/Opportunity.AccountId";
import CLOSEDATE_FIELD from "@salesforce/schema/Opportunity.CloseDate";
import AMOUNT_FIELD from "@salesforce/schema/Opportunity.Amount";



export default class LightningRecordViewFormOpp extends LightningElement {
  recordId = "0068d00000ByKXvAAN";
  objectName = OPPORTUNITY_OBJECT;
  fields = {
    name: NAME_FIELD,
    type: TYPE_FIELD,
    stage: STAGE_FIELD,
    account: ACCOUNT_FIELD,
    closeDate: CLOSEDATE_FIELD,
    amount:AMOUNT_FIELD
  };
}
