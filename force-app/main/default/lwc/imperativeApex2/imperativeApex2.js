import searchContacts from "@salesforce/apex/ContactController.SearchContacts";
import { LightningElement } from "lwc";

export default class ImperativeApex2 extends LightningElement {
  contacts;
  error;
  keyword;
  searchHandler(event) {
    this.keyword = event.target.value;
    console.log(this.keyword);
    if(this.keyword.length > 0){
        searchContacts({ searchKey: this.keyword })
        .then((result) => {
          this.contacts = result;
          this.error = undefined;
        })
        .catch((error) => {
          this.error = error;
          this.contacts = undefined;
        });
    }else{
        this.contacts=undefined;
        this.error = 'No contacts found.Type something in order to find matching contacts.';
    }
    
  }
}
