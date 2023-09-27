import getTopOpportunities from "@salesforce/apex/OpportunityController.getTopOpportunities";
import { LightningElement, wire } from "lwc";

const COLUMNS = [
  { label: "Account Name", fieldName: "Name", type: "text" },
  { label: "Account Type", fieldName: "Type", type: "text" },
  { label: "Stage", fieldName: "StageName", type: "text" },
  { label: "Amount", fieldName: "Amount", type: "currency" },
];

export default class WiredApex3 extends LightningElement {
  accounts;
  columns = COLUMNS;

  @wire(getTopOpportunities)
  recordHandler({ data, error }) {
    if (data) {
      this.accounts = data;
    }
    if (error) {
      console.error(error);
    }
  }
}
