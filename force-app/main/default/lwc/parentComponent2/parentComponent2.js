import { LightningElement } from "lwc";

export default class ParentComponent2 extends LightningElement {
  showHandler1(event) {
    console.log("at parent component showhandler1");
    console.log(event.target.nodename);
    console.log(event.currentTarget.nodename);
  }
  showHandler2(event) {
    console.log("at parent component showhandler2");
    console.log(event.target.nodename);
    console.log(event.currentTarget.nodename);
  }
}
