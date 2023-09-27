import { LightningElement } from "lwc";
import CONTACT_OBJECT from "@salesforce/schema/Contact";
import { createRecord } from "lightning/uiRecordApi";
import {ShowToastEvent} from "lightning/platformShowToastEvent";

export default class CreateRecordCase extends LightningElement {
  formData = {};
  //Target is to prepare an object with the data
  //formData={firstName: 'John', lastName: 'kent', email='john@example.'}}
  changeHandler(event) {
    const { name, value } = event.target;
    // const name = event.target.name;
    // const value = event.target.value;
    this.formData[name] = value;
  }
  
  saveContact() {
    const recordInput = {
      apiName: CONTACT_OBJECT.objectApiName,
      fields: this.formData,
    };

    createRecord(recordInput)
      .then((result) => {
        console.log(result);
        //show a succes message
        const successToast = new ShowToastEvent({
          title:"Success",
          message:"Contact has been saved successfully",
          variant: "success"
        });
        this.dispatchEvent(successToast);
        //reset the form fields
        this.template.querySelector('form.contactform').reset();
      })
      .catch((error) => {
        console.log(error);
        const errorToast = new ShowToastEvent({
          title:"Error",
          message:"An error occurred while saving contact",
          variant: "error"
        });
        this.dispatchEvent(errorToast);
      });
  }
}
