package chal.js;

class A02XOR extends Base {
  public function new() {
    super("02-xor");
    mainJS = ChallengeMacro.resource("A02.js");
    mainHTML = ChallengeMacro.resource("simple-form.html");
    flag = "emp_mem3xor";
    resources = [
         {link: "https://en.wikipedia.org/wiki/XOR_cipher", text: "XOR cipher (Wikipedia)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions", text: "Functions (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions", text: "Arrow functions (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode", text: "String.fromCharCode (MDN)"}
      ];
  }
}
