package chal.php;

import chal.Challenge;
import chal.HTTP;

class Base extends Challenge {
  var mainPHP:String;
  var secretPHP:String = "";
  
  public function new(name:String) {
    super("php", name);
    enabled = (Config.php != null);
  }
  
  function createPHP(name:String, data:String):Void {
    js.node.Fs.writeFileSync('${Config.php.tmpDir}/$name', data);
  }
  
  override public function up():Void {
    if (!js.node.Fs.existsSync(Config.php.tmpDir)) js.node.Fs.mkdirSync(Config.php.tmpDir);
    createPHP("flag.php", '<?php
ini_set("open_basedir", "${Config.php.tmpDir}");
parse_str($$argv[1], $$_GET);
$$FLAG = "${flag}";
${secretPHP}
');
    createPHP("index.php", mainPHP);
    http = new HTTP((app, tmp) -> {
        app.get("/", (req, res) -> {
            var query = "";
            var parts = js.node.Url.parse(req.url, true);
            if (parts.search != null && parts.search.length > 1) query = parts.search.substr(1).split('"').join("");
            js.node.ChildProcess.exec('${Config.php.bin} ${Config.php.tmpDir}/index.php "${query}"', {
                cwd: Config.php.tmpDir
              }, (error, stdout, stderr) -> {
                res.send(tmp.show("php", {
                     name: name
                    ,data: checkFlag(req, stdout)
                  }));
              });
          });
      });
  }
  
  override public function down(done:Void->Void):Void {
    super.down(() -> {
        js.node.ChildProcess.exec('rm -rf ${Config.php.tmpDir}', (_, _, _) -> done());
      });
  }
}
