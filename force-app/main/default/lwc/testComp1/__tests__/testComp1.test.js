// // helloWorld.test.js
// import { createElement } from 'lwc';
// import testComp1 from '../../testComp1.js';
 
// describe('c-hello-world', () => {
//   afterEach(() => {
//     while (document.body.firstChild) {
//       document.body.removeChild(document.body.firstChild);
//     }
//   });

//   it('displays the greeting when button is clicked', () => {
//     const element = createElement('c-hello-world', {
//       is: testComp1
//     });
//     document.body.appendChild(element);

//     const button = element.shadowRoot.querySelector('lightning-button');
//     button.click();

//     return Promise.resolve().then(() => {
//       const paragraph = element.shadowRoot.querySelector('p');
//       expect(paragraph.textContent).toBe('Hello, Lightning Web Components!');
//     });
//   });
// });
