package chal.js;

/*
emp_b4ck_to_js
    b
emp_4ck_to_js
       _
emp_4ckto_js
           s
emp_4ckto_j
   _
emp4ckto_j
        _
emp4cktoj
  p
em4cktoj
      o
em4cktj
  4
emcktj
     j
emckt
  c
emkt
 m
ekt
 k
et
 t
e
*/
class A09Simplish extends Base {
  public function new() {
    super("09-simplish");
    mainJS = ChallengeMacro.resource("A09.js");
    mainHTML = ChallengeMacro.resource("simple-form.html");
    flag = "emp_b4ck_to_js";
    resources = [
         {link: "https://beautifier.io/", text: "Javascript beautifier"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split", text: "split (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice", text: "splice (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions", text: "Arrow functions (MDN)"}
      ];
  }
}
