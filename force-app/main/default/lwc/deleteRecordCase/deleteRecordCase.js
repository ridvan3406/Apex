import { LightningElement } from "lwc";
import { deleteRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class DeleteRecordCase extends LightningElement {
  recordId;
  changeHandler(event) {
    this.recordId = event.target.value;
  }
  deleteHandler() {
    // Use the deleteRecord method from Lightning Data Service to delete the record.
    deleteRecord(this.recordId)
      .then(() => {
        // Display a success toast message.
        // this.dispatchEvent(
        //   new ShowToastEvent({
        //     title: "Success",
        //     message: "Case record deleted successfully.",
        //     variant: "warning",
        //   })
        // );
        this.displayToast(
          "Success",
          "Case record deleted successfully.",
          "warning"
        );
      })
      .catch((error) => {
        // Display an error toast message if deletion fails.
        this.displayToast("Error", error.body.message, "error");
      });
  }
  displayToast(title, message, variant) {
    const toast = new ShowToastEvent({ title, message, variant });
    this.dispatchEvent(toast);
  }
}
