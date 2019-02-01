package chal.js;

/*
btoa("eval_is_live") === "ZXZhbF9pc19saXZl"
eval("'emp_'+atob('ZXZhbF9pc19saXZl')") === "emp_eval_is_live"
xor([42,0x42],"eval(\"'emp_'+atob('ZXZhbF9pc19saXZl')\")") === "O4K.\x02`\x0d'G2ue\x01#^-Hj\x0d\x18r\x18B l{Z!\x1b{Y#r\x18Fe\x03`\x03"
eval(xor([42,0x42],"O4K.\x02`\x0d'G2ue\x01#^-Hj\x0d\x18r\x18B l{Z!\x1b{Y#r\x18Fe\x03`\x03")) === "emp_eval_is_live"
xor([1,3,3,7],"flag.value===eval(xor([42,0x42],\"O4K.\\x02`\\x0d'G2ue\\x01#^-Hj\\x0d\\x18r\\x18B l{Z!\\x1b{Y#r\\x18Fe\\x03`\\x03\"))")
*/

class A04NestedEval extends Base {
  public function new() {
    super("04-nested-eval");
    mainJS = ChallengeMacro.resource("A04.js");
    mainHTML = ChallengeMacro.resource("simple-form.html") + '<p><img src="/assets/a04/eval.png"></p>';
    flag = "emp_eval_is_live";
  }
}
