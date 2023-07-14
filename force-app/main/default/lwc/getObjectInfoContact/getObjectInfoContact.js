import CONTACT_OBJECT from "@salesforce/schema/Contact";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { LightningElement, wire } from "lwc";

export default class GetObjectInfoContact extends LightningElement {
  customerRtId;
  vendorRtId;
  @wire(getObjectInfo, { objectApiName: CONTACT_OBJECT })
  objectInfoHandler({ data, error }) {
    if (data) {
      console.log("Contact object info:", data);
      this.customerRtId = data.defaultRecordTypeId;
      const recordTypeIds = data.recordTypeInfos;
      this.vendorRtId = Object.keys(recordTypeIds).find(
        (id) => recordTypeIds[id].name === "Vendor Contact"
      );
    }
    if (error) {
      console.log("error: " + error);
    }
  }
}
