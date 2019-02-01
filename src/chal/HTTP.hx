package chal;

class HTTP {
  public static function cookieParsing(host:String, port:Int):Any {
    var native = Express.createApp();
    native.use(CookieParser.createParser());
    return native.listen(port, host);
  }
  
  public var server:{close:(Void->Void)->Void};
  var native:ExpressApp;
  var templates:Map<String, haxe.Template>;
  
  public function new(setup:ExpressApp->Templater->Void, ?options:{
       ?withLogin:Bool
      ,?config:{host:String, port:Int}
    }) {
    if (options == null) options = {};
    if (options.withLogin == null) options.withLogin = true;
    if (options.config == null) options.config = Config.http;
    templates = new Map();
    native = Express.createApp();
    native.use(BodyParser.urlencoded({extended: false}));
    native.use(CookieParser.createParser());
    native.use("/assets", Express.serveStatic("assets"));
    function loadTemplate(name:String):haxe.Template {
      return new haxe.Template(js.node.Fs.readFileSync('templates/$name.html', {encoding: "utf-8"}));
    }
    function useTemplate(name:String):haxe.Template {
      if (!templates.exists(name) || Config.http.templateReload) {
        templates[name] = loadTemplate(name);
      }
      return templates[name];
    }
    var templater:Templater = {
        show: (name, data, ?options:TemplateOptions) -> {
            if (options == null) options = {};
            return useTemplate("root").execute({
                 content: useTemplate(name).execute(data)
                ,scripts: options.scripts == null ? [] : options.scripts
                ,socket: options.socket == null ? true : options.socket
                ,socketHost: '${Config.http.host}:${Config.http.portWS}'
              });
          }
        ,raw: (name, data) -> useTemplate(name).execute(data)
      };
    if (options.withLogin) {
      function validLogin(data:String):Bool {
        return ~/^[A-Za-z0-9\-_\. ]{1,32}$/.match(data);
      }
      native.all("*", (req, res, next) -> {
          var body = (req.body:haxe.DynamicAccess<String>);
          if (body.exists("login") && validLogin(body.get("login"))) {
            res.cookie("login", body.get("login"));
            return res.redirect("/");
          }
          var cookies = (req.cookies:haxe.DynamicAccess<String>);
          if (cookies.exists("login") && validLogin(cookies.get("login"))) {
            return next();
          }
          res.send(templater.show("login", {}));
        });
    }
    setup(native, templater);
    server = native.listen(options.config.port, options.config.host);
  }
}

typedef Templater = {
     show:String->Dynamic->?TemplateOptions->String
    ,raw:String->Dynamic->String
  };

typedef TemplateOptions = {
     ?scripts:Array<String>
    ,?socket:Bool
  };

@:jsRequire("express")
extern class Express {
  @:selfCall static function createApp():ExpressApp;
  @:native("static") static function serveStatic(from:String):Any;
}

@:jsRequire("body-parser")
extern class BodyParser {
  static function urlencoded(options:{extended:Bool}):Any;
}

@:jsRequire("cookie-parser")
extern class CookieParser {
  @:selfCall static function createParser():CookieParser;
}

extern class ExpressApp {
  @:overload(function(route:String, mw:Any):ExpressApp {})
  function use(mw:Any):ExpressApp;
  @:overload(function(route:EReg, handler:ExpressRequest->ExpressResponse->(Void->Void)->Void):ExpressApp {})
  @:overload(function(route:String, handler:ExpressRequest->ExpressResponse->(Void->Void)->Void):ExpressApp {})
  function get(route:String, handler:ExpressRequest->ExpressResponse->Void):ExpressApp;
  @:overload(function(route:EReg, handler:ExpressRequest->ExpressResponse->(Void->Void)->Void):ExpressApp {})
  @:overload(function(route:String, handler:ExpressRequest->ExpressResponse->(Void->Void)->Void):ExpressApp {})
  function post(route:String, handler:ExpressRequest->ExpressResponse->Void):ExpressApp;
  @:overload(function(route:EReg, handler:ExpressRequest->ExpressResponse->(Void->Void)->Void):ExpressApp {})
  @:overload(function(route:String, handler:ExpressRequest->ExpressResponse->(Void->Void)->Void):ExpressApp {})
  function all(route:String, handler:ExpressRequest->ExpressResponse->Void):ExpressApp;
  function listen(port:Int, ?host:String):{close:(Void->Void)->Void};
}

extern class ExpressRequest {
  var body:Dynamic;
  var cookies:Dynamic;
  var params:Dynamic;
  var url:String;
}

extern class ExpressResponse {
  function cookie(name:String, value:String):Void;
  function end(data:Any):Void;
  function send(data:Any):Void;
  function redirect(to:String):Void;
}
