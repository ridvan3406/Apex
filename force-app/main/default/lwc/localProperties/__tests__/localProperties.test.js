//import { LightningElement, createElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

// Your LWC component class
export default class localProperties extends LightningElement {
    // Example usage of createElement
    handleClick() {
        const dynamicElement = createElement('p', {
            innerHTML: 'Dynamic element created using LWC createElement',
        });
        this.appendChild(dynamicElement);
    }

    // Example usage of ShowToastEvent
    showToast() {
        const event = new ShowToastEvent({
            title: 'Success',
            message: 'Toast message',
            variant: 'success',
        });
        this.dispatchEvent(event);
    }
}
