package chal.sqli;

import chal.Challenge;
import chal.HTTP;

class Base extends Challenge {
  static var CONNECTION_ROOT:NativeMySQLConnection;
  static var CONNECTION_CHALLENGE:NativeMySQLPool;
  
  public var databaseSetup:String;
  public var databaseQuery:Array<QueryPart>;
  public var resources:Array<{link:String, text:String}>;
  public var script:String;
  public var showResults = true;
  
  public function new(name:String) {
    super("sqli", name);
    enabled = (Config.sql != null);
  }
  
  function formatResults(results:Array<Dynamic>):String {
    if (results == null) return null;
    return results.map(Std.string).join("\n");
  }
  
  override public function up():Void {
    if (CONNECTION_ROOT != null) throw "sqli challenge already running";
    CONNECTION_ROOT = NativeMySQL.createConnection({
         user: Config.sql.rootUser
        ,password: Config.sql.rootPassword
        ,multipleStatements: true
      });
    CONNECTION_ROOT.query(
        'SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = "${Config.sql.ctfUser}") AS existed;'
        ,function (error, results, fields):Void {
            if (error != null) trace(error);
            if (results[0].existed != "1") {
              CONNECTION_ROOT.query(
                  'CREATE USER "${Config.sql.ctfUser}"@"${Config.sql.host}";'
                  + 'SET PASSWORD FOR "${Config.sql.ctfUser}"@"${Config.sql.host}" = PASSWORD("${Config.sql.ctfPassword}");'
                  + 'CREATE DATABASE `${Config.sql.ctfDatabase}`;'
                  + 'USE `${Config.sql.ctfDatabase}`;'
                  + databaseSetup
                  + 'GRANT ALL PRIVILEGES ON `${Config.sql.ctfDatabase}`.* TO "${Config.sql.ctfUser}"@"${Config.sql.host}";'
                  + "FLUSH PRIVILEGES;"
                  ,(error, results, fields) -> {
                      if (error != null) trace(error);
                      CONNECTION_CHALLENGE = NativeMySQL.createPool({
                           user: Config.sql.ctfUser
                          ,password: Config.sql.ctfPassword
                          ,connectionLimit: 30
                          ,database: Config.sql.ctfDatabase
                        });
                    }
                );
            } else {
              CONNECTION_CHALLENGE = NativeMySQL.createPool({
                   user: Config.sql.ctfUser
                  ,password: Config.sql.ctfPassword
                  ,connectionLimit: 30
                  ,database: Config.sql.ctfDatabase
                });
            }
          }
      );
    http = new HTTP((app, tmp) -> {
        app.post("/", (req, res, next) -> {
            var body = (req.body:haxe.DynamicAccess<String>);
            if (!body.exists("query")) return next();
            var query = null;
            try {
              query = checkFlag(req, databaseQuery.map(function(part):String return (switch (part) {
                  case InputAny: body.get("query");
                  case InputFilter(filters):
                  for (f in filters) switch (f) {
                    case Words(words, cs):
                    var check = (cs ? body.get("query") : body.get("query").toLowerCase());
                    for (w in words) if (check.indexOf(cs ? w : w.toLowerCase()) != -1) throw 'filter: $w found in query';
                  }
                  body.get("query");
                  case SQL(data): data;
                })).join(""));
              CONNECTION_CHALLENGE.query(query, (error, results, fields) -> {
                  res.send(checkFlag(req, tmp.show("sqli-res", {
                       name: name
                      ,query: query
                      ,error: error
                      ,results: showResults ? formatResults(results) : null
                    })));
                });
            } catch (error:Dynamic) {
              res.send(checkFlag(req, tmp.show("sqli-res", {
                   name: name
                  ,query: query
                  ,error: error
                })));
            }
          });
        app.all("/", (req, res) -> {
            res.send(tmp.show("sqli", {
                 name: name
                ,setup: censor(databaseSetup).split(";").join("\n")
                ,query: databaseQuery.map(function(part):Dynamic return (switch (part) {
                    case InputAny: {type: "input-any"};
                    case InputFilter(filters): {type: "input-filter", filters: [ for (f in filters) switch (f) {
                        case Words(words, true): [ for (word in words) 'if (input.indexOf("$word") !== -1) throw ...' ].join("\n");
                        case Words(words, false): [ for (word in words) 'if (input.toLowerCase().indexOf("${word.toLowerCase()}") !== -1) throw ...' ].join("\n");
                      } ].join("\n")};
                    case SQL(data): {type: "sql", data: data.split(";").join("\n")};
                  }))
                ,resources: resources
                ,script: script
              }));
          });
      });
  }
  
  override public function down(done:Void->Void):Void {
    super.down(() -> {
        if (CONNECTION_ROOT == null) {
          done();
          return;
        }
        CONNECTION_ROOT.query(
            'DROP DATABASE IF EXISTS `${Config.sql.ctfDatabase}`;'
            + 'DROP USER IF EXISTS "${Config.sql.ctfUser}"@"${Config.sql.host}";'
            ,(error, results, fields) -> {
              if (error != null) trace(error);
              CONNECTION_ROOT.end(() -> {
                  CONNECTION_CHALLENGE.end(() -> done());
                  CONNECTION_CHALLENGE = null;
                });
              CONNECTION_ROOT = null;
            }
          );
      });
  }
}

enum QueryPart {
  SQL(_:String);
  InputAny;
  InputFilter(filters:Array<QueryFilter>);
}

enum QueryFilter {
  Words(matches:Array<String>, caseSensitive:Bool);
}

typedef NativeMySQLConnectionOptions = {
     ?host:String
    ,?port:Int
    ,?localAddress:String
    ,?socketPath:String
    ,user:String
    ,password:String
    ,?database:String
    ,?charset:String
    ,?timezone:String
    ,?connectTimeout:Int
    ,?stringifyObjects:Bool
    ,?insecureAuth:Bool
    ,?typeCast:Bool
    ,?queryFormat:Any
    ,?supportBigNumbers:Bool
    ,?bigNumberStrings:Bool
    ,?dateStrings:Bool
    ,?debug:Bool
    ,?trace:Bool
    ,?multipleStatements:Bool
    ,?flags:Any
    ,?ssl:Any
  };

@:jsRequire("mysql")
extern class NativeMySQL {
  static function createConnection(options:NativeMySQLConnectionOptions):NativeMySQLConnection;
  static function createPool(options:{>NativeMySQLConnectionOptions, connectionLimit:Int}):NativeMySQLPool;
}

extern class NativeMySQLConnection {
  function end(done:Void->Void):Void;
  function destroy():Void;
  function query(sql:String, handle:String->Array<Dynamic>->Any->Void):Void;
}

extern class NativeMySQLPool {
  function end(done:Void->Void):Void;
  function query(sql:String, handle:String->Array<Dynamic>->Any->Void):Void;
}
