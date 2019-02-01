package chal;

class Challenge {
  public var category:String;
  public var name:String;
  public var flag:String;
  public var censored:Array<String>;
  public var http:HTTP;
  public var enabled:Bool = true;
  
  public var challengeId(get, never):String;
  private inline function get_challengeId():String return '$category-$name';
  
  public function new(category:String, name:String) {
    this.category = category;
    this.name = name;
  }
  
  function censor(data:String, ?rep:String):String {
    if (rep == null) rep = "██ CENSORED ██";
    var ret = data.split(flag).join(rep);
    if (censored != null) for (c in censored) ret = ret.split(c).join(rep);
    return ret;
  }
  
  function checkFlag(req, out:String):String {
    if (out.indexOf(flag) != -1) {
      Main.onFlag(req.cookies.login);
    }
    return out;
  }
  
  public function up():Void throw "Challenge.up missing";
  
  public function down(done:Void->Void):Void {
    if (http != null) {
      http.server.close(done);
      http = null;
    } else done();
  }
  
  public function reload():Void down(() -> up());
}
