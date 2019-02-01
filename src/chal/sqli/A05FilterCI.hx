package chal.sqli;

class A05FilterCI extends Base {
  public function new() {
    super("05-filter-ci");
    databaseSetup = "CREATE TABLE flag_table (flag TEXT, pw TEXT, public BOOL);"
      + "INSERT INTO flag_table VALUES('emp_f4ke_fl4g', 'rob', true);"
      + "INSERT INTO flag_table VALUES('emp_f5ke_fl5g', '654321', true);"
      + "INSERT INTO flag_table VALUES('emp_oper4t0rzzz', 'some spooky password', false);";
    databaseQuery = [SQL("SELECT flag FROM flag_table WHERE pw = '"), InputFilter([
        Words(["OR"], false)
      ])];
    flag = "emp_oper4t0rzzz";
    censored = ["some spooky password"];
    resources = [
        {link: "https://dev.mysql.com/doc/refman/5.7/en/non-typed-operators.html", text: "MySQL operator reference"}
      ];
  }
}
