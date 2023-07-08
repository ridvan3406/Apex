import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    showData=true;
    details={
        fullName :"Ridvan",
        place:"london"
    }

    clickHandler(){
        this.showData=!this.showData;
    }
}