import { LightningElement } from 'lwc';

export default class GrandParentComponent extends LightningElement {
    showHandler1(event) {
        console.log("at Grandparent component.");
        console.log(event.target.nodename);
        console.log(event.currentTarget.nodename);
      }
}