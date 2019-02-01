package chal.sqli;

class A04Filter extends Base {
  public function new() {
    super("04-filter");
    databaseSetup = "CREATE TABLE flag_table (flag TEXT, pw TEXT, public BOOL);"
      + "INSERT INTO flag_table VALUES('emp_f4ke_fl4g', 'rob', true);"
      + "INSERT INTO flag_table VALUES('emp_f5ke_fl5g', '654321', true);"
      + "INSERT INTO flag_table VALUES('emp_c4se_1n_p0in7', 'some hidden password', false);";
    databaseQuery = [SQL("SELECT flag FROM flag_table WHERE pw = '"), InputFilter([
        Words(["OR"], true)
      ])];
    flag = "emp_c4se_1n_p0in7";
    censored = ["some hidden password"];
  }
}
