import { LightningElement, api } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
import REVENUE_FIELD from "@salesforce/schema/Account.AnnualRevenue";
import RATING_FIELD from "@salesforce/schema/Account.Rating";
import TYPE_FIELD from "@salesforce/schema/Account.Type";

export default class LightningRecordFormAccount extends LightningElement {
  // Expose a field to make it available in the template
 recordId='0018d00000PA7YSAA1'
  objectName = ACCOUNT_OBJECT;
  fields = [
    NAME_FIELD,
    INDUSTRY_FIELD,
    REVENUE_FIELD,
    RATING_FIELD,
    TYPE_FIELD,
  ];
  successHandler() {
    const event = new ShowToastEvent({
      title: "Success!!!",
      message: "The Account has been saved successfully",
      variant: "success",
    });
    this.dispatchEvent(event);
  }
}
