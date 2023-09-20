import { LightningElement } from "lwc";

export default class CreateRecordCase extends LightningElement {
  formData = {};
  changeHandler(event) {
    const name = event.target.name;
    const value = event.target.value;
   this.formData[name] = value;
  }
}
