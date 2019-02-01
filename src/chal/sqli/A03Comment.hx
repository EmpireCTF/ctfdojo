package chal.sqli;

class A03Comment extends Base {
  public function new() {
    super("03-comment");
    databaseSetup = "CREATE TABLE flag_table (flag TEXT, pw TEXT, public BOOL);"
      + "INSERT INTO flag_table VALUES('emp_f4ke_fl4g', 'bob', true);"
      + "INSERT INTO flag_table VALUES('emp_f5ke_fl5g', '123456', true);"
      + "INSERT INTO flag_table VALUES('emp_f0rget_7h3_r3st', 'SWORDFISH', false);";
    databaseQuery = [SQL("SELECT flag FROM flag_table WHERE pw = '"), InputAny, SQL("' AND public")];
    flag = "emp_f0rget_7h3_r3st";
    resources = [
        {link: "https://dev.mysql.com/doc/refman/5.7/en/comments.html", text: "MySQL comment syntax"}
      ];
  }
}
