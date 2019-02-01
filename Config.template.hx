/**
 * This is the template for the configuration file. Copy this file to
 * `Config.hx`, then edit lines as necessary.
 */
class Config {
  /**
   * `flagServer` contains configuration related to the announcement sounds.
   */
  public static var flagServer:{
      sounds:{
           firstBlood:String
          ,rampage:String
        }
      ,playSoundBin:String->String
    } = {
      // Replace `null` with "path/to/a/file.wav" (e.g. "sfx/firstblood.wav")
      // below so the flag server plays the given file when needed.
      // Note that the path should be relative to the built server.js file.
      sounds: {
          // `firstBlood` is played when the flag for a new challenge is first
          // obtained by a client.
          firstBlood: null
          // `rampage` is played when the same client gets first blood 3 times
          // in a row.
          ,rampage: null
        }
      // This is the format of the command line as invoked by the flag server
      // when a sound is to be played:
      ,playSoundBin: snd -> 'sox -q $snd -d'
    };
  
  /**
   * `controlServer` contains configuration related to the control panel
   * accessible to the administrator.
   */
  public static var controlServer:{
       host:String
      ,port:Int
      ,portWS:Int
    } = {
       host: "localhost"
      ,port: 3001
      
      // `portWS` is the socket.io (Websockets) port used by the control panel.
      ,portWS: 3003
    };
  
  /**
   * `http` contains configuration to the HTTP server common to all challenges.
   * This is the server that clients will access to solve challenges.
   */
  public static var http:{
       host:String
      ,port:Int
      ,templateReload:Bool
    } = {
      // Replace "localhost" with an IP address string if clients should be
      // allowed over the network.
      host: "localhost"
      ,port: 3000
      
      // `portWS` is the socket.io (Websockets) port used by the challenges.
      ,portWS: 3002
      
      // `templateReload` should be `true` if the templates in `bin/templates/`
      // should be reloaded every time they are used. Useful when developing
      // new templates.
      ,templateReload: true
    };
  
  /**
   * `php` contains configuration for PHP challenges.
   */
  public static var php:{
       bin:String
      ,tmpDir:String
    }
    // If PHP challenges should be enabled, simply change /* to //* below:
    /*
    = {
      // The path to the binary used to run the PHP challenges. Should be
      // an absolute path unless the binary is in PATH.
      bin: "php"
      
      // Temporary directory created for the duration of a PHP challenge.
      // Should be an absolute path.
      ,tmpDir: "/tmp/ctf-php"
    }
    //*/
  
  /**
   * `sql` contains configuration for SQLi challenges.
   */
  public static var sql:{
       host:String
      ,port:Int
      ,rootUser:String
      ,rootPassword:String
      ,ctfDatabase:String
      ,ctfUser:String
      ,ctfPassword:String
    }
    // If SQLi challenges should be enabled, simply change /* to //* below:
    /*
    = {
      // MySQL connection details:
      host: "localhost"
      ,port: 3306
      
      // Username and password of a user capable of:
      // - creating and deleting databases
      // - creating and deleting users
      // - granting user privileges
      ,rootUser: "root"
      ,rootPassword: "root"
      
      // Name of database used for the challenge.
      // Note: this database should NOT exist! It will be created and destroyed
      // as needed.
      ,ctfDatabase: "ctf-db"
      
      // Username and password of the unprivileged ctf challenge user.
      // Note: this user should NOT exist! It will be created and destroyed
      // as needed.
      ,ctfUser: "ctf"
      ,ctfPassword: "ctf-pass"
    };
    //*/
}
