import { LightningElement } from "lwc";

export default class MyDetails extends LightningElement {
  name;
  role;
  nameChangeHandler(e) {
    this.name = e.target.value;
  }
  roleChangeHandler(e) {
    this.role = e.target.value;
  }

  get roleOptions() {
    return [
      {
        label: "Salesforce Developer",
        value: "Salesforce Developer",
      },
      {
        label: "Salesforce Administrator",
        value: "Salesforce Administrator",
      },
      {
        label: "Salesforce Architect",
        value: "Salesforce Architect",
      },
    ];
  }
}
