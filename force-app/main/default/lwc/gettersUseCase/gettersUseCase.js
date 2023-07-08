import { LightningElement } from "lwc";

export default class GettersUseCase extends LightningElement {
  fruits = ["apple", "orange", "cherry", "banana"];
  num1 = 30;
  num2 = 35;
  value;

  get options() {
    return [
      { label: "New", value: "new" },
      { label: "In Progress", value: "In Progress" },
      { label: "Finished", value: "finished" },
    ];
  }
  handleChange(event) {
    this.value = event.detail.value;
    console.log(event);
  }

  get firstFruit() {
    return this.fruits[1];
  }
  get sum() {
    return this.num1 + this.num2;
  }
}
