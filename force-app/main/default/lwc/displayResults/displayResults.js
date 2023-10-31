import { LightningElement, api } from 'lwc';

export default class DisplayResults extends LightningElement {
   @api result;
   @api columns;
   @api error;

}