import { LightningElement } from "lwc";

export default class TemplateLooping2 extends LightningElement {
  contacts = [
    {
      name: "John kranisnky",
      title: "Execcuitive Chairman",
      company: "Amazon",
      stay: "United States",
    },
    {
      name: "Jim Halpert",
      title: "CTO",
      company: "Dunder Mifflin",
      stay: "United States",
    },
    {
      name: "Mike Scott",
      title: "Regional manager",
      company: "Dunder Mifflin",
      stay: "United States",
    },
    {
      name: "Pam Beesly",
      title: "Receptionist",
      company: "Dunder Mifflin",
      stay: "United States",
    },
  ];
}
