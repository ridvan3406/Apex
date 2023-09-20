import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import { LightningElement, wire } from "lwc";
import OPPORTUNITY_OBJECT from "@salesforce/schema/Opportunity";
import STAGE_FIELD from "@salesforce/schema/Opportunity.StageName";

export default class GetPicklistValuesStage extends LightningElement {
  opportunityRtId;
  stageOptions = [];
  @wire(getObjectInfo, { objectApiName: OPPORTUNITY_OBJECT })
  objectInfoHandler({ data, error }) {
    if (data) {
      console.log("data", data);
      this.opportunityRtId = data.defaultRecordTypeId;
    }
    if (error) {
      console.log("error", error);
    }
  }
  @wire(getPicklistValues, {
    fieldApiName: STAGE_FIELD,
    recordTypeId: "$opportunityRtId",
  })
  filedInfoHandler({ data, error }) {
    if (data) {
      console.log("data", data);
      this.stageOptions = data.values;
    }
    if (error) {
      console.log("error", error);
    }
  }
}
