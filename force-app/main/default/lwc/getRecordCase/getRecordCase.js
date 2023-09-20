import { LightningElement, wire } from "lwc";

import { getRecord } from "lightning/uiRecordApi";

export default class GetRecordCase extends LightningElement {
  recordId = "5008d00000I8cKkAAJ";

  @wire(getRecord, {
    recordId: "$recordId",
    layoutTypes: ["Full"],
    modes: ["View"],
  })
  recordHandler({ data, error }) {
    if (data) {
      console.log("data", data);
    }
    if (error) {
      console.log("error", error);
    }
  }
}
