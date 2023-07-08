import { LightningElement, track } from "lwc";

export default class TrackProperty extends LightningElement {
  @track location = {
    city: "London",
    country: "United States",
    postCode: "KT64RX",
  };
  cityHandler(e) {
    this.location.city = e.target.value;
  }
}
