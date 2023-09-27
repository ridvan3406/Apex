import { LightningElement } from "lwc";
import BLOG_OBJECT from "@salesforce/schema/Blog__c";
import { createRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class CreateRecordBlog extends LightningElement {
  formData = {};

  changeHandler(event) {
    const { name, value } = event.target;
    this.formData[name] = value;
  }
  resetBlog() {
    this.formData = {};
    this.template.querySelector("form.blogform").reset();
  }

  saveBlog() {
    if (!this.formData.Author__c) {
      this.formData.Author__c = "Anonymous Author";
    }
    const recordInput = {
      apiName: BLOG_OBJECT.objectApiName,
      fields: this.formData,
    };
    createRecord(recordInput)
      .then((result) => {
        console.log(result);
        const successToast = new ShowToastEvent({
          title: "Success",
          message: "Contact has been saved successfully",
          variant: "success",
        });
        this.dispatchEvent(successToast);
        this.resetBlog();
      })
      .catch((error) => console.error(error));
  }
}
