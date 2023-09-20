import {
  getObjectInfo,
  getPicklistValuesByRecordType,
} from "lightning/uiObjectInfoApi";
import { LightningElement, wire } from "lwc";
import LEAD_OBJECT from "@salesforce/schema/Lead";

export default class GetPicklistValuesByRecordTypeLead extends LightningElement {
  leadRtId;
  industryOptions = [];
  statusOptions = [];
  ratingOptions = [];
  leadSourceOptions = [];
  selectedIndustry;
  selectedStatus;
  selectedRating;
  selectedLeadSource;

  @wire(getObjectInfo, { objectApiName: LEAD_OBJECT })
  objectInfoHandle({ data, error }) {
    if (data) {
      console.log("data", data);
      this.leadRtId = data.defaultRecordTypeId;
    }
    if (error) {
      console.log("error", error);
    }
  }
  @wire(getPicklistValuesByRecordType, {
    objectApiName: LEAD_OBJECT,
    recordTypeId: "$leadRtId",
  })
  picklistHandler({ data, error }) {
    if (data) {
      console.log("data", data);
      this.industryOptions = data.picklistFieldValues.Industry.values;
      this.statusOptions = data.picklistFieldValues.Status.values;
      this.ratingOptions = data.picklistFieldValues.Rating.values;
      this.leadSourceOptions = data.picklistFieldValues.LeadSource.values;
    }
    if (error) {
      console.log("error", error);
    }
  }

  changeHandler(event) {
    const { label, value } = event.target;

    const dataPropertiesMap = {
      "Select Industry": "selectedIndustry",
      "Select statusOptions": "selectedStatus",
      "Select ratingOptions": "selectedRating",
      "Select leadSourceOptions": "selectedLeadSource",
    };

    const propertyName = dataPropertiesMap[label];

    if (propertyName) {
      this[propertyName] = value;
    }
  }

  changeHandler2(event) {
    if (event.target.label === "Select Industry.") {
      this.selectedIndustry = event.target.value;
    } else if (event.target.label === "Select ratingOptions") {
      this.selectedRating = event.target.value;
    } else if (event.target.label === "Select leadSourceOptions") {
      this.selectedLeadSource = event.target.value;
    } else {
      this.selectedStatus = event.target.value;
    }
  }
}
