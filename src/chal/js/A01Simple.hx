package chal.js;

class A01Simple extends Base {
  public function new() {
    super("01-simple");
    mainJS = ChallengeMacro.resource("A01.js");
    mainHTML = ChallengeMacro.resource("simple-form.html");
    flag = "emp_java_c0mma_script";
    resources = [
         {link: "https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onload", text: "onload (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementById", text: "getElementById (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/Events/submit", text: "submit (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/API/HTMLInputElement", text: "HTMLInputElement (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/btoa", text: "btoa"}
      ];
  }
}
