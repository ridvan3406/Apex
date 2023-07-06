import { LightningElement } from "lwc";

export default class LocalProperties extends LightningElement {
  name; //undefined
  fullName = "ridvan";
  age = 30;
  location = {
    city: "London",
    country: "UK",
    postCode: "KT64RX",
  };
  fruits = ["apple", "orange", "grape", "mango"];
}