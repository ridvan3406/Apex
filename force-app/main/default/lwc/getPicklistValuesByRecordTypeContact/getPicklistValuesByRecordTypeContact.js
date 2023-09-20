import CONTACT_OBJECT from "@salesforce/schema/Contact";
import {
  getObjectInfo,
  getPicklistValuesByRecordType,
} from "lightning/uiObjectInfoApi";
import { LightningElement, wire } from "lwc";

export default class GetPicklistValuesByRecordTypeContact extends LightningElement {
  vendorRtId;
  customerRtId;
  customerPriorityOptions = [];
  statusOptions = [];
  leadSource = [];

  @wire(getObjectInfo, { objectApiName: CONTACT_OBJECT })
  objectInfoHandler({ data, error }) {
    if (data) {
      console.log("data", data);
      this.customerRtId = data.defaultRecordTypeId;
      const recordTypeIds = data.recordTypeInfos;
      this.vendorRtId = Object.keys(recordTypeIds).find(
        (id) => recordTypeIds[id].name === "Vendor Contact"
      );
    }
    if (error) {
      console.log("error: ", error);
    }
  }

  @wire(getPicklistValuesByRecordType, {
    objectApiName: CONTACT_OBJECT,
    recordTypeId: "$vendorRtId",
  })
  picklistHandler({ data, error }) {
    if (data) {
      console.log("vendor contact data", data);
      this.customerPriorityOptions =data.picklistFieldValues.Customer_Priority__c.values;
      this.statusOptions =data.picklistFieldValues.Status__c.values;
      this.leadSource =data.picklistFieldValues.LeadSource.values;
    }
    if (error) {
      console.log("error", error);
    }
  }
}
