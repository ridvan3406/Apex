import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { LightningElement, wire } from "lwc";

import ACCOUNT_OBJECT from "@salesforce/schema/Account";

export default class GetObjectInfoAccount extends LightningElement {
    defaultRTId;
    active;
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })

  objectInfoHandler({ data, error }) {
    if (data) {
      // Handle successful data retrieval
      console.log("Object Info:", data);
      this.defaultRTId= data.defaultRecordTypeId;
      this.active= data.fields.Active__c.apiName;
    }
    if (error) {
      // Handle error
      console.error("Error retrieving Object Info:", error);
    }
  }
}
