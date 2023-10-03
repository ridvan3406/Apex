import { LightningElement, wire } from "lwc";
import getAccountsByIndustry from "@salesforce/apex/AccountCtrl.getAccountsByIndustry";
const COLUMNS = [
  { label: "Account Name", fieldName: "Name", type: "text" },
  { label: "Account Type", fieldName: "Type", type: "text" },
  { label: "Industry", fieldName: "Industry", type: "text" },
  { label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency" },
];

export default class WiredApex2 extends LightningElement {
  accounts;
  industryType = "Energy";
  columns = COLUMNS;

  @wire(getAccountsByIndustry, { industry: "$industryType" })
  recordHandler({ data, error }) {
    if (data) {
      this.accounts = data;
    }
    if (error) {
      console.error(error);
    }
  }
  get total() {
    return this.accounts ? this.accounts.length : 0;
  }
}
