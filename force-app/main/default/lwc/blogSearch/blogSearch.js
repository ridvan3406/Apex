import getTopicNames from "@salesforce/apex/BlogController.getTopicNames";
import getBlogsByTopic from "@salesforce/apex/BlogController.getBlogsByTopic";
import { LightningElement, wire } from "lwc";
import { NavigationMixin } from "lightning/navigation";

const COLUMNS = [
  {
    label: "Blog Name",
    fieldName: "blogURL",
    type: "url",
    typeAttributes: { label: { fieldName: "Name" }, target: "_blank" },
  },
  { label: "Author", fieldName: "Author__c", type: "text" },
  { label: "Topic", fieldName: "Topic__c", type: "text" },
  { label: "Title", fieldName: "Title__c", type: "text" },
  { label: "Content", fieldName: "Body__c", type: "text" },
];

export default class BlogSearch extends LightningElement {
  topicOptions = [];
  error;
  selectedTopic;
  blogs;
  columns = COLUMNS;

  // Wire the getTopicNames Apex method to topicsHandler
  @wire(getTopicNames)
  topicsHandler({ data, error }) {
    if (data) {
      // If data is available, convert it to picklist options
      this.topicOptions = this.picklistHandler(data);
    }
    if (error) {
      // If an error occurs, handle it (you might want to log it or display a message)
      this.error = error;
    }
  }

  // Helper method to convert data to picklist options
  picklistHandler(data) {
    return data.map((item) => ({ label: item, value: item }));
  }

  changeHandler(event) {
    this.selectedTopic = event.target.value;
    getBlogsByTopic({ topic: this.selectedTopic })
      .then((result) => {
        this.blogs = result.map((blog) => ({
          ...blog,
          blogURL: "/" + blog.Id,
        }));
        this.error = undefined;
      })
      .catch((error) => {
        this.error = error;
        this.blogs = undefined;
      });
  }
  handleRowAction(event) {
    const blogId = event.detail.row.Id;
    if (blogId) {
      // Use the NavigationMixin to navigate to the blog detail page
      this[NavigationMixin.Navigate]({
        type: "standard__recordPage",
        attributes: {
          recordId: blogId,
          actionName: "view",
        },
      });
    }
  }
}
