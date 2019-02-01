import chal.Challenge;

using StringTools;

class Main {
  static var challenges:Array<Challenge>;
  static var activeChallenge:Challenge = null;
  static var activeBoard:Array<String> = [];
  static var globalBoard = new Map<String, Int>();
  static var quiet:Bool;
  static var socketClients:Array<SocketClient> = [];
  
  inline static function formatBoard():Array<{name:String, count:Int}> {
    return [ for (c in activeBoard) {name: c, count: globalBoard[c]} ];
  }
  
  inline static function formatClients():Array<{name:String, last:String, flag:Bool}> {
    return [ for (c in socketClients) if (!c.admin) {name: c.name, last: c.last, flag: activeBoard.indexOf(c.name) != -1} ];
  }
  
  public static function main():Void {
    challenges
      = (ChallengeMacro.category("sqli"):Array<Challenge>)
      .concat(ChallengeMacro.category("php"))
      .concat(ChallengeMacro.category("js"))
      .filter(c -> c.enabled);
    switch (js.Node.process.argv) {
      case [_, _] | [_, _, "-q"]:
      quiet = (js.Node.process.argv[2] == "-q");
      runControl();
      case _: js.Node.console.log("usage: node server.js [-q]");
    }
  }
  
  static function updateBoard():Void {
    for (c in socketClients) if (c.admin) {
      c.native.emit("board", formatBoard());
    }
  }
  
  static function updateClients():Void {
    for (c in socketClients) if (c.admin) {
      c.native.emit("clients", formatClients());
    }
  }
  
  public static function onFlag(by:String):Void {
    if (activeBoard.indexOf(by) == -1) {
      if (activeBoard.length == 0) {
        if (!quiet && Config.flagServer.playSoundBin != null
            && Config.flagServer.sounds.firstBlood != null) {
          js.node.ChildProcess.exec(Config.flagServer.playSoundBin(Config.flagServer.sounds.firstBlood), (_, _, _) -> {});
        }
      }
      activeBoard.push(by);
      updateClients();
      if (!globalBoard.exists(by)) globalBoard[by] = 0;
      globalBoard[by]++;
      updateBoard();
      js.Node.console.log('flag by $by (${globalBoard[by]})');
    }
  }
  
  static function runChallenge(chal:Challenge):Void {
    js.Node.console.log(chal != null ? 'starting challenge ${chal.challengeId}' : 'shutting down challenge');
    ((up) -> (if (activeChallenge != null) activeChallenge.down(up) else up()))(() -> {
        activeChallenge = chal;
        if (chal != null) {
          activeBoard = [];
          updateBoard();
          chal.up();
          for (c in socketClients) if (!c.admin) c.native.emit("reload");
          updateClients();
        }
      });
  }
  
  static function runControl():Void {
    var socketServer = new js.node.socketio.Server();
    socketServer.on("connection", (socket:js.node.socketio.Socket) -> {
        var url:String = js.Syntax.code("{0}.handshake.url", socket);
        var admin = (url.indexOf("admin=swungfu") != -1);
        var name = null;
        var cookieRaw:String = js.Syntax.code("{0}.request.headers.cookie", socket);
        if (js.Syntax.code("{0}", cookieRaw)) {
          var loginRE = ~/login=([A-Za-z0-9\-_\. +]{1,32})(;|$)/;
          if (loginRE.match(cookieRaw)) {
            name = loginRE.matched(1);
          }
        }
        trace(name, admin);
        var client = new SocketClient(socket, admin, name);
        socketClients.push(client);
        socket.emit("board", formatBoard());
        updateClients();
        socket.on("last", (last) -> {
            client.last = last.replace("&", "&amp;").replace("<", "&lt;");
            updateClients();
          });
        socket.on("disconnect", () -> {
            socketClients.remove(client);
            updateClients();
          });
      });
    socketServer.listen(chal.HTTP.cookieParsing(Config.http.host, Config.http.portWS));
    socketServer.listen(chal.HTTP.cookieParsing(Config.controlServer.host, Config.controlServer.portWS));
    var controlServer = new chal.HTTP((app, tmp) -> {
        app.post("/challenge", (req, res, next) -> {
            var body = (req.body:haxe.DynamicAccess<String>);
            if (!body.exists("challengeId")) return res.send("no challenge");
            if (body.get("challengeId") == "none") {
              runChallenge(null);
              return res.send("ok");
            }
            for (c in challenges) if (c.challengeId == body.get("challengeId")) {
              runChallenge(c);
              return res.send("ok");
            }
          });
        app.get("/board", (req, res, next) -> {
            res.send(tmp.show("board", {board: formatBoard()}, {socket: false}));
          });
        app.get("/", (req, res) -> {
            res.send(tmp.show("control", {
                 current: activeChallenge != null ? activeChallenge.challengeId : "(none)"
                ,challenges: challenges
              }, {socket: false}));
          });
      }, {
         config: Config.controlServer
        ,withLogin: false
      });
    js.Node.process.on("SIGINT", () -> {
        ((exit) -> (if (activeChallenge != null) activeChallenge.down(exit) else exit()))(() -> {
            js.Node.process.exit();
          });
      });
    //for (c in challenges) if (c.challengeId == "js-08-anti-re") runChallenge(c);
  }
}

class SocketClient {
  public var native:js.node.socketio.Socket;
  public var admin:Bool;
  public var name:String;
  public var last:String = "(none)";
  
  public function new(native:js.node.socketio.Socket, admin:Bool, name:String) {
    this.native = native;
    this.admin = admin;
    this.name = name;
  }
}
