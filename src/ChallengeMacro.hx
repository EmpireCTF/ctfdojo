import haxe.macro.Context;
import haxe.macro.Expr;

using StringTools;

class ChallengeMacro {
  public static macro function category(name:String):Expr {
    var challengeRE = ~/^A([0-9]{2})[^\.]+\.hx$/;
    var challenges = [ for (file in sys.FileSystem.readDirectory('chal/$name')) {
        if (!challengeRE.match(file)) continue;
        var challengeName = file.substr(0, file.length - 3);
        Context.parse('new chal.${name}.${challengeName}()', Context.currentPos());
      } ];
    return macro $a{challenges};
  }
  
  public static macro function resource(name:String):Expr {
    var pack = Context.getLocalModule().split(".");
    pack.pop();
    var path = pack.join("/");
    var content = sys.io.File.getContent('$path/$name');
    return {expr: EConst(CString(content)), pos: Context.currentPos()};
  }
}
