import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import { LightningElement, wire } from "lwc";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import getAccountsByIndustry from "@salesforce/apex/AccountCtrl.getAccountsByIndustry";

export default class ImperativeApex3 extends LightningElement {
  accountRtId;
  error;
  industryOptions = [];
  selectedIndustry;
  @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
  objectInfoHandler({ data, error }) {
    if (data) {
      this.accountRtId = data.defaultRecordTypeId;
    }
    if (error) {
      this.error = error;
    }
  }
  @wire(getPicklistValues, {
    fieldApiName: INDUSTRY_FIELD,
    recordTypeId: "$accountRtId",
  })
  picklistHandler({ data, error }) {
    if (data) {
      this.industryOptions = data.values;
    }
    if (error) {
      this.error = error;
    }
  }
  @wire(getAccountsByIndustry, { industry: "$selectedIndustry" })
  accountsByIndustry;

  changeHandler(event) {
    this.selectedIndustry = event.detail.value;
  }
}
