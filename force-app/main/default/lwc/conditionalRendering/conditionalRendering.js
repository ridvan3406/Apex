import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    showContent = true;
    dataIfTrue = "ezgi";
    dataIfFalse = "ridvan";
}