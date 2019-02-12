package chal.crypto;

import chal.Challenge;
import chal.HTTP;

using StringTools;

class Base extends Challenge {
  var content:String;
  var resources:Array<{link:String, text:String}>;
  
  public function new(name:String, content:String) {
    super("crypto", name);
    this.content = content;
  }
  
  override public function up():Void {
    http = new HTTP((app, tmp) -> {
        app.post("/", (req, res, next) -> {
            var body = (req.body:haxe.DynamicAccess<String>);
            if (body.exists("flag")) checkFlag(req, body.get("flag"));
            next();
          });
        app.all("/", (req, res) -> {
            res.send(tmp.show("html", {
                 name: name
                ,category: "Cryptography"
                ,content: content
                ,resources: resources
              }));
          });
      });
  }
}
