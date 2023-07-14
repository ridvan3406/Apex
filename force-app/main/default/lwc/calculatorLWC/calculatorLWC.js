import { LightningElement, track } from "lwc";

export default class CalculatorLWC extends LightningElement {
  @track num1 = '';
  @track num2 = '';
  @track result = '';

  handleChange(event) {
    const { name, value } = event.target;
    this[name] = value;
    console.log(event);
  }

  handleTotal() {
    const parsedNum1 = parseFloat(this.num1);
    const parsedNum2 = parseFloat(this.num2);
    this.result = isNaN(parsedNum1) || isNaN(parsedNum2) ? '' : parsedNum1 + parsedNum2;
  }

  handleDifference() {
    const parsedNum1 = parseFloat(this.num1);
    const parsedNum2 = parseFloat(this.num2);
    this.result = isNaN(parsedNum1) || isNaN(parsedNum2) ? '' : parsedNum1 - parsedNum2;
  }

  handleProduct() {
    const parsedNum1 = parseFloat(this.num1);
    const parsedNum2 = parseFloat(this.num2);
    this.result = isNaN(parsedNum1) || isNaN(parsedNum2) ? '' : parsedNum1 * parsedNum2;
  }

  handleQuotient() {
    const parsedNum1 = parseFloat(this.num1);
    const parsedNum2 = parseFloat(this.num2);
    if (isNaN(parsedNum1) || isNaN(parsedNum2) || parsedNum2 === 0) {
      this.result = '';
    } else {
      this.result = parsedNum1 / parsedNum2;
    }
  }
}
