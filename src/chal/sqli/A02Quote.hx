package chal.sqli;

class A02Quote extends Base {
  public function new() {
    super("02-quote");
    databaseSetup = "CREATE TABLE flag_table (flag TEXT, pw TEXT);"
      + "INSERT INTO flag_table(flag, pw) VALUES('emp_sw0rdf1sh_sw0rdf1sh_sw0rdf1sh', 'swordfish321');";
    databaseQuery = [SQL("SELECT flag FROM flag_table WHERE pw = '"), InputAny, SQL("'")];
    flag = "emp_sw0rdf1sh_sw0rdf1sh_sw0rdf1sh";
    censored = ["swordfish321"];
  }
}
