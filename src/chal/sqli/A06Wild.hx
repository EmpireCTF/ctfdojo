package chal.sqli;

class A06Wild extends Base {
  public function new() {
    super("06-wild");
    databaseSetup = "CREATE TABLE flag_table (flag TEXT, pw TEXT);"
      + "INSERT INTO flag_table VALUES('emp_f4ke_fl4g', 'pass=bob');"
      + "INSERT INTO flag_table VALUES('emp_f5ke_fl5g', 'pass=rob');"
      + "INSERT INTO flag_table VALUES('emp_str_w1ld_c4rd', 'pass=manatee');";
    databaseQuery = [SQL("SELECT flag FROM flag_table WHERE pw LIKE 'pass="), InputFilter([
        Words(["'"], false)
      ]), SQL("'")];
    flag = "emp_str_w1ld_c4rd";
    censored = ["manatee"];
    resources = [
        {link: "https://dev.mysql.com/doc/refman/5.7/en/string-comparison-functions.html", text: "MySQL string comparison functions"}
      ];
  }
}
