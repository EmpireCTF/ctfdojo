package chal.js;

class A13AJAX extends Base {
  public function new() {
    super("13-ajax");
    mainJS = ChallengeMacro.resource("A13.js");
    mainHTML = ChallengeMacro.resource("simple-form.html");
    flag = "emp_ajaxyeah";
    resources = [
         {link: "https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch", text: "fetch (MDN)"}
        ,{link: "https://developer.mozilla.org/en-US/docs/Web/API/Blob", text: "Blob (MDN)"}
      ];
  }
  
  override public function up():Void {
    super.up();
    http.native.post("/_tps", (req, res, next) -> {
        var query = (req.query:haxe.DynamicAccess<String>);
        if (query.exists("k") && query.get("k") == "json") {
          checkFlag(req, flag);
          res.send("yup");
        } else res.send("nop");
      });
  }
}
