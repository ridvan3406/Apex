import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { LightningElement, wire } from "lwc";
import BLOG_OBJECT from "@salesforce/schema/Blog__c";

export default class GetRecordInfoBlog extends LightningElement {
  storyRtID;
  lessonRtID;
  @wire(getObjectInfo, { objectApiName: BLOG_OBJECT })
  objectInfoHandler({ data, error }) {
    if (data) {
      console.log("Blog object info: ", data);
      this.storyRtID = data.defaultRecordTypeId;
      const recordtypeIDS=data.recordTypeInfos;
      this.lessonRtID = Object.keys(recordtypeIDS).find(lesson => recordtypeIDS[lesson].name === 'Lesson');
      
    }
    if (error) {
      console.log("error: ", error);
    }
  }
}
