package chal.js;

class A03Eval extends Base {
  public function new() {
    super("03-eval");
    mainJS = ChallengeMacro.resource("A03.js");
    mainHTML = ChallengeMacro.resource("simple-form.html");
    flag = "emp_how_to_execute_js_in_js_guys";
    resources = [
         {link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval", text: "eval (MDN)"}
        ,{link: "https://en.wikipedia.org/wiki/Eval", text: "eval (Wikipedia)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split", text: "split (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse", text: "reverse (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join", text: "join (MDN)"}
      ];
  }
}
