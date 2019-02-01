package chal.js;

class A05Unicode extends Base {
  public function new() {
    super("05-unicode");
    mainJS = ChallengeMacro.resource("A05.js");
    mainHTML = ChallengeMacro.resource("simple-form.html");
    flag = "emp_gr3333k_7th";
    resources = [
         {link: "https://en.wikipedia.org/wiki/Duplicate_characters_in_Unicode", text: "Duplicate characters in Unicode (Wikipedia)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#Declaring_variables", text: "Declaring variables (MDN)"}
      ];
  }
}
