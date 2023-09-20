import { LightningElement, wire } from "lwc";
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";

export default class GetPicklistValuesIndustry extends LightningElement {
  accountRtId;
  industryOptions=[];

  selectedIndustry(){
    
  }

  @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
  objectInfoHandler({ data, error }) {
    if (data) {
      console.log(" data", data);
      this.accountRtId = data.defaultRecordTypeId;
    }
    if (error) {
      console.log("error", error);
    }
  }
  @wire(getPicklistValues, {
    fieldApiName: INDUSTRY_FIELD,
    recordTypeId: '$accountRtId',
  })
  picklistHandler({ data, error }) {
    if (data) {
      console.log("Industry values  data", data);
      console.log(data.values);
      this.industryOptions = data.values;
    }
    if (error) {
      console.error("error", error);
    }
  }
}
