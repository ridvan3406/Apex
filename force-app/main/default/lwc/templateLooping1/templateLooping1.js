import { LightningElement } from "lwc";

export default class TemplateLooping1 extends LightningElement {
  fruits = ["apple", "orange", "banana", "mango", "grape"];
  postCodes = ["132", "2313", "2314", "2315", "2316"];
  contacts = [
    { firstName: "John", lastName: "kranisnky" },
    { firstName: "Jim", lastName: "Halpert" },
    { firstName: "Mike", lastName: "Scott" },
    { firstName: "Pam", lastName: "Beesly" },
  ];
}
