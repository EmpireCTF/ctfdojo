package chal.js;

class A06Selfref extends Base {
  public function new() {
    super("06-selfref");
    mainJS = ChallengeMacro.resource("A06.js");
    mainHTML = ChallengeMacro.resource("simple-form.html");
    flag = "emp_vizMyself";
    resources = [
        {link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/toString", text: "Function.toString (MDN)"}
      ];
  }
}
