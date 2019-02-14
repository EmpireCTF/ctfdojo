package chal.js;

class A10Maze extends Base {
  public function new() {
    super("10-maze");
    mainJS = ChallengeMacro.resource("A10.js");
    mainHTML = ChallengeMacro.resource("simple-form.html");
    flag = "emp_amazingly_mazic";
    resources = [
         {link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/toString", text: "Function.toString (MDN)"}
        ,{link: "https://github.com/EmpireCTF/ctfdojo/blob/master/src/chal/js/A06Commented.js", text: "Self-referential challenge 6"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals", text: "Template literals (MDN)"}
        ,{link: "https://esolangs.org/wiki/Befunge", text: "Befunge (Esoteric language) - some inspiration!"}
      ];
  }
}
