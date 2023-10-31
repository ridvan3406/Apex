import { LightningElement } from "lwc";

export default class QuerySelector extends LightningElement {
  cities = ["London", "Manchester", "Oxford", "Edinburgh"];

  clickHandler() {
    const h1element = this.template.querySelector("h1");
    console.log(h1element.innerText);

    h1element.style.color = "green";
    h1element.style.border = "2px solid red";
    h1element.style.background = "yellow";

    // queryselector p

    const paragraph = this.template.querySelector("p");
    paragraph.style.border = "2px solid black";
    paragraph.style.background = "green";
    paragraph.style.color = "blue";

    // querry for cities
    const divElement = this.template.querySelectorAll("div.child");
    divElement.forEach((item) => {
      console.log(item.innerText);
      item.style.color = "red";
      item.setAttribute("class", "slds-align_absolute-center");
    });
  }
}
