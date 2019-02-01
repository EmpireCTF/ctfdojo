package chal.js;

import chal.Challenge;
import chal.HTTP;

using StringTools;

class Base extends Challenge {
  var mainJS:String;
  var mainHTML:String;
  var resources:Array<{link:String, text:String}>;
  
  public function new(name:String) {
    super("js", name);
  }
  
  override public function up():Void {
    http = new HTTP((app, tmp) -> {
        app.post("/", (req, res, next) -> {
            var body = (req.body:haxe.DynamicAccess<String>);
            if (body.exists("flag")) checkFlag(req, body.get("flag"));
            next();
          });
        app.all("/", (req, res) -> {
            res.send(tmp.show("js", {
                 name: name
                ,script: mainJS.replace("&", "&amp;").replace("<", "&lt;")
                ,content: mainHTML
                ,resources: resources
              }, {scripts: [mainJS]}));
          });
      });
  }
}
