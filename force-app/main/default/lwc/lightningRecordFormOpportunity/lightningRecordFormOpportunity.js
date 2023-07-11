import { LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

import OPPORTUNITY_OBJECT from "@salesforce/schema/Opportunity";

import NAME_FIELD from "@salesforce/schema/Opportunity.Name";
import ACCOUNT_FIELD from "@salesforce/schema/Opportunity.AccountId";
import TYPE_FIELD from "@salesforce/schema/Opportunity.Type";
import STAGE_FIELD from "@salesforce/schema/Opportunity.StageName";
import AMOUNT_FIELD from "@salesforce/schema/Opportunity.Amount";
import CLOSEDATE_FIELD from "@salesforce/schema/Opportunity.CloseDate";

export default class LightningRecordFormOpportunity extends LightningElement {
  recordId="0068d00000ByKXvAAN";
  objectName = OPPORTUNITY_OBJECT;
  fields = [
    NAME_FIELD,
    ACCOUNT_FIELD,
    TYPE_FIELD,
    STAGE_FIELD,
    CLOSEDATE_FIELD,
    AMOUNT_FIELD,
  ];

  successHandler() {
    const event = new ShowToastEvent({
      title: "Success",
      message: "Opportunity saved successfully",
      variant: "success",
    });
    this.dispatchEvent(event);
  }
}
