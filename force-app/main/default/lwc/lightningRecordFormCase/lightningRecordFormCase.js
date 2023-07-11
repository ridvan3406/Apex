import { LightningElement } from "lwc";
import CASE_OBJECT from "@salesforce/schema/Case";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

import ACCOUNT_FIELD from "@salesforce/schema/Case.AccountId";
import CONTACT_FIELD from "@salesforce/schema/Case.ContactId";
import DESCRIPTION_FIELD from "@salesforce/schema/Case.Description";
import PRIORITY_FIELD from "@salesforce/schema/Case.Priority";
import ORIGIN_FIELD from "@salesforce/schema/Case.Status";
import SUBJECT_FIELD from "@salesforce/schema/Case.Subject";

export default class LightningRecordFormCase extends LightningElement {
  recordId = "5008d00000I8cKcAAJ";
  objectName = CASE_OBJECT;
  layoutType = "Compact";
  fields = [
    ACCOUNT_FIELD,
    CONTACT_FIELD,
    DESCRIPTION_FIELD,
    PRIORITY_FIELD,
    ORIGIN_FIELD,
    SUBJECT_FIELD
  ];

  successHandler() {
    const event = new ShowToastEvent({
      title: "Success!!!",
      message: "The Case has been saved successfully",
      variant: "success",
    });
    this.dispatchEvent(event);
  }
}
