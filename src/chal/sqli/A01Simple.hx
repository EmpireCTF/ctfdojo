package chal.sqli;

class A01Simple extends Base {
  public function new() {
    super("01-simple");
    databaseSetup = "CREATE TABLE flag_table (flag TEXT, public BOOL);"
      + "INSERT INTO flag_table(flag, public) VALUES('emp_7his_1s_th3_f4k3_flag', true);"
      + "INSERT INTO flag_table(flag, public) VALUES('emp_c0ngrat5_7his_1s_th3_r34l_flag', false);";
    databaseQuery = [SQL("SELECT flag FROM flag_table WHERE "), InputAny];
    flag = "emp_c0ngrat5_7his_1s_th3_r34l_flag";
    resources = [
         {link: "https://dev.mysql.com/doc/refman/5.7/en/select.html", text: "MySQL SELECT statement reference"}
        ,{link: "http://www.mysqltutorial.org/mysql-where/", text: "MySQL WHERE by example"}
      ];
  }
}
