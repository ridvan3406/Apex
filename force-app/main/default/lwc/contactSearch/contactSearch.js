import searchContacts from "@salesforce/apex/ContactController.SearchContacts";
import { LightningElement } from "lwc";

const COLUMNS = [
  { label: "Contact Name", fieldName: "Name", type: "text" },
  { label: "Title", fieldName: "Title", type: "text" },
  { label: "Email", fieldName: "Email", type: "email" },
  { label: "Phone", fieldName: "Phone", type: "tel" },
];

export default class ContactSearch extends LightningElement {
  searchWord;
  contacts;
  error;
  columns = COLUMNS;
  changeHandler(event) {
    this.searchWord = event.target.value;
    if (this.searchWord.length > 0) {
      searchContacts({ searchKey: this.searchWord })
        .then((result) => {
          if (result.length === 0) {
            this.error =
              "There are no matching contacts found.Please Try another keywords.";
            this.contacts = undefined;
            console.log("in if section", result);
          } else {
            this.contacts = result;
            console.log("else", result);
            this.error = undefined;
          }
        })
        .catch((error) => {
          this.error = error;
          this.contacts = undefined;
        });
    }
  }
}
