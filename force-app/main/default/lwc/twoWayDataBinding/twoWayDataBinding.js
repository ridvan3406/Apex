import { LightningElement } from "lwc";

export default class TwoWayDataBinding extends LightningElement {
  name = "";

  handleChange(event) {
    this.name = event.target.value;
    console.log(this.name);
  }

  handleClick() {
    console.log("Button clicked");
    console.log("Submitted name:", this.name);
  }
}
