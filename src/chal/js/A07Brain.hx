package chal.js;

class A07Brain extends Base {
  public function new() {
    super("07-brain");
    mainJS = ChallengeMacro.resource("A07.js");
    mainHTML = ChallengeMacro.resource("simple-form.html");
    flag = "emp_es0teric_l4nguage";
    resources = [
        {link: "https://esolangs.org/wiki/Brainfuck", text: "Brainfuck (Esolangs)"}
      ];
  }
}
