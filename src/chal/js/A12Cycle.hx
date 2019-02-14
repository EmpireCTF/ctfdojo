package chal.js;

class A12Cycle extends Base {
  public function new() {
    super("12-cycle");
    mainJS = ChallengeMacro.resource("A12.js");
    mainHTML = ChallengeMacro.resource("simple-form.html");
    flag = "emp_false";
    resources = [
         {link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split", text: "split (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/join", text: "join (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf", text: "indexOf (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map", text: "map (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval", text: "eval (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions", text: "Arrow functions (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#Declaring_variables", text: "Declaring variables (MDN)"}
      ];
  }
}
